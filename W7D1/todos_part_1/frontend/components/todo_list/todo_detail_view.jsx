import React from 'react';
import ReactDOM from 'react-dom';

class TodoDetailView extends React.Component {

  render () {

    return (
      <div>
        <p>{this.props.body}</p>
        <button type="submit" onClick={this.props.handleDelete()}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;
