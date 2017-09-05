const Asteroid = require("./asteroid.js");

function Game(ctx) {
  this.DIM_X = 900;
  this.DIM_Y = 700;
  this.NUM_ASTEROIDS = 20;

  this.asteroids = [];
  this.addAsteroids();
  this.ctx = ctx;
  this.draw();
}

Game.prototype.addAsteroids = function() {
  const that = this;
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    const pos = this.randomPosition();
    let asteroid = new Asteroid({ pos: pos, game: that });
    console.log(asteroid.game);
    this.asteroids.push(asteroid);
  }
};

Game.prototype.randomPosition = function() {
  const x = Math.random() * this.DIM_X;
  const y = Math.random() * this.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function() {
  this.ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  this.asteroids.forEach(asteroid => {
    asteroid.draw(this.ctx);
  });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(asteroid => {
    asteroid.move();
  });
};

Game.prototype.wrap = function(pos) {
  const x = pos[0] % this.DIM_X;
  const y = pos[1] % this.DIM_Y;
  return [x, y];
};

module.exports = Game;
