document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants
  const favoriteInput =  document.querySelector(".favorite-input");
  const sfPlaces = document.querySelector("#sf-places");
  const dogPhotos = document.querySelector(".dog-photos");
  const photoInput = document.querySelector(".photo-url-input");
  const photoSubmit = document.querySelector(".photo-url-submit");
  const formContainer = document.querySelector(".photo-form-container");
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  const addRestaurant = (e) => {
    e.preventDefault();
    const li = document.createElement("li")
    li.textContent = favoriteInput.value;
    if (li.textContent.length != 0){
      sfPlaces.append(li);
    }
  };

  const addPhoto = (e) => {
    e.preventDefault();
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.setAttribute("src", photoInput.value);
    li.append(img);
    dogPhotos.append(li);
    formContainer.classList.add("hidden");
  }
  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });
  document.querySelector(".favorite-submit").addEventListener(
    "click", addRestaurant);
  document.querySelector(".photo-show-button").addEventListener(
    "click", () => formContainer.classList.remove("hidden")
  );
  photoSubmit.addEventListener("click", addPhoto);



});
