import React from "react";
import {BrowserRouter as Router, Route} from "react-router-dom";
import {Header} from "./Header";
import {Countries} from "./Countries";
import {Country} from "./Country";
import {Movies} from "./Movies";
import styled from "styled-components";

const Content = styled.div`
    width: 700px;
    margin: 0 auto;
`;


const AppRouter = () => {
    return (
        <Router>
            <div>
                <Header />
                <Content>
                    <Route path="/app" exact component={() => <div />} />
                    <Route path="/app/countries" component={Countries} exact />
                    <Route path="/app/countries/:code" component={Country} exact />
                    <Route path="/app/movies" component={Movies} exact />
                </Content>
            </div>
        </Router>
    );
};

export default AppRouter;
