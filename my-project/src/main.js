// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Vuetify from 'vuetify'
import BootstrapVue from 'bootstrap-vue'
import Vuelidate from 'vuelidate'
import store from './store/store.js'
import axios from './plugins/axios.js'
import VeeValidate from 'vee-validate';
import VueSweetalert2 from 'vue-sweetalert2';
import VueCustomScrollbar from "vue-custom-scrollbar";

Vue.use(VueCustomScrollbar)
Vue.use(VueSweetalert2)
Vue.use(VeeValidate)
Vue.use(Vuelidate)
Vue.use(BootstrapVue)
Vue.use(Vuetify)
Vue.config.productionTip = false
Vue.use(axios)

import 'vuetify/dist/vuetify.min.css' // Ensure you are using css-loader
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'bootstrap/dist/css/bootstrap.min.css'

Vue.use(VeeValidate, {
  classes: true,
  // This is the default
  inject: true,
  // Important to name this something other than 'fields'
  fieldsBagName: 'veeFields',
  // This is not required but avoids possible naming conflicts
  errorBagName: 'veeErrors',
  classNames: {
    valid: 'is-valid',
    invalid: 'is-invalid'
  }
});
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
export const eventBus = new Vue()


