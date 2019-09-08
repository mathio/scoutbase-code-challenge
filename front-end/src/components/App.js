import React from "react";
import {BrowserRouter as Router, Route} from "react-router-dom";
import {Header} from "./Header";
import {Countries} from "./Countries";
import styled from "styled-components";

const Content = styled.div`
    width: 500px;
    margin: 0 auto;
`;


const AppRouter = () => {
    return (
        <Router>
            <div>
                <Header />
                <Content>
                    <Route path="/" exact component={() => <div />} />
                    <Route path="/countries" component={Countries} exact />
                </Content>
            </div>
        </Router>
    );
};

export default AppRouter;
