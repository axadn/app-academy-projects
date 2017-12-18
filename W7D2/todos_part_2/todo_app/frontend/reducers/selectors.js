export const allTodos = function(state){
  let keys = Object.keys(state.todos);
  return keys.map((key) =>{
    return state.todos[key];
  });
};

export const stepsByTodoId = function(state, todoId) {
  let steps = [];
  let keys = Object.keys(state.steps);
  keys.forEach((key) => {
    if (state.steps[key].todo_id === todoId) {
      steps.push(state.steps[key]);
    }
  });
  return steps;
};
