import * as APIUtils from "../util/step_api_util";

export const RECIEVE_STEPS = "RECIEVE_STEPS";
export const RECIEVE_STEP = "RECIEVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const recieveSteps = function(steps){
  return {
    type: RECIEVE_STEPS,
    steps
  };
};

export const recieveStep = function(step){
  return {
    type: RECIEVE_STEP,
    step
  };
};

export const createStep = function(step){
  return (dispatch) => {
    return APIUtils.createStep(step).then(res => dispatch(recieveStep(res)));
  };
};

export const removeStep = function(step){
  return {
    type: REMOVE_STEP,
    step
  };
};
