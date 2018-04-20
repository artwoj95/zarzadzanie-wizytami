var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      defaultTimedEventDuration: '00:30:00',
      selectable: true,
      selectHelper: true,
      editable: false,
      eventLimit: true,
      events: calendar.data('path'),
      timeFormat: 'H:mm'
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);