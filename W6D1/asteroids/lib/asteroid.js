const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

const DEFAULT = { COLOR: "#2C3539", RADIUS: 15 };

Util.inherits(Asteroid, MovingObject);

function Asteroid(optionsObj) {
  this.color = optionsObj.color || DEFAULT.COLOR;
  this.radius = optionsObj.radius || DEFAULT.RADIUS;
  this.vel = optionsObj.vel || randomVec(this.radius);
  this.pos = optionsObj.pos;
  this.game = optionsObj.game;
}

function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length / 15);
}

module.exports = Asteroid;
