function Cat(name, owner){
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function(){
  return `${this.owner} loves ${this.name}`;
};

Cat.prototype.cuteStatement = function(){
  return `everyone loves ${this.name}`;
};

Cat.prototype.meow = function(){
  return `${this.name} says meow.`;
};
