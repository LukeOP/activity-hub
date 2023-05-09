import.meta.glob('./bootstrap');
// require('./bootstrap');

import {createApp} from 'vue'
import { createPinia } from 'pinia';

import App from './App.vue'

import router from './router/router';
import '../sass/app.scss'

import ToastPlugin from 'vue-toast-notification';
import 'vue-toast-notification/dist/theme-default.css';
// import 'vue-toast-notification/dist/theme-custom.css';

const pinia = createPinia()

createApp(App)
  .use(pinia)
  .use(router)
  .use(ToastPlugin)
  .mount("#app")


