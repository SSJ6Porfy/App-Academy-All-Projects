const GameView = require("./game_view.js");

document.addEventListener("DOMContentLoaded", function() {
  const gameView = new GameView();
  gameView.start();
});
