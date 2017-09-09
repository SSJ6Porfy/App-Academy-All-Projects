import React from 'react';
import ReactDOM from 'react-dom';
import Main from "./main";
import  Clock from "./frontend/clock";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Main />, root);
});
