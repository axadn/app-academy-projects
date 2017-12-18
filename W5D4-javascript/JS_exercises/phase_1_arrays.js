
Array.prototype.uniq = function(){
  let uniqArr = [];
  this.forEach(function(el){
    if( !uniqArr.includes(el) ){
      uniqArr.push(el);
    }
  });
  return uniqArr;
};

Array.prototype.twoSum = function(){
  const pairs = [];
  for(let i = 0; i < this.length; ++i){
    for(let j = i+1; j < this.length; ++j ){
      if( this[i] + this[j] === 0){
          pairs.push([i,j]);
      }
    }
  }
  return pairs;
};

Array.prototype.transpose = function(){
  const transposed = [];
  for(let j = 0; j < this[0].length; j++){
    let row = [];
    for(let i = 0; i < this.length; i++){
      row.push(this[i][j]);
    }
    transposed.push(row);
  }
  return transposed;
};
