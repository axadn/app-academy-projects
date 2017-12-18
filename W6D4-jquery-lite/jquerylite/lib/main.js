const DOMNodeCollection = require('./dom_node_collection.js');
let readyCallbacks = [];
document.addEventListener('DOMContentLoaded', () => (readyCallbacks = []));

window.$l = function(arg){
  let nodeList;

  if (arg instanceof HTMLElement) {

    nodeList = [arg];

  } else if (arg instanceof Function) {

    readyCallbacks.push(arg);

    if (document.readyState === 'complete') {
      const numCallbacks = readyCallbacks.length;
      for (var i = 0; i < numCallbacks; i++) {
        document.removeEventListener('DOMContentLoaded', readyCallbacks[i]);
        readyCallbacks.shift()();
      }
    } else {
      document.addEventListener('DOMContentLoaded', arg);
    }

  } else {

    nodeList = Array.from(document.querySelectorAll(arg));

  }

  return new DOMNodeCollection(nodeList);
};

window.$l.extend = function(...args){
  const firstObj = {};
  args.forEach((obj) =>{
    for (var key in obj) {
      firstObj[key] = obj[key];
    }
  });
  return firstObj;
};

window.$l.ajax = function(options){
  const defaults = {
      success(){},
      error(){},
      url: window.location.href,
      method: "get",
      data: {},
      contentType: "application/x-www-form-urlencoded; charset=UTF-8"
  };
  //success, error, url, method, data, and contentType

  options = window.$l.extend(defaults, options);

  const xhr = new XMLHttpRequest();

  xhr.open(options.method, options.url);
  xhr.setRequestHeader("Content-type", options.contentType);
  xhr.setRequestHeader("Accept", "application/json");
  xhr.onload = () => {
    const response = JSON.parse(xhr.response);
    if (xhr.status >= 200 && xhr.status < 300) {
      options.success(response);
    } else {
      options.error(response);
    }
  };

  xhr.send(options.data);
};
