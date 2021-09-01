// Global vars
const radioYes = document.getElementById("user_organization_true");
const radioNo = document.getElementById("user_organization_false");
let FIRST = true;
let TOGGLE;

// When a user click on the opposing box then it toggles the classes
const toggleAll = () => {
  const input_boxes = document.querySelectorAll('.volunteer');
  const input_boxes2 = document.querySelectorAll('.organization');
  input_boxes.forEach(element => element.classList.toggle("d-none"));
  input_boxes2.forEach(element => element.classList.toggle("d-none"));
}

// If it is the first time the user clicks then it shows the inputs that apply to both
const toggleFirst = () => {
  FIRST = false;
  const input_boxes = document.querySelectorAll('.both');
  input_boxes.forEach(element => element.classList.toggle("d-none"));
  if (radioYes.checked) {
    const input_boxes2 = document.querySelectorAll('.organization');
    input_boxes2.forEach(element => element.classList.toggle("d-none"));
    TOGGLE = true;
  }
  if (radioNo.checked) {
    const input_boxes2 = document.querySelectorAll('.volunteer');
    input_boxes2.forEach(element => element.classList.toggle("d-none"));
    TOGGLE = false;
  }
}

// If the volunteer button is clicked
const toggleDisplayVol = () => {
  if (FIRST) {
    toggleFirst();
  }
  else if (TOGGLE) {
    toggleAll();
    TOGGLE = false;
  }
  console.log(TOGGLE);
};
const bindClickVol = element => element.addEventListener("click", toggleDisplayVol);

// If the organization button is clicked
const toggleDisplayOrg = () => {
  if (FIRST) {
    toggleFirst();
  }
  else if (!TOGGLE) {
    toggleAll();
    TOGGLE = true;
  }
  console.log(TOGGLE);
};
const bindClickOrg = element => element.addEventListener("click", toggleDisplayOrg);

// If the page is the sign up for then bind the click to both radio boxes
const initSignUpForm = () => {
  const formSignUp = document.getElementById("cesar");
  if(formSignUp){
    bindClickOrg(radioYes);
    bindClickVol(radioNo);
  }
};

export { initSignUpForm };
