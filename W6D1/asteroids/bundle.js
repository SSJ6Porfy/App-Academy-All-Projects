/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(2);

document.addEventListener("DOMContentLoaded", function() {
  const gameView = new GameView();
  gameView.start();
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {



/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(3);
const Ship = __webpack_require__(1);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(4);

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


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__(5);
const Util = __webpack_require__(6);

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


/***/ }),
/* 5 */
/***/ (function(module, exports) {

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


/***/ }),
/* 6 */
/***/ (function(module, exports) {

const Util = {
  inherits(childclass, superclass) {
    childclass.prototype = Object.create(superclass.prototype);
    childclass.prototype.constructor = childclass;
  },

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ })
/******/ ]);