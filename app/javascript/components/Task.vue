<template>
  <div>
    <div @click="toggle">
      <div v-if="editable">
        <form
          id="edit_task_157"
          class="simple_form edit_task"
          novalidate="novalidate"
          action="/tasks/157"
          accept-charset="UTF-8"
          data-remote="true"
          method="post"
        >
          <input type="hidden" name="_method" value="patch"><div class="my-2">
            <input
              id="task_title"
              class="js-task-input form-control"
              placeholder="タスク名"
              type="text"
              value="vue"
              name="task[title]"
            >
          </div>
          <div class="form-inline">
            <input
              id="task_start_at"
              value="20:28"
              class="js-timepicker js-task-input form-control mr-2"
              placeholder="開始"
              type="text"
              name="task[start_at]"
            >
            <input
              id="task_end_at"
              class="js-timepicker js-task-input form-control mr-2"
              placeholder="終了"
              type="text"
              name="task[end_at]"
            >
            <input
              id="task_estimate"
              class="js-task-input form-control mr-2"
              placeholder="予測"
              type="number"
              name="task[estimate]"
            >
            0
            <div class="form-group select optional task_project">
              <select id="task_project_id" class="form-control select optional js-task-input" name="task[project_id]">
                <option value="" />
                <option value="3">
                  NR
                </option>
                <option value="1">
                  WNI
                </option>
                <option value="2">
                  家庭
                </option>
                <option value="5">
                  クルマ
                </option>
                <option value="4">
                  スタンド
                </option>
              </select>
            </div>
          </div>
          <div class="my-2">
            <textarea
              id="task_comment"
              class="js-task-input form-control"
              placeholder="ふりかえり"
              name="task[comment]"
            />
          </div>
          <div>
            <input
              type="submit"
              name="commit"
              value="更新する"
              class="btn btn-secondary js-submit-task"
            >
            <a
              data-confirm="Are you sure?"
              class="btn"
              data-remote="true"
              rel="nofollow"
              data-method="delete"
              href="/tasks/157"
            ><svg
              class="svg-inline--fa fa-trash fa-w-14"
              aria-hidden="true"
              focusable="false"
              data-prefix="fas"
              data-icon="trash"
              role="img"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 448 512"
              data-fa-i2svg=""
            ><path fill="currentColor" d="M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z" /></svg><!-- <i class="fas fa-trash"></i> --></a>
          </div>
        </form>
      </div>
      <div v-else>
        <div class="my-2">
          {{ task.title }}
        </div>
        <div class="form-inline">
          {{ task.start_at | timeFormat }}
          〜
          {{ task.end_at | timeFormat }}
          実績:
          {{ actual }}
        </div>
        <div class="my-2">
          <a
            class="mx-2 btn btn-danger"
            data-remote="true"
            rel="nofollow"
            data-method="put"
            href="/tasks/157/complete"
          ><svg
            class="svg-inline--fa fa-stop fa-w-14"
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="stop"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"
            data-fa-i2svg=""
          ><path fill="currentColor" d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48z" /></svg><!-- <i class="fas fa-stop"></i> --></a>
          <a
            class="mx-2 btn"
            data-remote="true"
            rel="nofollow"
            data-method="put"
            href="/tasks/157/pause"
          ><svg
            class="svg-inline--fa fa-pause fa-w-14"
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="pause"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"
            data-fa-i2svg=""
          ><path fill="currentColor" d="M144 479H48c-26.5 0-48-21.5-48-48V79c0-26.5 21.5-48 48-48h96c26.5 0 48 21.5 48 48v352c0 26.5-21.5 48-48 48zm304-48V79c0-26.5-21.5-48-48-48h-96c-26.5 0-48 21.5-48 48v352c0 26.5 21.5 48 48 48h96c26.5 0 48-21.5 48-48z" /></svg><!-- <i class="fas fa-pause"></i> --></a>
          <a class="btn js-edit-task" href="javascript:void(0)"><svg
            class="svg-inline--fa fa-cog fa-w-16"
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="cog"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 512 512"
            data-fa-i2svg=""
          ><path fill="currentColor" d="M487.4 315.7l-42.6-24.6c4.3-23.2 4.3-47 0-70.2l42.6-24.6c4.9-2.8 7.1-8.6 5.5-14-11.1-35.6-30-67.8-54.7-94.6-3.8-4.1-10-5.1-14.8-2.3L380.8 110c-17.9-15.4-38.5-27.3-60.8-35.1V25.8c0-5.6-3.9-10.5-9.4-11.7-36.7-8.2-74.3-7.8-109.2 0-5.5 1.2-9.4 6.1-9.4 11.7V75c-22.2 7.9-42.8 19.8-60.8 35.1L88.7 85.5c-4.9-2.8-11-1.9-14.8 2.3-24.7 26.7-43.6 58.9-54.7 94.6-1.7 5.4.6 11.2 5.5 14L67.3 221c-4.3 23.2-4.3 47 0 70.2l-42.6 24.6c-4.9 2.8-7.1 8.6-5.5 14 11.1 35.6 30 67.8 54.7 94.6 3.8 4.1 10 5.1 14.8 2.3l42.6-24.6c17.9 15.4 38.5 27.3 60.8 35.1v49.2c0 5.6 3.9 10.5 9.4 11.7 36.7 8.2 74.3 7.8 109.2 0 5.5-1.2 9.4-6.1 9.4-11.7v-49.2c22.2-7.9 42.8-19.8 60.8-35.1l42.6 24.6c4.9 2.8 11 1.9 14.8-2.3 24.7-26.7 43.6-58.9 54.7-94.6 1.5-5.5-.7-11.3-5.6-14.1zM256 336c-44.1 0-80-35.9-80-80s35.9-80 80-80 80 35.9 80 80-35.9 80-80 80z" /></svg><!-- <i class="fas fa-cog"></i> --></a>
          <a
            class="btn"
            data-remote="true"
            rel="nofollow"
            data-method="put"
            href="/tasks/157/clone"
          ><svg
            class="svg-inline--fa fa-clone fa-w-16"
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="clone"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 512 512"
            data-fa-i2svg=""
          ><path fill="currentColor" d="M464 0c26.51 0 48 21.49 48 48v288c0 26.51-21.49 48-48 48H176c-26.51 0-48-21.49-48-48V48c0-26.51 21.49-48 48-48h288M176 416c-44.112 0-80-35.888-80-80V128H48c-26.51 0-48 21.49-48 48v288c0 26.51 21.49 48 48 48h288c26.51 0 48-21.49 48-48v-48H176z" /></svg><!-- <i class="fas fa-clone"></i> --></a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { format as formatDate, parseISO } from 'date-fns'

export default {
  filters: {
    timeFormat(time) {
      return formatDate(parseISO(time), 'hh:mm')
    },
  },
  props: {
    task: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      editable: false,
    }
  },
  computed: {
    actual() {
      return Math.round((parseISO(this.task.end_at) - parseISO(this.task.start_at)) / 1000 / 60)
    },
  },
  mounted() {
  },
  methods: {
    toggle() {
      this.editable = !this.editable
    },
  },
}
</script>

<style scoped lang="sass">
</style>
