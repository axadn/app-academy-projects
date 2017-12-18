import React from "react";
import ReactDOM from  "react-dom";
import TodoListItem from './todo_list_item';
import TodoForm from "./todo_form";

class TodoList extends React.Component{
  render (){
    let todos = this.props.todos.map((todo, idx) => {
      return (
      <li key={`todo-${idx}`}>

        <TodoListItem
          todo={todo}
          recieveTodo = {this.props.recieveTodo}
          removeTodo={this.props.removeTodo}/>

      </li>);
    });
    return(
      <div>
        <ul>
          {todos}
        </ul>
        <TodoForm recieveTodo={this.props.recieveTodo} store={this.props.store}/>
      </div>
    );
  }
}

export default TodoList;
