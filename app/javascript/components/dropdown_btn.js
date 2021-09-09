const dropDownListener = () => {
  const expandElement = document.getElementById('dropdown-toggle');
  if (expandElement){
    expandElement.addEventListener("click", (e) => {
      e.preventDefault();
      if (expandElement.innerHTML === "Filter Results") {
        expandElement.innerHTML = "Hide Filter Results";
        document.getElementById('hide').classList.toggle('hidden-filters');
      } else if (expandElement.innerHTML === "Hide Filter Results"){
        expandElement.innerHTML = "Filter Results";
        document.getElementById('hide').classList.toggle('hidden-filters');
      } else if (expandElement.innerHTML === "see map") {
        expandElement.innerHTML = "hide map";
        document.getElementById('hide').classList.toggle('d-none');
      } else if (expandElement.innerHTML === "hide map") {
        expandElement.innerHTML = "see map";
        document.getElementById('hide').classList.toggle('d-none');
      };
    });
  }
};

export { dropDownListener };
