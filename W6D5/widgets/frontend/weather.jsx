import React from "react";

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {
      currentWeather: {},
      currentCity: ""
    };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }

  getWeather(position) {
    var xmlhttp = new XMLHttpRequest();
    const that = this;
    const reqListener = () => {
      if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
        if (xmlhttp.status == 200) {
          let newWeather = JSON.parse(xmlhttp.responseText);
          that.setState({currentWeather: newWeather.main, currentCity: newWeather.name });
        }
       else if (xmlhttp.status == 400) {
          alert('There was an error 400');
       }
       else {
           alert('something else other than 200 was returned');
       }
     }
    };

    xmlhttp.addEventListener("load", reqListener);

    xmlhttp.open("GET", `http://api.openweathermap.org/data/2.5/weather?lat=${position.coords.latitude}&lon=${position.coords.longitude}&APPID=26dd7f8161e31e0cb779e89b0f313320`, true);
    xmlhttp.send();
  }

  render() {
    return (
      <div>
        <h1>Weather</h1>
        <div className="WeatherContainer">
          <h1>City: {this.state.currentCity}</h1>
          <h1>Temp: {this.state.currentWeather.temp - 273}</h1>
        </div>
      </div>
    );
  }
}

export default Weather;
