export const createStep = (step) =>{
  return $.ajax({
    method: "POST",
    url: `/api/todos/${step.todo_id}/steps`,
    data: {step}
  });
};
