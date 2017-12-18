import {connect} from "react-redux";
import StepList from "./step_list";
import {stepsByTodoId} from "../../reducers/selectors";
import {createStep} from '../../actions/steps_actions';

const mapStateToProps = function(state, ownProps){
  let todoId = ownProps.todoId;
  let steps = stepsByTodoId(state, todoId);
  return {steps, todoId};
};

const mapDispatchToProps = function(dispatch) {
  return {
    createStep: (step) => dispatch(createStep(step))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
