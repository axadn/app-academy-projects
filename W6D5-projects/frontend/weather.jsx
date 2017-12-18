import ReactDOM from "react-dom";
import React from "react";

class Weather extends React.Component {

  constructor() {
    super();
    this.state = {  };
  }

  render() {
    return (
    <div className = "weather-box">
      <span> <div>City: </div><div>{this.state.city}</div></span>
      <span> <div>Temperature: </div><div>{this.state.temp}° C</div></span>
    </div>
    );
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather.bind(this));
  }

  getWeather(result) {
    console.log(result);
    const request = new XMLHttpRequest();
    request.onload = () => { this.formatState(request.responseText); };
    request.onerror = () => { console.log("error"); };
    request.open('GET',
      `http://api.openweathermap.org/data/2.5/weather?lat=${result.coords.latitude}&lon=${result.coords.longitude}&APPID=57df78c7af5cb716b3d03483ed27e92a`);
    request.send();
  }

  formatState(result) {
    result = JSON.parse(result);
    this.setState({city: result.name, temp: Math.floor(result.main.temp - 273.15)});
  }
}

export default Weather;
