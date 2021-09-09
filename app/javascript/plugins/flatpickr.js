import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    enableTime: true,
    disableMobile: false
  });
}

export { initFlatpickr };
