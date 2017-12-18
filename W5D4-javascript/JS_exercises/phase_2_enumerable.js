Array.prototype.myEach = function(callback){
  for(let i =0; i< this.length; ++i){
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback){
  const arr = [];
  this.myEach(function(el) {
    arr.push(callback(el));
  });
  return arr;
};

// Invoke like so: [1,2,3].myMap(el => el*2);

Array.prototype.myReduce = function(callback, initial_val) {
  let accum = initial_val;
  if (initial_val) {
    accum = initial_val;
    this.myEach(function(el){
      accum = callback(accum, el);
    });
  }
  else {
    accum = this[0];
    for(let i = 1; i < this.length; i++){
      accum = callback(accum,this[i]);
    }
  }
  return accum;
};
