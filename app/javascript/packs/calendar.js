import $ from 'jquery'
import 'fullcalendar'

document.addEventListener('turbolinks:load', () => {
  const events = $('#js-weekly-calendar').data('tasks')
  const options = {
    header: {
      left: '',
      center: '',
      right: '',
    },
    defaultView: 'agendaWeek',
    allDaySlot: false,
    events: events,
    firstDay: 1,
    height: 'parent',
  }
  const date = $('#js-weekly-calendar').data('default-date')
  if (date) {
    options.defaultDate = date
  }
  $('#js-weekly-calendar').fullCalendar(options)
})
