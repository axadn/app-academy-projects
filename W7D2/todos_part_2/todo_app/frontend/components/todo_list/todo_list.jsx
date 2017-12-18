import React from "react";
import ReactDOM from  "react-dom";
import TodoListItem from './todo_list_item';
import TodoForm from "./todo_form";

class TodoList extends React.Component{
  componentDidMount(){
    this.props.fetchTodos();
  }
  render (){
    let todos = this.props.todos.map((todo, idx) => {
      return (
      <li key={`todo-${idx}`}>

        <TodoListItem
          todo={todo}
          updateTodo = {this.props.updateTodo}
          deleteTodo={this.props.deleteTodo}/>

      </li>);
    });
    return(
      <div>
        <ul>
          {todos}
        </ul>
        <TodoForm errors={this.props.errors} createTodo={this.props.createTodo} store={this.props.store} />
      </div>
    );
  }
}

export default TodoList;
