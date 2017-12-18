console.log("Hello from the JavaScript console!");
$.ajax({
  dataType: "json",
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: console.log

});
console.log("bye");
// Your AJAX request here

// Add another console log here, outside your AJAX request
