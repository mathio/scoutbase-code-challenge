const express = require("express");
const { Pool } = require("pg");
const { ApolloServer, gql } = require("apollo-server-express");
const uuidv1 = require("uuid/v1");
const path = require("path");

const app = express();
const port = 3001;

const pool = new Pool({
    connectionString: process.env.DATABASE_URL + "?ssl=true"
});

const getUserToken = () => uuidv1();

const getScoutbaseRating = () => Math.floor((Math.random() * 5 + 5) * 100) / 100;

const apiPath = "/graphql";

app.get("/", (req, res) => res.send(`
    <ul>
        <li><a href="/app">Front-end</a></li>
        <li><a href="${apiPath}">GraphQL API</a></li>
    </ul>
`));

app.use("/app/static", express.static("../front-end/build/static"));
app.use("/app*", express.static("../front-end/build/index.html"));

const typeDefs = gql`
  type Movie {
    id: ID!
    scoutbase_rating: String
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
  
  type LoginResponse {
    token: String
    user: User
  }
  
  type User {
    id: ID
    name: String
  }

  type Query {
    movies: [Movie]
    movie(id: ID): Movie
    users: [User]
  }
  
  type Mutation {
    createUser(username: String, password: String): LoginResponse
    login(username: String, password: String): LoginResponse
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

const mapMovie = (context) => (movie) => {
    if (context.user && context.user.id) {
        return {
            ...movie,
            scoutbase_rating: getScoutbaseRating()
        };
    } else {
        return movie;
    }
};

const resolvers = {
    Movie: {
        actors: (movie) => selectPeople(movie.id, "actor"),
        directors: (movie) => selectPeople(movie.id, "director")
    },
    Query: {
        movies: async (_obj, _args, context) => {
            const movies = await pool.query(
                `select "id", "title", "year", "rating", "poster" from "movies"`
            );
            return movies.rows.map(mapMovie(context));
        },
        movie: async (_obj, {id}, context) => {
            const movies = await pool.query(
                `select "id", "title", "year", "rating", "poster" from "movies" where "id" = $1`,
                [id]
            );
            return movies.rows.map(mapMovie(context))[0];
        },
        users: async () => {
            const users = await pool.query(
                `select "id", "username" from "users"`
            );
            return users.rows;
        }
    },
    Mutation: {
        createUser: async (parent, {username, password}) => {
            const token = getUserToken();
            const existingUser = await pool.query(
                `select count("id") as "num" from "users" where "username" = $1`,
                [username]
            );

            if (existingUser.rows[0].num !== "0") {
                return {};
            }

            const user = await pool.query(
                `insert into "users" ("username", "password", "token") 
                values ($1, crypt($2, gen_salt('md5')), $3) 
                returning "id"`,
                [username, password, token]
            );
            return {
                token,
                user: {
                    id: user.rows[0].id,
                    name: username
                }
            };
        },
        login: async (parent, {username, password}) => {
            const token = getUserToken();
            const user = await pool.query(
                `update "users" 
                set "token" = $1 
                where "username" = $2 and "password" = crypt($3, "password") 
                returning "id"`,
                [token, username, password]
            );
            if (user.rows.length === 0) {
                return {};
            } else {
                return {
                    token,
                    user: {
                        id: user.rows[0].id,
                        name: username
                    }
                };
            }
        }
    }
};

const server = new ApolloServer({
    typeDefs,
    resolvers,
    context: async ({req}) => {
        const token = req.headers.token;

        if (token) {
            const user = await pool.query(`select "id", "username" as "name" from "users" where "token" = $1`, [token]);

            return {
                user: user.rows[0],
                token
            };
        } else {
            return {};
        }
    },
});

server.applyMiddleware({ app, path: apiPath });

app.listen(port, () => console.log(`back-end @ ${port}`));
