import ReactDOM from "react-dom";
import React from "react";
import Clock from "./clock.jsx";
import Weather from "./weather.jsx";
import Autocomplete from "./autocomplete.jsx";

const namesList = ["Samantha","Harriet", "Lee", "Marley"];

document.addEventListener("DOMContentLoaded", ()=>{
  ReactDOM.render(<Root />, document.querySelector("#root"));
});

class Root extends React.Component{
  render(){
    return(
    <div>
      <Clock/>
      <Weather/>
      <Autocomplete names={namesList}/>
    </div>
    );
  }
}
