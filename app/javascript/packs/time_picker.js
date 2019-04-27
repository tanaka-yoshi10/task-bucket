import $ from 'jquery'
import 'timepicker/jquery.timepicker'

$(() => {
  $('.js-timepicker').timepicker({
    timeFormat: 'H:i',
    show2400: true,
  })
})
