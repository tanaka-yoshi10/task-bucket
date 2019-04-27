import $ from 'jquery'
import 'timepicker/jquery.timepicker'

$(() => {
  $(document).on('blur', '.js-task-row .js-task-input', (e) => {
    const $target = $(e.target)
    const $row = $target.closest('.js-task-row')
    $row.find('input[type="submit"]').click()
  })
})
