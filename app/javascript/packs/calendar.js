import $ from 'jquery'
import 'fullcalendar'

document.addEventListener('turbolinks:load', () => {
  const $calendar = $('#js-calendar')
  const options = {
    header: {
      left: '',
      center: '',
      right: '',
    },
    defaultView: $calendar.data('default-view'),
    allDaySlot: false,
    events: $calendar.data('tasks'),
    firstDay: 1,
    height: 'parent',
  }
  const date = $calendar.data('default-date')
  if (date) {
    options.defaultDate = date
  }
  $calendar.fullCalendar(options)
})
