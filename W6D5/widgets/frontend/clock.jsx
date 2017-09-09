import React from "react";

class Clock extends React.Component{
  constructor() {
    super();
    this.state = {time: new Date()};
    this.intervalId = null;
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
    this.intervalId = null;
  }

  render() {
    return (
      <div>
        <h1>Clock</h1>
        <div className="ClockContainer">
        <div className="ClockSection">
            <h3>Time:</h3>
            <h3>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</h3>
        </div>
        <div className="ClockSection">
          <h3>Date: </h3>
          <h3>{this.state.time.toDateString()}</h3>
        </div>
        </div>
      </div>
    );
  }

  tick() {
    this.setState({time: new Date()});
  }
}


export default Clock;
