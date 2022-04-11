window.onscroll = function() {myFunction()};

function myFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
      document.getElementById("header").className = "scrolledHeader";
    } else {
      document.getElementById("header").className = "";
    }
  }
  