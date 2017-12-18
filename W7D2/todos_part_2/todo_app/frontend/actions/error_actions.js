export const RECIEVE_ERRORS = "RECIEVE_ERRORS";
export const CLEAR_ERRORS = "CLEAR_ERRORS";

export const recieveErrors = (errors) => {
  console.log("errors");
  return {
    type: RECIEVE_ERRORS,
    errors
  };
};

export const clearErrors = () => {
  return {
    type: CLEAR_ERRORS
  };
};
