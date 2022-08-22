/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import App from './App.vue'
import router from './router'
import './assets/styles/global.scss'
// 動態加載rem基準值
import 'amfe-flexible'
// import vant
import Vant from 'vant'
import 'vant/lib/index.css'
import VueAxios from 'vue-axios'
import axios from 'axios'

// axios.defaults.baseURL = 'http://140.118.122.153:8000'
axios.defaults.timeout = 10000

Vue.use(VueAxios, axios)
Vue.use(Vant)
Vue.config.productionTip = false

// const app = new Vue({
//     el: '#app',
// });

const app = new Vue({
    router,
    render: h => h(App)
  }).$mount('#app')