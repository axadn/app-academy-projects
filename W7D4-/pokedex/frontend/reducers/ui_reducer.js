import {RECEIVE_POKEMON, RECEIVE_ALL_POKEMON,
   LOADING_SINGLE_POKEMON} from "../actions/pokemon_actions";
import _ from "lodash";

const uiReducer = (state ={loading :{}}, action)=>{
  Object.freeze(state);
  const newState = _.cloneDeep(state);
  switch(action.type){
    case RECEIVE_POKEMON:
        delete newState.loading.singlePokemon;
        return newState;
    case LOADING_SINGLE_POKEMON:
        newState.loading.singlePokemon = true;
        return newState;
    default:
        return state;
  }
};

export default uiReducer;
