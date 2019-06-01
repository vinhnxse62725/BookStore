// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Vuetify from 'vuetify'
import BootstrapVue from 'bootstrap-vue'
import Vuelidate from 'vuelidate'

Vue.use(Vuelidate)
Vue.use(BootstrapVue)
Vue.use(Vuetify)
Vue.config.productionTip = false

import 'vuetify/dist/vuetify.min.css' // Ensure you are using css-loader
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
