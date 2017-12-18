
export const fetchTodos = () => {
  return $.ajax(
    {method: "GET",
    url: "/api/todos"
    });
};

export const createTodo = (todo) => {
  let result = $.ajax(
    {method: "POST",
    url: "/api/todos",
    data: {todo}
  });
    return result;
};

export const updateTodo = (todo) => {
  return $.ajax(
    {
      method: "PATCH",
      url: `/api/todos/${todo.id}`,
      data: {todo}
    });
};

export const deleteTodo = (todo) => {
  return $.ajax(
    {
      method: "DELETE",
      url: `/api/todos/${todo.id}`,
      data: {todo}
    });
};
