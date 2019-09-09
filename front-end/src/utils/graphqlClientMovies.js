import React from "react";
import {InMemoryCache} from "apollo-cache-inmemory";
import {HttpLink} from "apollo-link-http";
import {setContext} from "apollo-link-context";
import ApolloClient from "apollo-client";
import gql from "graphql-tag";
import {BaseGraphqlQuery} from "./graphqlClient";

const cache = new InMemoryCache();
const httpLink = new HttpLink({uri: "/graphql"});

const authLink = setContext((_, {headers}) => {
    const token = document.TOKEN;
    return {
        headers: {
            ...headers,
            token,
        }
    }
});

const client = new ApolloClient({
    cache,
    link: authLink.concat(httpLink)
});

export const GET_MOVIES = gql`
{
    movies {
        id
        title
        year
        rating
        scoutbase_rating
        poster
    }
}
`;

export const GET_MOVIE_DETAILS = (id) => gql`
{
    movie(id:"${id}") {
        actors {
            id
            name
            birthday
            country
        }
        directors {
            id
            name
            birthday
            country
        }
    }
}
`;

export const login = (username, password) =>
    client.mutate({
        mutation: gql`
            mutation login($username: String, $password: String) {
                login(username: $username, password: $password) {
                    token
                    user {
                        id
                        name
                    }
                }
            }
        `,
        variables: {
            username,
            password
        },
    });

export const GraphqlQuery = (props) => (
    <BaseGraphqlQuery {...props} client={client} />
);
