window.onload = function () {
  startTime();
  checkTime();
}

function startTime() {
  const today = new Date();
  let h = today.getHours();
  let m = today.getMinutes();
  let s = today.getSeconds();
  h = checkTime(h);
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('h').innerHTML = h + ":";
  document.getElementById('m').innerHTML = m + ":";
  document.getElementById('s').innerHTML = s;
  setTimeout(startTime, 1000);

  const hour = document.getElementById('t');

  if (h >= 0 && h < 12) {
    hour.innerHTML = "AM"
  } else {
    if (h >= 12) {
      hour.innerHTML = "PM"
    }
  }

}

function checkTime(i) {
  if (i < 10) { i = "0" + i };  // add zero in front of numbers < 10
  return i;
}
