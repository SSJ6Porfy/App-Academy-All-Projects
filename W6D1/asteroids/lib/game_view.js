const Game = require("./game.js");
const Ship = require("./ship.js");

function GameView() {
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");

  this.newGame = new Game(ctx);
}

GameView.prototype.start = function() {
  const that = this;
  setInterval(function() {
    that.newGame.moveObjects();
    that.newGame.draw();
  }, 20);
};

module.exports = GameView;
