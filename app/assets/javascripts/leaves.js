var my_events = {
  events: [
    {
      title: 'event 1',
      start: '2015-01-04',
      end: '2015-01-06',
      color: 'tomato'
    },
  ]
};



var events = []; //The array

$(document).ready(function(){
  $('input[id="leave_date_picker"]').daterangepicker({
     autoUpdateInput: false,
    locale: {
            format: 'DD/MM/YYYY'
        },
    "minDate":  $('#current_date').data("todays-date")
  });

  $('input[id="leave_date_picker"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
      $('#leave_leave_date_from').val(picker.startDate.format('DD/MM/YYYY'));
      $('#leave_leave_date_to').val(picker.endDate.format('DD/MM/YYYY'));
  });

  //$('#calendar').fullCalendar();

  $.ajax({
    url: "/leaves/admin_index", method: "get", datatype: "json",
    success: function (leaves,users){console.log (leaves.users);
       employee_list = leaves.leaves;
       user_list = leaves.users;
       for(var i =0; i < employee_list.length; i++)
       {events.push( {title: user_list[i] , start: employee_list[i].leave_date_from , end: employee_list[i].leave_date_to,url: '/leaves/'+employee_list[i].id+'/leave_decision'})};

       //
       $('#calendar').fullCalendar({
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
           events:events,
           // [
           //     {
           //         title  : 'event1',
           //         start  : '2016-03-01',
           //         url: 'http://google.com/'
           //     },
           //     {
           //         title  : 'event2',
           //         start  : '2016-01-05',
           //         end    : '2016-01-07',
           //         url: 'http://google.com/'
           //     }
           // ],
           eventClick: function(events) {
               if (event.url) {
                   window.open(event.url);
                   return false;
               }
           }
       });

    }
  });






$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
});

})
