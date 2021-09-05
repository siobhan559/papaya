const filterListener = () => {
  const expandFilter = document.getElementById('filter-toggle');
  expandFilter.addEventListener("click", (e) => {
    e.preventDefault();
    document.getElementById('hide').classList.toggle('hidden-filters');
  });
};

export { filterListener };
