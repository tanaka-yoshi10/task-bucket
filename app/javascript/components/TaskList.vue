<template>
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
          {{ title }}</a>
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
            v-for="(task, index) in taskList"
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
</template>

<script>
import Task from './Task.vue'

export default {
  components: { Task },
  props: {
    taskList: {
      type: Array,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
  },
}
</script>

<style scoped lang="sass">
</style>
