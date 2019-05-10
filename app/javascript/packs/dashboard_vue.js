import Vue from 'vue/dist/vue.esm.js'
import Index from './components/index.vue'

var app = new Vue({
  el: '#app',
  components: {
    'container': Index,
  }
});
