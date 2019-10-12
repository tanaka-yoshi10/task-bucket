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
    height: '650',
    slotLabelFormat: 'HH:mm',
    timeFormat: 'HH:mm',
    eventRender(event, element) {
      $(element).tooltip({ title: event.title })
    },
  }
  const date = $calendar.data('default-date')
  if (date) {
    options.defaultDate = date
  }
  $calendar.fullCalendar(options)
})
