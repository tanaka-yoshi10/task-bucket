<template>
  <div>
    <div @click="toggle">
      <div class="my-2">
        {{ task.title }}
      </div>
      <div class="form-inline" />
      <div class="my-2" />
      <div v-if="editable">
        初期表示の内容
      </div>
      <div v-else>
        クリックで切り替わった内容
      </div>
    </div>
  </div>
</template>

<script>
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
