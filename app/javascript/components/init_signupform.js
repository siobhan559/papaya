let FIRST = true;
let TOGGLE = true;

const toggleDisplayVol = () => {
  if (FIRST) {
    const input_boxes = document.querySelectorAll('.both');
    input_boxes.forEach(element => element.classList.toggle("d-none"));
    FIRST = false
  }
  if (TOGGLE) {
    const input_boxes = document.querySelectorAll('.volunteer');
    input_boxes.forEach(element => element.classList.toggle("d-none"));
    TOGGLE = false;
  }
};
const bindClickVol = element => element.addEventListener("click", toggleDisplayVol);


const toggleDisplayOrg = () => {
  if (FIRST) {
    const input_boxes = document.querySelectorAll('.both');
    input_boxes.forEach(element => element.classList.toggle("d-none"));
    FIRST = false
  }
  if (!TOGGLE) {
    const input_boxes = document.querySelectorAll('.organization');
    input_boxes.forEach(element => element.classList.toggle("d-none"));
    TOGGLE = true;
  }
};
const bindClickOrg = element => element.addEventListener("click", toggleDisplayOrg);


const initSignUpForm = () => {
  const formSignUp = document.getElementById("cesar");
  if(formSignUp){
    const radioYes = document.getElementById("user_organization_true");
    const radioNo = document.getElementById("user_organization_false");
    bindClickOrg(radioYes);
    bindClickVol(radioNo);
  }
};

export { initSignUpForm };
