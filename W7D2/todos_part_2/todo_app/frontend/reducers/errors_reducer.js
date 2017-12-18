import {RECIEVE_ERRORS, CLEAR_ERRORS} from "../actions/error_actions";

const errorsReducer = (state = [], action) =>{
  switch(action.type){
    case RECIEVE_ERRORS:
      return action.errors;
    case CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};
export default errorsReducer;
