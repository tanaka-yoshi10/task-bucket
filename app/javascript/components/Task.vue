<template>
  <div>
    <div @click="toggle">
      <div v-if="editable">
        編集画面
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
          14
        </div>
        <div class="my-2"></div>
      </div>
    </div>
  </div>
</template>

<script>
import { format as formatDate, parseISO } from 'date-fns'

export default {
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
  },
  mounted() {
    console.log(formatDate(parseISO(this.task.start_at), 'hh:mm'))
  },
  methods: {
    toggle() {
      this.editable = !this.editable
    },
  },
  filters: {
    timeFormat(time) {
      return formatDate(parseISO(time), 'hh:mm')
    }
  }
}
</script>

<style scoped lang="sass">
</style>
