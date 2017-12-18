import React from 'react';
import {Link} from "react-router-dom";

const PokemonIndexItem = ({pokemon}) => (
  <li>
    <Link to={`/pokemon/${pokemon.id}`}>{pokemon.name}</Link>
    <img src={pokemon.image_url} width="50px" height="50px"></img>
  </li>
);

export default PokemonIndexItem;
