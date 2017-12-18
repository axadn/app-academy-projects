const thunkMiddleware = store => next => action => {
  if (action instanceof Function) {
    action(store.dispatch);
  } else {
    next(action);
  }
};

export default thunkMiddleware;
