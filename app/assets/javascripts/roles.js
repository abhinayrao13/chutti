function to_check(){
  var a = document.getElementById("user_role");
  var letters = /^[A-Za-z]+$/;
  if (a.value == "") {
    alert("pls fill the feilds");
    return false;
  }
  else if(!a.value.match(letters)){
    alert("enter only letters");
    return false;
  }
}

function my_btn(l) {
  $.ajax({ url: "/roles/"+ l, method: "delete", datatype: "json",
  success: function (data) {
    console.log(data);
    $("#role_" + data.id).remove();
  }
 });
}
$(document).ready(function(){
  $('input[id="datetimepicker"]').daterangepicker({
    locale: {
            format: 'DD/MM/YYYY'
        },
    "minDate":  $('#current_date').data("todays-date"),
    startDate: '-2m',
    endDate: '+2d'
  });
})
