import React from 'react';
import ReactDOM from 'react-dom';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
    this.doneState = this.doneState;
    this.toggleDetail = this.toggleDetail.bind(this);
    this.state = {
      detail: false
    };
  }

  handleDelete() {
    return (e) => {
      e.preventDefault();
      this.props.removeTodo(this.props.todo);
    };
  }

  toggleDone() {
    return (e) => {
      e.preventDefault();
      let oldTodo = this.props.todo;
      let newTodo = Object.assign({}, oldTodo);
      newTodo['done'] = !oldTodo['done'];
      this.props.recieveTodo(newTodo);
    };
  }

  doneState() {
    return this.props.todo.done ? 'Undo' : 'Done';
  }

  toggleDetail() {
    return (e) =>{
      e.preventDefault();
      this.setState({detail: !this.state.detail});
    };
  }

  render() {
    let klass = this.state.detail ? "" : "hidden";
    let title = this.props.todo.title;
    let key = `todo-${this.props.todo.id}`;
    return (
      <div >
        <h2 onClick={this.toggleDetail()}>{title}</h2>
        <button type="submit" onClick={this.toggleDone()}>{this.doneState()}</button>
        <div className={klass}>
          <TodoDetailView body={this.props.todo.body} handleDelete={this.handleDelete} />
        </div>
      </div>
    );
  }
}

export default TodoListItem;
