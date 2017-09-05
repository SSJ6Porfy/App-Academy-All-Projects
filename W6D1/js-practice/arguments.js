function sum() {
  const args = Array.from(arguments);
  let total = 0;

  args.forEach(function(num) {
    total += num;
  });

  return total;
}

function betterSum(...nums) {
  let total = 0;
  nums.forEach(num => {
    total += num;
  });
  return total;
}

Function.prototype.myBind = function(obj, ...args) {
  return (...args2) => {
    const allArgs = args.concat(args2);
    this.apply(obj, allArgs);
  };
};

function curriedSum(numArgs) {
  let numbers = [];

  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach(n => {
        total += n;
      });
      return total;
    } else {
      return _curriedSum;
    }
  };
}

Function.prototype.curry = function(numArgs) {
  let args = [];

  const _curry = num => {
    args.push(num);
    if (args.length === numArgs) {
      return this(...args);
    } else {
      return _curry;
    }
  };

  return _curry;
};
