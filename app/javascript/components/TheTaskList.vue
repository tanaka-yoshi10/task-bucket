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
            <li
              v-for="(task, index) in doingTasks"
              :id="'row_task_' + task.id"
              :key="index"
              class="list-group-item js-task-view my-2"
            >
              <Task
                :task="task"
              />
            </li>
          </ul>
        </div>
      </div>
    </div>
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
            未着手</a>
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
            <li
              v-for="(task, index) in notStartedTasks"
              :id="'row_task_' + task.id"
              :key="index"
              class="list-group-item js-task-view my-2"
            >
              <Task
                :task="task"
              />
            </li>
          </ul>
        </div>
      </div>
    </div>
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
            完了</a>
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
            <li
              v-for="(task, index) in completedTasks"
              :id="'row_task_' + task.id"
              :key="index"
              class="list-group-item js-task-view my-2"
            >
              <Task
                :task="task"
              />
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
import Task from './Task.vue'
import { tasksPath } from '../javascripts/rails-routes'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  components: { Task },
  data() {
    return {
      tasks: [],
      newTask: '',
    }
  },
  computed: {
    completedTasks() {
      const filteredStories = this.tasks.filter((task) => task.completed)
      const orderedStories = filteredStories.sort((a, b) => b.created_at - a.created_at)
      return orderedStories
    },
    doingTasks() {
      const filteredStories = this.tasks.filter((task) => { return task.start_at && !task.end_at})
      const orderedStories = filteredStories.sort((a, b) => b.created_at - a.created_at)
      return orderedStories
    },
    notStartedTasks() {
      const filteredStories = this.tasks.filter((task) => { return !task.start_at && !task.end_at })
      const orderedStories = filteredStories.sort((a, b) => b.created_at - a.created_at)
      return orderedStories
    },
  },
  mounted() {
    this.fetchTasks()
  },
  methods: {
    fetchTasks() {
      axios.get(tasksPath({ format: 'json' })).then((response) => {
        for (let i = 0; i < response.data.tasks.length; i++) {
          this.tasks.push(response.data.tasks[i])
        }
      }, (error) => {
      })
    },
  },
}
</script>

<style scoped lang="sass">
</style>
