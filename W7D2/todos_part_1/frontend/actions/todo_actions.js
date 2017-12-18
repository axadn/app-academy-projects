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
