const filterListener = () => {
  const expandFilter = document.getElementById('filter-toggle');
  if (expandFilter){

    expandFilter.addEventListener("click", (e) => {
      e.preventDefault();
      if (expandFilter.innerHTML === "Filter Results") {
        expandFilter.innerHTML = "Hide Filter Results";
      } else {
        expandFilter.innerHTML = "Filter Results";
      };
      document.getElementById('hide').classList.toggle('hidden-filters');

    });
  }
};

export { filterListener };
