import $ from 'jquery'
import 'timepicker/jquery.timepicker'

document.addEventListener('turbolinks:load', () => {
  $('.js-timepicker').timepicker({
    timeFormat: 'H:i',
    show2400: true,
  })
})
