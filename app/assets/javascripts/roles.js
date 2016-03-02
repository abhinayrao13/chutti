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
  $('#calendar').fullCalendar({
       // put your options and callbacks here
       header: {
         left: 'prev,next today',
         center: 'title',
         right: 'month,agendaWeek,agendaDay'
       },
       buttonText: {
         today: 'today',
         month: 'month',
         week: 'week',
         day: 'day'
       },
       editable: true
   });
})
