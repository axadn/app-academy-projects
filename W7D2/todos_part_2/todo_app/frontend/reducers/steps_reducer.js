import {RECIEVE_STEPS, REMOVE_STEP,
   RECIEVE_STEP} from '../actions/steps_actions.js';


const stepsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch(action.type){
    case RECIEVE_STEPS:
      for(let i = 0; i < action.steps.length; ++i){
        newState[action.steps[i].id] = action.steps[i];
      }
      return newState;
    case RECIEVE_STEP:
      newState = Object.assign({}, state);
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      newState = Object.assign({}, state);
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;
