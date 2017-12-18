import React from 'react';
import ReactDOM from 'react-dom';
import * as Util from "../../util/util";


class StepList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };

    this.updateState = this.updateState.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateState(key) {
    return (e) => {
      e.preventDefault();
      let val = e.currentTarget.value;
      this.setState({[key]: val});
    };
  }

  handleSubmit() {
    return (e) => {
      e.preventDefault();
      let title = this.state.title;
      let body = this.state.body;
      let done = this.state.done;
      let step = {id: Util.uniqueId(), title, body, done, todo_id:
      this.props.todoId};
      this.props.createStep(step);
    };
  }

  render() {
    let steps = this.props.steps;
    console.log("list props", steps);
    return (
      <div>
        <ul>
          {steps.map((step)=>(<li>{step.title}</li>))}
        </ul>
        <form >
          <label>title
            <input type="text" onChange={this.updateState('title')}></input>
          </label>
          <label>body
            <input type="text" onChange={this.updateState('body')}></input>
          </label>
          <button type="submit" onClick={this.handleSubmit()}>Add Step</button>
        </form>
    </div>);
  }
}

export default StepList;
