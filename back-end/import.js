const rp = require("request-promise-native");
const { Client } = require("pg");

const client = new Client({
    connectionString: process.env.DATABASE_URL + "?ssl=true"
});

client.connect();

// const result = client.query("SELECT $1::text as message", ["foobar"]);

const apiPrefix = "https://api.themoviedb.org/3";
const apiKey = process.env.THEMOVIEDB_TOKEN;

if (!apiKey) {
    throw "Set THEMOVIEDB_TOKEN. See: https://developers.themoviedb.org/3/getting-started";
}

const getOrInsertCountry = async (name) => {
    const countryResult = await client.query(`select "id" from "countries" where "name" = $1`, [name]);

    if (countryResult.rows.length > 0) {
        return countryResult.rows[0].id;
    } else {
        const insertCountryResult = await client.query(`insert into "countries" ("name") values ($1) returning "id"`, [
            name,
        ]);
        return insertCountryResult.rows[0].id;
    }
};

const getPersonDetails = async (creditId) => {
    const creditsResponse = await rp(`${apiPrefix}/credit/${creditId}?api_key=${apiKey}`);
    const credits = JSON.parse(creditsResponse);



    if (credits.person && credits.person.id) {
        const personResponse = await rp(`${apiPrefix}/person/${credits.person.id}?api_key=${apiKey}`);
        const person = JSON.parse(personResponse);

        const {id, name, birthday, place_of_birth} = person;
        return {id, name, birthday, place_of_birth};
    } else {
        return null;
    }
};

const getPeopleForMovie = async (movieId) => {
    const movieCreditsResponse = await rp(`${apiPrefix}/movie/${movieId}/credits?api_key=${apiKey}`);
    const movieCredits = JSON.parse(movieCreditsResponse);

    const people = [];
    for (let i = 0; i < Math.min(movieCredits.cast.length, 10); i += 1) {
        people.push({
            ...await getPersonDetails(movieCredits.cast[i].credit_id),
            role: "actor"
        });
    }

    const director = movieCredits.crew.find(value => value.job === "Director");
    if (director && director.id) {
        people.push({
            ...await getPersonDetails(director.credit_id),
            role: "director"
        });
    }

    return people;
};

const importMovies = async () => {
    await client.query(`
        truncate table "movies" cascade;
        truncate table "people" cascade;
        truncate table "movie_person" cascade;
    `);

    const latestMoviesResponse = await rp(`${apiPrefix}/movie/now_playing?api_key=${apiKey}`);
    const latestMovies = JSON.parse(latestMoviesResponse);

    for (let i = 0; i < latestMovies.results.length; i += 1) {
        const {id, original_title, release_date, vote_average, backdrop_path} = latestMovies.results[i];

        let movieId;
        try {
            const movieResult = await client.query(`insert into "movies" ("id", "title", "year", "rating", "poster") values ($1, $2, $3, $4, $5) returning "id"`, [
                id,
                original_title,
                release_date.substring(0, 4),
                vote_average,
                backdrop_path       // https://image.tmdb.org/t/p/w300_and_h450_bestv2/
            ]);
            movieId = movieResult.rows[0].id;
        } catch (e) {
            console.log("already inserted", id, original_title);
        }

        if (movieId) {
            console.log("insert", id, original_title);

            const people = await getPeopleForMovie(movieId);

            for (let i = 0; i < people.length; i += 1) {
                const person = people[i];
                const {id, name, birthday, role, place_of_birth} = person;

                const personExists = await client.query(`select count(id) as "num" from "people" where "id" = $1`, [id]);
                if (personExists.rows[0].num == 0) {
                    await client.query(`insert into "people" ("id", "name", "birthday", "country") values ($1, $2, $3, $4)`, [
                        id,
                        name,
                        birthday,
                        place_of_birth
                    ]);
                }

                await client.query(`insert into "movie_person" ("movie_id", "person_id", "role") values ($1, $2, $3)`, [
                    movieId,
                    id,
                    role
                ]);
            }
        }
    }

    client.end();
};

importMovies();
