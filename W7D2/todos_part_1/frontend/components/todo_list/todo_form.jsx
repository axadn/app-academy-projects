import React from "react";
import ReactDOM from "react-dom";
import uniqueId from "../../util";
import * as Util from "../../util";

class TodoForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateState = this.updateState.bind(this);
  }

  componentDidMount() {
    document.querySelector('.todo-form button').addEventListener('click', (e) => {
      this.handleSubmit(e);
    });
  }

  handleSubmit(event){
    event.preventDefault();
    let todo = {
      id: Util.uniqueId(),
      title: this.state.title,
      body: this.state.body,
      done: false
    };
    console.log(todo);
    this.props.recieveTodo(todo);
    this.setState({ title: "",
                    body: ""});
  }

  updateState(key) {
    return (event =>{
      return this.setState({ [key]: event.currentTarget.value } );
    });
  }

  render(){
    let form = (
      <form className="todo-form">
        <label>
          Title
          <input
            type="text"
            className="input"
            onChange={this.updateState('title')}
            value={this.state.title}>
          </input>
        </label>
        <br /><br />
        <label>
          Body
          <textarea
            onChange={this.updateState('body')}
            value={this.state.body}>

          </textarea>
        </label>
        <br /><br />
        <button type ="sumbit">Submit</button>
      </form>
    );
    return form;
  }
}

export default TodoForm;
