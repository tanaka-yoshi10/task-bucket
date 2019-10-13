import Vue from 'vue'
import vueCustomElement from 'vue-custom-element'
import BootstrapVue from 'bootstrap-vue'
import TheTaskList from '../components/TheTaskList.vue'

Vue.use(vueCustomElement)
Vue.use(BootstrapVue)

Vue.customElement('the-task-list', TheTaskList)
