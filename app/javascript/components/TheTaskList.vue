<template>
  <div
    id="accordion"
    class="accordion"
    aria-multiselectable="true"
    role="tablist"
  >
    <TaskList
      title="実行中"
      :task-list="doingTasks"
      tab-id="doing"
      @task-updated="onTaskUpdated"
      @task-removed="onTaskRemoved"
    />
    <TaskList
      title="未着手"
      :task-list="notStartedTasks"
      tab-id="not-started"
      @task-updated="onTaskUpdated"
      @task-removed="onTaskRemoved"
    />
    <TaskList
      title="完了"
      :task-list="completedTasks"
      tab-id="completed"
      @task-updated="onTaskUpdated"
      @task-removed="onTaskRemoved"
    />
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from '@rails/ujs'
import TaskList from './TaskList.vue'
import { tasksPath } from '../javascripts/rails-routes'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  components: { TaskList },
  data() {
    return {
      tasks: [],
      newTask: '',
    }
  },
  computed: {
    completedTasks() {
      const tasks = this.tasks.filter((task) => task.start_at && task.end_at)
      return this.orderByCreatedAt(tasks)
    },
    doingTasks() {
      const tasks = this.tasks.filter((task) => task.start_at && !task.end_at)
      return this.orderByCreatedAt(tasks)
    },
    notStartedTasks() {
      const tasks = this.tasks.filter((task) => !task.start_at && !task.end_at)
      return this.orderByCreatedAt(tasks)
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
    orderByCreatedAt(tasks) {
      return tasks.sort((a, b) => b.created_at - a.created_at)
    },
    onTaskUpdated(task) {
      const index = this.tasks.findIndex(item => item.id === task.id)
      if (index === -1) {
        this.tasks.push(task)
      } else {
        this.tasks.splice(index, 1, task)
      }
    },
    onTaskRemoved(task) {
      const index = this.tasks.findIndex(item => item.id === task.id)
      if (index !== -1) {
        this.tasks.splice(index, 1)
      }
    },
  },
}
</script>

<style scoped lang="sass">
</style>
