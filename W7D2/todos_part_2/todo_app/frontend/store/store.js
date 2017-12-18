import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import {thunkMiddleware} from '../middleware/thunk';
import {applyMiddleware} from 'redux';

const configureStore = () => {
  const store = createStore(rootReducer, applyMiddleware(thunkMiddleware) );
  return store;
};

export default configureStore;
