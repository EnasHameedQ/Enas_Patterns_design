//start slide show
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1 }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
// end slide show //
// start login &creatAcount models//
/*Displaying and hiding modals "Sign in Modal" and " Sign up modal"*/

/*Displaying and hiding modals "Sign in Modal" and " Sign up modal"*/
const showloginModal = modal => {
    document.getElementById("login-modal-container").style.display = "block";
}
const hideloginModal = hide => {
    document.getElementById("login-modal-container").style.display = "none";

}
const showSigninModal = modal => {
    document.getElementById("login-modal-container").style.display = "none";
    document.getElementById("signin-modal-container").style.display = "block";
}
const hidesigninModal = hide => {
    document.getElementById("signin-modal-container").style.display = "none";
    document.getElementById("login-modal-container").style.display = "none";

}
const showloginModalAgain = showLogin => {
    document.getElementById("signin-modal-container").style.display = "none";
    document.getElementById("login-modal-container").style.display = "block";
}



// end login &creatAcount models//
//srat timer for coupons//
setInterval(() => {
    const upperDate = new Date('Jan 30, 2022 00:00:00').getTime();

    const curretDate = new Date().getTime();
    const diffDate = upperDate - curretDate;
    const second = 1000;
    const minutes = second * 60;
    const hours = minutes * 60;
    const days = hours * 24;
    const remain_days = Math.floor(diffDate / days);
    const remain_hours = Math.floor(diffDate % days) / hours;
    const remain_months = Math.floor(diffDate % hours) / minutes;
    const remain_seconds = Math.floor(diffDate % minutes) / second;
    var d = document.getElementsByClassName("days");
    var h = document.getElementsByClassName("hours");
    var m = document.getElementsByClassName("minutes");
    var s = document.getElementsByClassName("second");

    d.innerHTML = remain_days;
    h.innerHTML = remain_hours;
    m.innerHTML = remain_months;
    s.innerHTML = remain_seconds;

}, 1000);
// setInterval(() => {
//     const upperDate2 = new Date('Mar 20, 2022 11:50:00').getTime();

//     const curretDate2 = new Date().getTime();
//     const diffDate2 = upperDate2 - curretDate2;
//     const second2 = 1000;
//     const minutes2 = second2 * 60;
//     const hours2 = minutes2 * 60;
//     const days2 = hours2 * 24;
//     const remain_days2 = Math.floor(diffDate2 / days2);
//     const remain_hours2 = Math.floor(diffDate2 % days2) / hours2;
//     const remain_months2 = Math.floor(diffDate2 % hours2) / minutes2;
//     const remain_seconds2 = Math.floor(diffDate2 % minutes2) / second2;
//     var d2 = document.getElementsByClassName("days2");
//     var h2 = document.getElementsByClassName("hours2");
//     var m2 = document.getElementsByClassName("minutes2");
//     var s2 = document.getElementsByClassName("second2");

//     d2.innerHTML = remain_days2;
//     h2.innerHTML = remain_hours2;
//     m2.innerHTML = remain_months2;
//     s2.innerHTML = remain_seconds2;

// }, 1000);
// setInterval(() => {
//     const upperDate3 = new Date('Feb 14, 2022 12:00:00').getTime();

//     const curretDate3 = new Date().getTime();
//     const diffDate3 = upperDate3 - curretDate3;
//     const second3 = 1000;
//     const minutes3 = second3 * 60;
//     const hours3 = minutes3 * 60;
//     const days3 = hours3 * 24;
//     const remain_days3 = Math.floor(diffDate3 / days3);
//     const remain_hours3 = Math.floor(diffDate3 % days3) / hours3;
//     const remain_months3 = Math.floor(diffDate3 % hours3) / minutes3;
//     const remain_seconds3 = Math.floor(diffDate3 % minutes3) / second3;
//     var d3 = document.getElementsByClassName("days3");
//     var h3 = document.getElementsByClassName("hours3");
//     var m3 = document.getElementsByClassName("minutes3");
//     var s3 = document.getElementsByClassName("second3");

//     d3.innerHTML = remain_days3;
//     h3.innerHTML = remain_hours3;
//     m3.innerHTML = remain_months3;
//     s3.innerHTML = remain_seconds3;

// }, 1000);
// end timer for coupons//



//end timer for coupons//


///filter by price
var lowerSlider = document.querySelector('#lower');
var upperSlider = document.querySelector('#upper');

document.querySelector('#two').value = upperSlider.value;
document.querySelector('#one').value = lowerSlider.value;

var lowerVal = parseInt(lowerSlider.value);
var upperVal = parseInt(upperSlider.value);

upperSlider.oninput = function() {
    lowerVal = parseInt(lowerSlider.value);
    upperVal = parseInt(upperSlider.value);

    if (upperVal < lowerVal + 4) {
        lowerSlider.value = upperVal - 4;
        if (lowerVal == lowerSlider.min) {
            upperSlider.value = 4;
        }
    }
    document.querySelector('#two').value = this.value
};

lowerSlider.oninput = function() {
    lowerVal = parseInt(lowerSlider.value);
    upperVal = parseInt(upperSlider.value);
    if (lowerVal > upperVal - 4) {
        upperSlider.value = lowerVal + 4;
        if (upperVal == upperSlider.max) {
            lowerSlider.value = parseInt(upperSlider.max) - 4;
        }
    }
    document.querySelector('#one').value = this.value
};
//////////////////////////////