class DOMNodeCollection {
  constructor(array) {
    this.elements = array;
  }

  html(setter) {
    if (setter !== undefined) {
      for (var i = 0; i < this.elements.length; i++) {
        this.elements[i].innerHTML = setter;
      }
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty(){
    this.html("");
  }

  append(arg){
    if(arg instanceof DOMNodeCollection){
      for(let i = 0; i < arg.elements.length; ++i){
        this.append(arg.elements[i]);
      }
    } else if (arg instanceof HTMLElement) {
      for (var i = 0; i < this.elements.length; i++) {
        this.elements[i].appendChild(arg);
      }
    } else {
      for (var i = 0; i < this.elements.length; i++) {
        this.elements[i].innerHTML += arg;
      }
    }
  }

  attr(name, val){
    if(arguments.length === 1){
      this.elements[0].getAttribute(name);
    }
    else{
      for (var i = 0; i < this.elements.length; i++) {
        this.elements[i].setAttribute(name, val);
      }
    }
  }

  removeClass(className){
    const classNames = className.split(" ");
    for (var i = 0; i < this.elements.length; i++) {
      for (var j = 0; j < classNames.length; j++) {
        this.elements[i].classList.remove(classNames[j]);
      }
    }
  }

  addClass(className){
    const classNames = className.split(" ");
    for (var i = 0; i < this.elements.length; i++) {
      for (var j = 0; j < classNames.length; j++) {
        this.elements[i].classList.add(classNames[j]);
      }
    }
  }

  children() {
    const arr = [];
    for (var i = 0; i < this.elements.length; i++) {
      for (var j = 0; j < this.elements[i].children.length; j++) {
        arr.push(this.elements[i].children[j]);
      }
    }
    return new DOMNodeCollection(arr);
  }

  parent() {
    const arr = [];
    for (var i = 0; i < this.elements.length; i++) {
      const parent = this.elements[i].parentElement;
      if (!arr.includes(parent)) {
        arr.push(parent);
      }
    }

    return new DOMNodeCollection(arr);
  }

  find(query) {
    query = query || "*";
    const arr = [];
    for (var i = 0; i < this.elements.length; i++) {
      const descendantsCol = this.elements[i].querySelectorAll(query);
      for (var j = 0; j < descendantsCol.length; j++) {
        arr.push(descendantsCol[j]);
      }
    }
    return new DOMNodeCollection(arr);
  }

  remove(selector){
    const matchedElements = Array.from(document.querySelectorAll(selector));
    const removeIndices = [];
    for (let i = 0; i < this.elements.length; i++) {
      if (selector === undefined ||
        matchedElements.includes(this.elements[i])) {

        this.elements[i].outerHTML = "";
        removeIndices.push(i);

      }
    }
    this.elements = this.elements.filter( (e, i) => {
      return !removeIndices.includes(i);
    });
  }

  on(type, callback) {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].addEventListener(type, callback);
      this.elements[i].listeners = this.elements[i].listeners || {};
      this.elements[i].listeners[type] = this.elements[i].listeners[type] || [];
      this.elements[i].listeners[type].push(callback);
    }
  }

  off(type) {
    for (var i = 0; i < this.elements.length; i++) {
      let callbacks = this.elements[i].listeners[type];
      for (var j = 0; j < callbacks.length; j++) {
        this.elements[i].removeEventListener(type, callbacks[j]);
        this.elements[i].listeners[type] = [];
      }
    }
  }
}

module.exports = DOMNodeCollection;
