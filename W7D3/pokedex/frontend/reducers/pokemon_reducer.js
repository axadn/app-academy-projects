import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from "../actions/pokemon_actions";

const pokemonReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_POKEMON:
      return state;
    default:
      return state;
  }
};

export default pokemonReducer;
