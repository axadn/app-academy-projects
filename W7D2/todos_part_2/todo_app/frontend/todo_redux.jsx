import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import App from './components/app';
import { allTodos, stepsByTodoId } from './reducers/selectors';
import * as APIUtils from './util/todo_api_util';
import {recieveSteps} from "./actions/steps_actions";
import configureStore from './store/store';
import {recieveTodos, recieveTodo} from "./actions/todo_actions";

let store = configureStore();

let steps = [
     { // this is the step with id = 1
      id: 1,
      title: 'walk to store',
      done: false,
      todo_id: 39
    },
     { // this is the step with id = 2
      id: 2,
      title: 'buy soap',
      done: false,
      todo_id: 38
    }
  ];
  store.dispatch(recieveSteps(steps));

document.addEventListener('DOMContentLoaded',function(){
  ReactDOM.render(<Root store ={store}/>, document.getElementById('content'));
});

window.store = store;
window.allTodos = allTodos;
window.stepsByTodoId = stepsByTodoId;
