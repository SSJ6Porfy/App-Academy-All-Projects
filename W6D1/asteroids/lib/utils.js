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
