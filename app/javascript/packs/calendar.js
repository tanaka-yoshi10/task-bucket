import $ from 'jquery'
import 'fullcalendar'

document.addEventListener('turbolinks:load', () => {
  const events = $('#js-weekly-calendar').data('tasks')
  const options = {
    defaultView: 'agendaWeek',
    allDaySlot: false,
    events: events,
  }
  $('#js-weekly-calendar').fullCalendar(options)
})
