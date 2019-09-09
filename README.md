# Code Challenge for Scoutbase

If you’re reading this, then you’ve applied for a position at Scoutbase.

This directory includes two subdirectories:

- `front-end` with focus on React, SSR, Apollo & `styled-components`
- `back-end` with focus on SQL, Node.js, GraphQL

You can do one or you can do two.

## Instructions

You have received this directory within the .zip archive.

1. Create a repo out of the directory with this `README.md` in the root of it.
2. Work on either task following the guidelines in `README.md` within chosen directory.
3. Follow best practices of saving changes to the repo.
4. Upload the repo to your personal Github account and share it with two collaborators:
  1. `Yaass` username – Yassin Askar, co-founder of Scoutbase
  2. `kuka` username – Kuanysh, consultant
5. Expect a response within 10 working days after sharing the task, you’ll be contacted with the info you’ve provided during initial registration.


# Development

Each package is developed separately. See respective README files:

* [front-end/README](./front-end/README.md)
* [back-end/README](./back-end/README.md)


# Deployment

When the app is deployed to heroku build script is run:

```
yarn heroku-postbuild
```

The script installs dependecies for both *front-end* and *back-end*. The it builds *front-end* using `yarn build`.

Heroku dyno runs `node ./back-end/index.js` to serve both *front-end* and *back-end*.

# Heroku deployment

App URL: [scoutbase-code-challenge-28.herokuapp.com](https://scoutbase-code-challenge-28.herokuapp.com/)

The *front-end* deployed on Heroku allows you to 
[log in using existing credentials](https://scoutbase-code-challenge-28.herokuapp.com/app/movies). 
You can create your credentials using the `login` mutation in the GraphQL playground or use 
default ones pre-filled in the form.
