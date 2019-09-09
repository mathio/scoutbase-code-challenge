import React from "react";
import {Link} from "react-router-dom";
import styled from "styled-components";

const Wrapper = styled.div`
    border-bottom: 3px navy solid;
    padding: 20px 0;
`;


const Title = styled.h1`
    text-align: center;
    color: navy;
    
    a {color: navy; text-decoration: none}
`;

const Menu = styled.ul`
    text-align: center;
    margin-top: 10px;
`;

const MenuItem = styled.li`
    display: inline-block;
    margin-left: 20px;
    
    &:first-child {
        margin-left: 0;
    }
`;

export const Header = () => (
    <Wrapper>
        <Title><a href="/">Scoutbase Code Challenge</a></Title>
        <Menu>
            <MenuItem>
                <Link to="/app">Home</Link>
            </MenuItem>
            <MenuItem>
                <Link to="/app/countries">Countries</Link>
            </MenuItem>
            <MenuItem>
                <Link to="/app/movies">Movies</Link>
            </MenuItem>
        </Menu>
    </Wrapper>
);
