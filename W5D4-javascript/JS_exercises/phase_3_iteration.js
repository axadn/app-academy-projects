Array.prototype.bubbleSort = function(){
  let sorted = false;
  while(!sorted){
    sorted = true;
    for(let i = 0; i < this.length-1; i++){
      if(this[i] > this[i+1]) {
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.subStrings = function (){
  let subs = [];
  for(let startIdx = 0; startIdx < this.length; startIdx++){
    for(let endIdx = startIdx+1; endIdx <= this.length; endIdx++){
      subs.push(this.substring(startIdx, endIdx));
    }
  }
  return subs;
};
