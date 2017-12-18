import {connect} from "react-redux";
import TodoList from "./todo_list";
import allTodos from "../../reducers/selectors";
import {recieveTodo, recieveTodos, removeTodo} from "../../actions/todo_actions";

const mapStateToProps = function(state){
  let todos = allTodos(state);
  return {todos};
};

const mapDispatchToProps = function(dispatch){
  return {
    recieveTodo:  (todo) => dispatch(recieveTodo(todo)),
    removeTodo:   (todo) => dispatch(removeTodo(todo))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
