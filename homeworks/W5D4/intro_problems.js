function madLib(verb, adj, noun){
  return `we shall ${verb} the ${adj} ${noun}`;
}
function isSubString(searchString, substring){
  let endIndex = searchString.length - substring.length;
  for(let i = 0; i < endIndex; ++i){
    if (searchString.substring(endIndex,
       endIndex + substring.length) == substring){
        return true;
      }
  }
  return false;
}

function fizzBuzz(nums){
  fizzNums = []
  for(let i = 0; i < nums.length; ++i ){
    div5 = nums[i]%5 == 0;
    div3 = nums[i]%3 == 0;
    if (div5 ? !div3 : div3){
      fizzNums.push(nums[i]);
    }
  }
  return fizzNums;
}

function isPrime(num){
  sqrt = Math.sqrt(num)
  for(let i = 2; i < sqrt; ++i){
    if (num % i == 0) return false;
  }
  return true;
}

function sumOfNPrimes(n){
  sum = 0;
  primesCount = 0;
  for(let i =2;primesCount<n; ++i){
    if (isPrime(i)){
      sum += i;
      ++primesCount;
    }
  }
  return sum;
}
console.log(madLib("forge", "ultimate", "javascript"));
console.log(isSubString("hello wrold", "wrold"));
//true
console.log(isSubString("its a mad wrold", "angry"));
//false
console.log(fizzBuzz([1,5,15,20]));
console.log(isPrime(15485863));
//true
console.log(isPrime(3548563));
//false
console.log(sumOfNPrimes(1));
//2
console.log(sumOfNPrimes(4));
//17
