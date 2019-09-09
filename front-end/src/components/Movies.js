import React from "react";
import {GET_MOVIES, GET_MOVIE_DETAILS, GraphqlQuery, login} from "../utils/graphqlClientMovies";
import styled from "styled-components";

const MovieList = styled.ul`
    list-style: none;
    padding: 0;
`;

const MovieItem = styled.li`
    padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px #aaa solid;
    
    p {margin: 5px 0;}
    
    h3 {cursor: pointer; color: blue; text-decoration: underline;}
    
    &:after {
        display: block;
        content: "";
        clear: both;
    }
`;

const MovieColumn = styled.div`
    float: left;
    width: 50%;
`;

const MovieDetailPopup = styled.div`
    width: 800px;
    height: calc(100% - 200px);
    overflow: scroll;
    padding: 50px;
    background: white;
    position: fixed;
    top: 50px;
    left: 50%;
    margin-left: -450px;
    box-shadow: 1px 1px 20px rgba(0,0,0,0.6);
`;

const MovieDetailPopupClose = styled.span`
    display: block;
    float: right;
    text-decoration: underline;
    cursor: pointer;
    color: red;
`;

const MovieDetailPopupBackdrop = styled.div`
    background: rgba(0,0,0,0.5);
    width: 100%;
    height: 100%;
    content: "";
    display: block;
    position: fixed;
    top: 0;
    left: 0;
`;


export class Movies extends React.Component {
    state = {
        movieDetail: null,
        refetch: null
    };

    setToken = (token) => {
        document.TOKEN = token;     // TODO: save the token in a better place
        this.state.refetch();
    }

    render() {
        const {movieDetail} = this.state;

        return (
            <div>
                <h2>Movies</h2>
                <p><strong>Source:</strong> <a href="/graphql">/graphql</a></p>
                <LoginForm setToken={this.setToken} />
                <GraphqlQuery query={GET_MOVIES}>
                    {(data, refetch) => {
                        if (!this.state.refetch) {
                            this.setState({refetch});
                        }
                        return (
                            <MovieList>
                                {data.movies.map(movie => (
                                    <MovieItem key={movie.id}>
                                        <MovieColumn><img src={`https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.poster}`} alt={`Poster: ${movie.title}`} /></MovieColumn>
                                        <MovieColumn>
                                            <h3 onClick={() => this.setState({movieDetail: movie})}>
                                                {movie.title} ({movie.year})
                                            </h3>
                                            <p><strong>Rating:</strong> {movie.rating}</p>
                                            <p><strong>Scoutbase rating:</strong> {movie.scoutbase_rating || "N/A"}</p>
                                        </MovieColumn>
                                    </MovieItem>
                                ))}
                            </MovieList>
                        );
                    }}
                </GraphqlQuery>
                {!movieDetail ? null : (
                    <MovieDetail movie={movieDetail}
                                 close={() => this.setState({movieDetail: null})}
                    />
                )}
            </div>
        );
    }
}

const MovieDetail = ({close, movie}) => (
    <div>
        <MovieDetailPopupBackdrop />
        <MovieDetailPopup>
            <MovieDetailPopupClose onClick={close}>Close</MovieDetailPopupClose>
            <div>
                <MovieColumn>
                    <h3>{movie.title} ({movie.year})</h3>
                    <p><strong>Rating:</strong> {movie.rating}</p>
                    <p><strong>Scoutbase rating:</strong> {movie.scoutbase_rating || "N/A"}</p>
                    <p><img src={`https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.poster}`} alt={`Poster: ${movie.title}`} /></p>
                </MovieColumn>
                <MovieColumn>
                    <GraphqlQuery query={GET_MOVIE_DETAILS(movie.id)}>
                        {(data) => (
                            <div>
                                <h3>Actors</h3>
                                <MoviePeopleList people={data.movie.actors} />
                                <h3>Directors</h3>
                                <MoviePeopleList people={data.movie.directors} />
                            </div>
                        )}
                    </GraphqlQuery>
                </MovieColumn>
            </div>
        </MovieDetailPopup>
    </div>
);

const MoviePeopleList = ({people}) => (
    <ul>
        {people.map(({id, name, birthday, country}) => (
            <li key={id}>
                <strong>{name}</strong><br/><small>{birthday}, {country}</small>
            </li>
        ))}
    </ul>
);

const LoginFormWrapper = styled.form`
    background: #eee;
    padding: 1px 20px 20px 20px;
    margin: 30px 0 50px 0;
    
    div, input, button {display: block; float: left; margin-right: 10px;}
    input, button {padding: 5px 10px}
    button {cursor: pointer}
    
    &:after {
        display: block;
        content: "";
        clear: both;
    }
`;

class LoginForm extends React.Component {
    state = {
        username: "scout",
        password: "base",
        loading: false,
        loginFailed: false,
        loggedUser: ""
    };

    setValue = (name) => ({currentTarget: {value}}) => {
        this.setState({[name]: value})
    }

    submit = async (event) => {
        event.preventDefault();
        const {username, password, loading} = this.state;

        if (!loading) {
            this.setState({loading: true, loginFailed: false});

            let data;
            try {
                data = await login(username, password);
            } catch(e) {
                this.setState({loading: true, loginFailed: true});
            }

            const {data: {login: {token, user}}} = data;

            if (token && user) {
                this.props.setToken(token);
                this.setState({
                    loggedUser: user.name
                });
            } else {
                this.setState({loading: false, loginFailed: true});
            }
        }
    }

    render() {
        const {username, password, loggedUser, loginFailed} = this.state;

        if (loggedUser) {
            return (
                <p>Logged in as: <strong>{loggedUser}</strong></p>
            );
        }

        return (
            <LoginFormWrapper onSubmit={this.submit}>
                <h4>Log in to display Scoutbase rating.</h4>
                <input type="text"
                       value={username}
                       onChange={this.setValue("username")}
                />
                <input type="password"
                       value={password}
                       onChange={this.setValue("password")}
                />
                <button disabled={this.state.loading}>Login</button>
                {loginFailed ? <div>Invalid credentials</div>: ""}
            </LoginFormWrapper>
        );
    }
}
