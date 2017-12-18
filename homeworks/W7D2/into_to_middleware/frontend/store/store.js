import { createStore,applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => {
  const dispatch = store.dispatch;
  return action => {
    console.log("oldstate: ", store.getState());
    console.log(action);
    next(action);
    console.log("new state:", store.getState());
  };
};
const alertNext = store => next => action => {
  window.alert(next);
  next(action);
}

const alertNextAndWalrus = store => next => action => {
  window.alert("walrus :" + next);
  next(action);
}

const alertThatILikeAlerts = store => next => action => {
  window.alert("<3 Alert <3");
  next(action);
}
const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState,
    applyMiddleware(alertNext, alertThatILikeAlerts,
      addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
