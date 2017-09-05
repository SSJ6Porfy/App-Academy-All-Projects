Function.prototype.inherits = function(superclass) {
  this.prototype = Object.create(superclass.prototype);
  this.prototype.constructor = this;

  // function Surrogate() {}
  // Surrogate.prototype = superclass.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
};

function MovingObject() {}

MovingObject.prototype.saysWubbaLubba = function() {
  console.log("Wubba lubba dub dub!");
};

function Ship() {}
Ship.inherits(MovingObject);

function Asteroid() {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.saysWoohoo = function() {
  console.log("Woooohooooo");
};

let voyager = new Ship();
// voyager.saysWoohoo();
voyager.saysWubbaLubba();
console.log(voyager.__proto__);
