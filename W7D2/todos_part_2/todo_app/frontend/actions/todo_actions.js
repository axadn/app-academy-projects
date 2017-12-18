import * as APIUtils from "../util/todo_api_util";
import { recieveErrors, clearErrors } from "./error_actions";

export const RECIEVE_TODOS = "RECIEVE_TODOS";
export const RECIEVE_TODO = "RECIEVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";


export const recieveTodos = function(todos){
  return {
    type: RECIEVE_TODOS,
    todos
  };
};

export const recieveTodo = function(todo) {
  return {
    type: RECIEVE_TODO,
    todo
  };
};

export const removeTodo = function(todo) {
  return {
    type: REMOVE_TODO,
    todo
  };
};

export const deleteTodo = function(todo){
  return (dispatch) => {
    return APIUtils.deleteTodo(todo).then(res => dispatch(removeTodo(todo)));
  };
};

export const fetchTodos = function() {
  return (dispatch) => {
    return APIUtils.fetchTodos().then(res => dispatch(recieveTodos(res)));
  };
};

export const createTodo = function (todo, callback){
  return (dispatch) => {
    return APIUtils.createTodo(todo)
      .then(
        res => {
          dispatch(recieveTodo(res));
          dispatch(clearErrors());
          },
        err => {
          dispatch(recieveErrors(err.responseJSON));
          }
      ).then(callback);
  };
};

export const updateTodo = function (todo, callback){
  return (dispatch) => {
    return APIUtils.updateTodo(todo)
    .then(res => dispatch(recieveTodo(res)),
    err => dispatch(recieveErrors(err.responseJSON)));
  };

};
window.fetchTodos = fetchTodos;
