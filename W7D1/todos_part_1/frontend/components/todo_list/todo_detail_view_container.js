import TodoDetailView from './todo_detail_view';
import {connect} from "react-redux";
import {recieveTodo, recieveTodos, removeTodo} from "../../actions/todo_actions";

const mapStateToProps = function(state){
  return {};
};

const mapDispatchToProps = function(dispatch){
  return {
    removeTodo:   (todo) => dispatch(removeTodo(todo))
  };
};

export default connect(null, mapDispatchToProps)(TodoDetailView);
