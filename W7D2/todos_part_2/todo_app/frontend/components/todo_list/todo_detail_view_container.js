import TodoDetailView from './todo_detail_view';
import {connect} from "react-redux";
import {recieveTodo, recieveTodos, removeTodo} from "../../actions/todo_actions";
import {recieveSteps} from '../../actions/steps_actions';

const mapStateToProps = function(state){
  return {};
};

const mapDispatchToProps = function(dispatch){
  return {
    recieveSteps: () => dispatch(recieveSteps())
  };
};

export default connect(null, mapDispatchToProps)(TodoDetailView);
