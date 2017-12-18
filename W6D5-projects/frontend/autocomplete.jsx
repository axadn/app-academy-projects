import React from "react";
import ReactDOM from "react-dom";

class Autocomplete extends React.Component{
  constructor({names}){
    super();
    this.names = names;
    this.state = {inputVal: "Sam"};
  }
  render(){
    return(<div>
      <input type="text" ></input>
      <ul>{ this.createList() }</ul>
    </div>);
  }
  createList(){
    let newNames = "";
    debugger;
    for(let i = 0; i < this.names.length; i++){
      if(this.names[i].slice(0, this.state.inputVal.length ) === this.state.inputVal){
        newNames += `<li key = ${this.names[i] + "li"}>${this.names[i]}</li>`;
      }
    }
    return newNames;
  }
}

export default Autocomplete;
