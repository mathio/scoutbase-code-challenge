import React from "react";
import {Query} from "@apollo/react-components";

export const BaseGraphqlQuery = ({query, children, client}) => (
    <Query query={query} client={client}>
        {({loading, error, data, refetch}) => {
            if (loading) {
                return <p>Loading...</p>;
            }
            if (error) {
                return <p><strong>Error:</strong> {error.message}</p>;
            }
            return children(data, refetch);
        }}
    </Query>
);
