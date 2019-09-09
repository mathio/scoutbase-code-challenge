# Front-end task of Code Challenge for Scoutbase

This task is for demonstrating your understanding of HTML, CSS, Javascript, React & related libraries.

If you’re doing the front-end only, you must use the https://countries.trevorblades.com endpoint for GraphQL API.

Preferred libraries:

1. `styled-components` for styling
2. `apollo-client` for consuming GraphQL API
3. `react-router` or any alternative to implement routing

Instructions:

1. Create a `create-react-app` repo.
2. Add a router with routes:
  - `/app` - for displaying basic links for the other routes
  - `/app/countries` - for requesting GraphQL API and rendering the list
  - `/app/countries/(:code)` - for requesting GraphQL API and rendering the properties of a country
3. Design is totally by you.
4. Countries list at `/app/countries` must contain the list of countries and the languages spoken in that country. Both in English and native languages. It should also contain the continent it is located in.
5. `/app/countries/(:code)` must render the currency and a area code (phone) of that country.
6. Routes must be fully loadable with a direct link. `/app/countries/CI` must render the page for Ivory Coast, for example.
7. End.

**Note:** Front-end app will use `/app` prefix to allow deployment on single server with `back-end`.


# Running and building

Run the project for development:

```
yarn start
```

Build production bundle:


```
yarn build
```
