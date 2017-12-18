import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from "../actions/pokemon_actions";
import _ from "lodash";

const pokemonReducer = (state = {}, action) => {
  const newState = _.cloneDeep(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      let keys = Object.keys(action.pokemon)
      for(let i = 0; i < keys.length; i++){
        if(newState[keys[i]]){
          newState[keys[i]] = Object.assign({},newState[keys[i]],
             action.pokemon[keys[i]]);
        }
        else{
          newState[keys[i]] = action.pokemon[keys[i]];
        }
      }
      return newState;
    case RECEIVE_POKEMON:
      newState[action.pokemon.pokemon.id] = action.pokemon.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
