function MovingObject(optionsObj) {
  this.pos = optionsObj.pos;
  this.vel = optionsObj.vel;
  this.radius = optionsObj.radius;
  this.color = optionsObj.color;
  this.game = optionsObj.game;
  console.log(this.game);
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);

  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  // const newPos = this.game.wrap([x, y]);

  // this.pos[0] = newPos[0];
  // this.pos[1] = newPos[1];
};

module.exports = MovingObject;
