import React from "react";
import { Link } from "react-router-dom";
import {GET_COUNTRIES, GraphqlQuery} from "../utils/graphqlClientCountries";
import styled from "styled-components";

const CountryItem = styled.li`
    margin-bottom: 30px;
    
    p {margin: 5px 0;}
`;


export const Countries = () => {
    return (
        <div>
            <h2>Countries</h2>
            <p><strong>Source:</strong> <a href="https://countries.trevorblades.com/">countries.trevorblades.com</a></p>
            <GraphqlQuery query={GET_COUNTRIES}>
                {(data) => (
                    <ul>
                        {data.countries.map(country => (
                            <CountryItem key={country.code}>
                                <h3><Link to={`/app/countries/${country.code}`}>{country.name}</Link></h3>
                                <p><strong>Continent:</strong> {country.continent.name}</p>
                                <p><strong>Languages:</strong></p>
                                <ul>
                                    {country.languages.map(language => (
                                        <li key={language.name}>{language.name} ({language.native})</li>
                                    ))}
                                </ul>
                            </CountryItem>
                        ))}
                    </ul>
                )}
            </GraphqlQuery>
        </div>
    );
};
