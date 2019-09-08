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
`;

const Menu = styled.ul`
    text-align: center;
    margin-top: 10px;
`;

const MenuItem = styled.li`
    display: inline-block;
    margin-left: 10px;
`;

export const Header = () => (
    <Wrapper>
        <Title>Scoutbase Code Challenge</Title>
        <Menu>
            <MenuItem>
                <Link to="/">Home</Link>
            </MenuItem>
            <MenuItem>
                <Link to="/countries">Countries</Link>
            </MenuItem>
        </Menu>
    </Wrapper>
);
