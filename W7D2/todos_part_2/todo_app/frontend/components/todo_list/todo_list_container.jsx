import {connect} from "react-redux";
import TodoList from "./todo_list";
import { allTodos } from "../../reducers/selectors";
import {updateTodo, createTodo, recieveTodos, deleteTodo, fetchTodos} from "../../actions/todo_actions";

const mapStateToProps = function(state, ownProps){
  console.log('todo_list_container ownprops: ', ownProps);
  let todos = allTodos(state);
  let errors = state.errors;
  return {todos, errors};
};

const mapDispatchToProps = function(dispatch){
  return {
    createTodo:  (todo, callback) => {
     dispatch(createTodo(todo, callback));
    },
    deleteTodo:   (todo) => dispatch(deleteTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos()),
    updateTodo: (todo, callback) => dispatch(updateTodo(todo,callback)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
