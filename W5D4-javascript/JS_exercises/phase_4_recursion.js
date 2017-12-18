function range(start, end){
  if(start === end){
    return [start];
  }
  else{
    let rangeSoFar = range(start, end -1);
    rangeSoFar.push(end);
    return rangeSoFar;
  }
}

function sumRec(arr){
  if (arr.length ===1){
  return arr[0];
  }
  else{
    return arr[0] + sumRec(arr.slice(1, arr.length));
  }
}

function exp(b, n){
  if(n === 0){
    return 1;
  }
  else{
    return b * exp(b, n - 1);
  }
}

function exp1(b , n){
  if( n=== 0){
    return 1;
  }
  else if (n === 1){
    return b;
  }
  else{
    if(n % 2 === 0){
      let c = exp1(b, n/2);
      return c *c;
    }
    else{
      let c = exp1(b, (n -1)/2);
      return b * (c * c) ;
    }
  }
}

function fib(n){
  if(n === 0){
    return [];
  }
  if(n === 1){
    return [0];
  }
  if(n ===2){
    return [0,1];
  }
  let prevFib = fib(n-1);
  let prevFib2 = fib(n -2);
  prevFib.push(prevFib[prevFib.length -1] + prevFib2[prevFib2.length -1]);
  return prevFib;
}


function bsearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  let midIndex = Math.floor(arr.length / 2);

  if (target < arr[midIndex]) {
    return bsearch(arr.slice(0,midIndex), target);
  }
  else if (target > arr[midIndex]){
    let subAnswer = bsearch(arr.slice(midIndex+1,arr.length), target);
    if(subAnswer === -1 ){
      return -1;
    }
    else{
      return midIndex + 1 + subAnswer;
    }
  }
  else {
    return midIndex;
  }
}
// function bsearch(arr, target) {
//   return bsearchHelper(arr, target, 0, arr.length -1);
// }
//
// function bsearchHelper(arr, target, startIndex, endIndex) {
//   if (startIndex === endIndex) {
//     return -1;
//   }
//
//   let midIndex = Math.floor((startIndex + endIndex) / 2);
//
//   if (target < arr[midIndex]){
//     return bsearchHelper(arr, target, startIndex, midIndex -1 );
//   }
//   else if (target > arr[midIndex]){
//     return bsearchHelper(arr, target, midIndex + 1, endIndex);
//   }
//   else{
//     return midIndex;
//   }
// }

function mergeSort(arr) {
  if(arr.length === 1){
    return arr;
  }
  let middle = Math.floor(arr.length/2);
  let left = mergeSort(arr.slice(0,middle));
  let right = mergeSort(arr.slice(middle, arr.length));
  return merge(left, right);
}

function merge(left, right){
  let merged = [];
  while (left.length !== 0 && right.length !== 0){
    if (left[0] < right[0]){
      merged.push(left.shift());
    }
    else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left).concat(right);
}

function subsets(arr){
  // debugger
  if(arr.length === 0){
    return [arr];
  }
  let prevSubset = subsets(arr.slice(0,arr.length-1));
  let newSubsets = [];
  prevSubset.forEach(function(set){
    let clone = set.slice(0);
    clone.push(arr[arr.length-1]);
    newSubsets.push(clone);
  });
  return prevSubset.concat(newSubsets);
}
