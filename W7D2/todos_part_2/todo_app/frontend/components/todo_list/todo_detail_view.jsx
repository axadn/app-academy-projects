import React from 'react';
import ReactDOM from 'react-dom';
import StepListContainer from '../steps_list/step_list_container';

class TodoDetailView extends React.Component {

  render () {

    return (
      <div>
        <p>{this.props.body}</p>
        <StepListContainer todoId={this.props.todoId} />
        <button type="submit" onClick={this.props.handleDelete()}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;
