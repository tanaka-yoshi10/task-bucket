import $ from 'jquery'
import 'timepicker/jquery.timepicker'

document.addEventListener('turbolinks:load', () => {
  $(document).on('click', '.js-timepicker', function () {
    $(this).timepicker({
      timeFormat: 'H:i',
      show2400: true,
    })
    $(this).timepicker('show')
  })
})
