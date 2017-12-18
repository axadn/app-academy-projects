/* jshint esversion: 6 */

function View($el) {
  this.$el = $el;
  this.setupEasel();
}

window._randomColorString = function(){
  return '#' + Math.random().toString(16).substr(-6);
};

View.prototype.exercise0 = function () {
  $('li').removeClass("square");
};

View.prototype.exercise1 = function () {
  $("li").addClass("orange");
};

View.prototype.exercise2 = function () {
  $(".square").remove();
};

View.prototype.exercise3 = function () {
  $("body").append($("<h1>I love jquery</h1>"))
};

View.prototype.exercise4 = function () {
  $('li').text(function(index){
    return index % 2 == 0 ? "Adan" : "";
  });
};

View.prototype.exercise5 = function () {
  $('li').on("click", event => {
    const $currentTarget = $(event.currentTarget);
    alert($currentTarget.data("pos"));
  });
};

View.prototype.exercise6 = function () {
  $('li').each(function(index){
    $(this).css("background-color", window._randomColorString());
  });
};

View.prototype.exercise7 = function(){
  $('li').on('mouseenter', function(event) {
    console.log($(this).attr("style"));
  })
};



View.prototype.setupEasel = function() {
  const $addRowButton = $('<button>').html('Add a row');
  this.$el.append($addRowButton);
  $addRowButton.on("click", this.addRow.bind(this));

  for(let j = 0; j <= 7; j++){
    const $button = $("<button>").html("Exercise " + j);
    $button.on("click", this["exercise" + j]);
    this.$el.append($button);
  }

  for(let i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function() {
  const rowIdx = this.$el.find(".row").length;
  const $row = $("<ul>").addClass("row").addClass("group");
  for(let colIdx = 0; colIdx < 20; colIdx++) {
    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
    $square.on("mouseenter", (e) => {
      const $square = $(e.currentTarget);
      $square.css("background-color", window._randomColorString());
    });
    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
