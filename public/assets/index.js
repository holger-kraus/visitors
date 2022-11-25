// import "./index.css";
function getDetails(id,payload) {
 return fetch("/timeslots/".concat(id), {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(payload)
  }).then(res=> res.json());
}
function openPopup(tag, monat, hour, jahr, id) {
  timeslotField = document.getElementById("timeslot_id");
  timeslotField.value=id;
  dayField= document.getElementById("day");
  dayField.value=tag
  hourField= document.getElementById("hour")
  hourField.value = hour;
  monthField= document.getElementById("month");
  monthField.value= monat;
  yearField= document.getElementById("year");
  yearField.value=jahr;
  const overlay = document.querySelector(".overlay");
  const submitButton= document.querySelector(".form__save")
  submitButton.value= id;
  overlay.classList.add("overlay_opened");
  const formTitle = overlay.querySelector(".form__title");
  formTitle.textContent="Buche Deinen Besuch bei Holger am " + tag + " um "+ hour + ":00 Uhr";
}
function closePopoup() {
  const overlay = document.querySelector(".overlay")
  overlay.classList.remove("overlay_opened");
}
function tagOccupied(timeslot_id, booker) {
  console.log(timeslot_id)
  console.log(booker);
  timeslot=document.getElementById(timeslot_id)
  console.log(timeslot.classList)
  timeslot.classList.add("timeslot_occupied");
  timeslot.title=booker;
  closePopoup();
  timeslot.removeEventListener("click", bookDate);
}
function bookDate(event) {
  const tag= event.target.dataset.day;
  console.log("Tag:" + tag);
  const monat= event.target.dataset.month;
  console.log("Monat:" + monat);
  const  hour = event.target.dataset.hour;
  console.log("Stunde:" + hour);
  const jahr = event.target.dataset.year;
  console.log("Jahr:" + jahr);
  const id = event.target.id;

  openPopup(tag, monat, hour, jahr, id);
}
function jsonCallback(data) {
  console.log("in jsoncallback");
  console.log(data.doof);
  console.log(data.created_at);
  tagOcupied(json.id, json.booker);
}
function successCallback(response) {
  console.log("in callback");
  console.log(response.text().resolve())
 response.json().then(jsonCallback);
}
 function dateBooked(data) {
   tagOccupied(data.id, data.booker);
   console.log(data)
 }
 function openPage(event) {
  const day_id= event.target.dataset.id;
   if ( window.innerWidth <450) {
     window.open("/days/"+ day_id);
   }
 }

// function tagOcupied(timeslot_id) {
//   timeslot=document.getElementBy(timeslot_id)
//   timeslot.classList.add("timeslot_occupied");
// }
function submitForm(booker,id) {
  payload = {
    booker : booker,
    id:    id
  }
  console.log(payload);
    getDetails(id,payload).then((data)=> {
    console.log(data.booker);
    console.log((data.id))
  });

}

function closePopoup() {
  const overlay = document.querySelector(".overlay")
  overlay.classList.remove("overlay_opened");
}

const submitButton= document.querySelector(".form__save")
const bookerField = document.querySelector(".form__field_booker")
const emailField = document.querySelector(".form__field_email")

submitButton.addEventListener("click", (event)=> {
  event.preventDefault();
  timeslotField = document.getElementById("timeslot_id");
  dayField= document.getElementById("day");
  monthField= document.getElementById("month");
  yearField= document.getElementById("year");
  hourField= document.getElementById("hour");

  payload = {
    day: dayField.value,
    month: monthField.value,
    year: yearField.value,
    booker: bookerField.value,
    id:  timeslotField.value,
    email: emailField.value,
    hour:hourField.value
  }
  //timeslot_id = document.getElementById("timeslot_id")
  getDetails(timeslotField.value, payload).then(dateBooked);
});


const days = document.querySelectorAll(".day");
days.forEach(day =>{
  day.addEventListener("click",openPage );
})


const timeslots = document.querySelectorAll(".timeslot_free");
timeslots.forEach(timeslot =>{
  timeslot.addEventListener("click", bookDate);
})
const closeButton = document.querySelector(".overlay__close-button");
closeButton.addEventListener("click", (event => {
  closePopoup()
}))







