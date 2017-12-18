import React from "react";

class Clock extends React.Component{

  constructor(){
    super();
    this.state = { date: new Date() };
  }
  render(){
    return (
    <div className = "clock">
      <div className="date-headers">
        <span>Time</span>
        <span>Date</span>
      </div>

      <div className="date-info">
        <span>{this.state.date.toTimeString()}</span>
        <span>{this.state.date.toDateString()}</span>
      </div>
    </div>
    );
  }
  componentDidMount(){
    this.interval = setInterval(this.tick.bind(this),1000);
  }
  componentWillUnmount(){
    clearInterval(this.interval);
  }
  tick() {
    this.setState({date: new Date()});
  }
}

export default Clock;
