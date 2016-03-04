function checkin() {
  $.ajax({
      url: "/checkins/checkin"
  });
}
function checkout() {
  $.ajax({
      url: "/checkins/checkout"
  });
}
