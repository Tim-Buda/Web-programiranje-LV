window.onscroll = function () { myFunction() };

function myFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementById("header").className = "scrolledHeader";
  } else {
    document.getElementById("header").className = "";
  }
}

document.getElementById("loginButton").onclick = function() {displayForm()};

function displayForm() {
  document.getElementById('id01').style.display='block';
}

var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
