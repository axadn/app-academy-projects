function titleize(arr, printCallBack){
  let titleized = arr.map(function(el) {
    return `Mx. ${el} Jingleheimer Schmidt`;
    });
  titleized.forEach(function(el){
    printCallBack(el);
    });
}

titleize(["Mary", "Brian", "Leo"], console.log);
