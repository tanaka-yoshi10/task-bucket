import $ from 'jquery'
import 'bootstrap-datepicker'

$(() => {
  $('.js-datepicker').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd',
    todayHighlight: true,
    weekStart: 1,
    disableTouchKeyboard: true,
    orientation: 'bottom auto',
  })
})