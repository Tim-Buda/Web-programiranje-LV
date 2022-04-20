window.onscroll = function () { myFunction() };

function myFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementById("header").className = "scrolledHeader";
  } else {
    document.getElementById("header").className = "";
  }
}

var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}


//https://medium.com/@dtkatz/3-ways-to-fix-the-cors-error-and-how-access-control-allow-origin-works-d97d55946d9
//https://cors-anywhere.herokuapp.com/ -- proxy
//https://openexchangerates.org/signup -- api 
//https://rapidapi.com/natkapral/api/currency-converter5/pricing --api
//https://rapidapi.com/apilayer/api/currencylayer/pricing --api
var api_url = 'https://api.hnb.hr/tecajn/v1?valuta=EUR';
async function getHnbData(){
  var tokPodataka = await fetch(api_url);
  console.log(tokPodataka);
  var podaci = await tokPodataka.json();
  console.log(podaci);

  var cijenaEurSezona = parseFloat(document.getElementById('sezona').textContent);
  var cijenaEurVanSezone = parseFloat(document.getElementById('van-sezone').textContent);

  var cijena1 = parseFloat(podaci[0]["Srednji za devize"].replace(',', '.'))*cijenaEurSezona;
  var cijena2 = parseFloat(podaci[0]["Srednji za devize"].replace(',', '.'))*cijenaEurVanSezone;

  document.getElementById('tecaj1').textContent = Math.round((cijena1 + Number.EPSILON) * 100) / 100 + 'HRK';
  document.getElementById('tecaj2').textContent = Math.round((cijena2 + Number.EPSILON) * 100) / 100 + 'HRK';

}
getHnbData();
//setInterval(getHnbData, 20000);
