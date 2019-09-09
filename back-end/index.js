const express = require("express");
const { Pool } = require("pg");
const { ApolloServer, gql } = require("apollo-server-express");

const app = express();
const port = 3001;

const pool = new Pool({
    connectionString: process.env.DATABASE_URL + "?ssl=true"
});

const path = "/graphql";

app.get("/", (req, res) => res.send(`<a href="${path}">GraphQL API</a>`));

const typeDefs = gql`
  type Movie {
    id: ID!
    title: String
    year: String
    rating: String
    poster: String
    actors: [Person]
    directors: [Person]
  }
  
  type Person {
    id: ID
    name: String
    birthday: String
    country: String
  }

  type Query {
    movies: [Movie]
    movie(id: ID): Movie
  }
`;

const selectPeople = async (movieId, role) => {
    const people = await pool.query(`
                select "id", "name", "birthday", "country" 
                from "people" 
                left join "movie_person" on "id" = "person_id"
                where "movie_id" = $1
                and "role" = '${role}'
            `, [ movieId ]);
    return people.rows.map(mapPerson);
};

const mapPerson = (person) => ({
    ...person,
    birthday: new Date(person.birthday).toLocaleDateString()
});

const resolvers = {
    Movie: {
        actors: (movie) => selectPeople(movie.id, "actor"),
        directors: (movie) => selectPeople(movie.id, "director")
    },
    Query: {
        movies: async () => {
            const movies = await pool.query(
                `select "id", "title", "year", "rating", "poster" from "movies"`
            );
            return movies.rows;
        },
        movie: async (_obj, {id}) => {
            const movies = await pool.query(
                `select "id", "title", "year", "rating", "poster" from "movies" where "id" = $1`,
                [id]
            );
            return movies.rows[0];
        }
    }
};

const server = new ApolloServer({ typeDefs, resolvers });
server.applyMiddleware({ app, path });

app.listen(port, () => console.log(`back-end @ ${port}`));
