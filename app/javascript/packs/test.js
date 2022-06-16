window.onscroll = function () { myFunction() };

function myFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementById("header").className = "scrolledHeader";
  } else {
    document.getElementById("header").className = "";
  }
}



!function (d, s, id) { 
  var js, fjs = d.getElementsByTagName(s)[0]; 
  if (!d.getElementById(id)) { 
    js = d.createElement(s); 
    js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; 
    fjs.parentNode.insertBefore(js, fjs); 
  } 
}(document, 'script', 'weatherwidget-io-js');