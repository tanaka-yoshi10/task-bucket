import Vue from 'vue'
import vueCustomElement from 'vue-custom-element'
import TheTaskList from '../components/TheTaskList.vue'

Vue.use(vueCustomElement)

Vue.customElement('the-task-list', TheTaskList)

