<template>
  <div
    id="accordion"
    class="accordion"
    aria-multiselectable="true"
    role="tablist"
  >
    <div class="card">
      <div id="headingOne" class="card-header" role="tab">
        <h5 class="mb-0">
          <a
            class="text-body"
            aria-controls="collapseOne"
            aria-expanded="true"
            data-toggle="collapse"
            href="#collapseOne"
            role="button"
          >
            実行中</a>
        </h5>
      </div>
      <div
        id="collapseOne"
        class="collapse show"
        aria-labelledby="headingOne"
        role="tabpanel"
      >
        <div class="card-body">
          <ul class="list-group">
            <li v-for="task in tasks" :id="'row_task_' + task.id" class="list-group-item js-task-view my-2">
              <div class="js-task-toggle-view">
                <div class="my-2">
                  {{ task.title }}
                </div>
                <div class="form-inline" />
                <div class="my-2" />
              </div>
              <div class="my-2">
                <div class="btn-group">
                  <a
                    class="btn btn-success"
                    data-remote="true"
                    rel="nofollow"
                    data-method="put"
                    :href="'/tasks/' + task.id + '/start'"
                  ><svg
                    class="svg-inline--fa fa-play fa-w-14"
                    aria-hidden="true"
                    focusable="false"
                    data-prefix="fas"
                    data-icon="play"
                    role="img"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"
                    data-fa-i2svg=""
                  ><path fill="currentColor" d="M424.4 214.7L72.4 6.6C43.8-10.3 0 6.1 0 47.9V464c0 37.5 40.7 60.1 72.4 41.3l352-208c31.4-18.5 31.5-64.1 0-82.6z" /></svg><!-- <i class="fas fa-play"></i> --></a>
                  <button
                    aria-expanded="false"
                    aria-haspopup="true"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    type="button"
                  >
                    <span class="caret" />
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item">
                      <a
                        data-remote="true"
                        rel="nofollow"
                        data-method="put"
                        :href="'/tasks/' + task.id + '/start?from_just_before=true'"
                      >直前のタスクの終了時刻から開始</a>
                    </li>
                    <li class="dropdown-item">
                      <a
                        data-remote="true"
                        rel="nofollow"
                        data-method="put"
                        :href="'/tasks/' + task.id + '/postpone'"
                      >明日に延期</a>
                    </li>
                  </ul>
                </div>
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
                  :href="'/tasks/' + task.id + '/clone'"
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
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from '@rails/ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  data() {
    return {
      tasks: [],
      newTask: '',
    }
  },
  mounted() {
    this.fetchTasks()
  },
  methods: {
    fetchTasks() {
      axios.get('/tasks.json').then((response) => {
        for (let i = 0; i < response.data.tasks.length; i++) {
          console.log(response.data.tasks[i])
          this.tasks.push(response.data.tasks[i])
        }
      }, (error) => {
        console.log(error)
      })
    },
    createTask() {
    },
    doneTask(task_id) {
    },
    moveFinishedTask(task_id) {
    },
  },
}
</script>

<style scoped lang="sass">
</style>
