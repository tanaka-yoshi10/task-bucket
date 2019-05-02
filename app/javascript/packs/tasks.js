import $ from 'jquery'
import 'timepicker/jquery.timepicker'

document.addEventListener('turbolinks:load', () => {
  $('.container-fluid').on('click', '.js-task-toggle-view', (event) => {
    const target = $(event.target)
    const row = target.closest('.js-task-row')
    const view = row.find('.js-task-view')
    const edit = row.find('.js-task-edit')

    view.addClass('d-none')
    edit.removeClass('d-none')
  })

  $(document).on('click', '.js-submit-task', (event) => {
    const target = $(event.target)
    const row = target.closest('.js-task-row')
    const view = row.find('.js-task-view')
    const edit = row.find('.js-task-edit')

    view.removeClass('d-none')
    edit.addClass('d-none')
  })
})

