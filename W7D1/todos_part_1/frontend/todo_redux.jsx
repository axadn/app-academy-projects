import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import App from './components/app';
import allTodos from './reducers/selectors';

import configureStore from './store/store';
import {recieveTodos, recieveTodo} from "./actions/todo_actions";

let store = configureStore();

document.addEventListener('DOMContentLoaded',function(){
  ReactDOM.render(<Root store ={store}/>, document.getElementById('content'));
});

window.store = store;
window.allTodos = allTodos;

console.log(allTodos);
