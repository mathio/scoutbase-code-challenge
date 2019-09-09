import React from "react";
import {GET_COUNTRY_DETAILS, GraphqlQuery} from "../utils/graphqlClientCountries";

export const Country = ({match: {params: {code}}}) => {
    return (
        <div>
            <GraphqlQuery query={GET_COUNTRY_DETAILS(code)}>
                {(data) => {
                    if (!data || !data.country) {
                        return <p>Country for {code} does not exist.</p>;
                    }
                    const {country} = data;
                    return (
                        <div>
                            <h2>{country.emoji} {country.name}</h2>
                            <p><strong>Currency:</strong> {country.currency}</p>
                            <p><strong>Phone area code:</strong> +{country.phone}</p>
                        </div>
                    );
                }}
            </GraphqlQuery>
        </div>
    );
};
