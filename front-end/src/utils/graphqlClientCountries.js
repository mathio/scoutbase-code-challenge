import React from "react";
import {InMemoryCache} from "apollo-cache-inmemory";
import {HttpLink} from "apollo-link-http";
import ApolloClient from "apollo-client";
import gql from "graphql-tag";
import {BaseGraphqlQuery} from "./graphqlClient";

const cache = new InMemoryCache();
const link = new HttpLink({uri: "https://countries.trevorblades.com"});

const client = new ApolloClient({cache, link});

export const GET_COUNTRIES = gql`
{
    countries {
        code
        name
        languages {
            name
            native
        }
        continent {
            name
        }
    }
}
`;

export const GET_COUNTRY_DETAILS = (code) => gql`
{
    country(code:"${code}") {
        name
        currency
        phone
        emoji   
    }
}
`;

export const GraphqlQuery = (props) => (
    <BaseGraphqlQuery {...props} client={client} />
);
