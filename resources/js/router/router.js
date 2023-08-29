import { createRouter, createWebHistory } from "vue-router";

import { useUserStore } from "../stores/user";
import publicRoutes from "./publicRoutes";
import authRoutes from "./authRoutes/authRoutes";

import Test from '../components/Public/Test.vue'

const routes = [
  {
    path: '/test',
    name: 'test',
    component: Test,
  },
  ...publicRoutes,
  ...authRoutes
]

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const user = useUserStore()
  if(sessionStorage.getItem('AHT') && user.attributes.id === 0){
    user.resetUserWithToken()
  }
  if(to.meta.requiresAuth && !user.token){
    next({name: 'Login'})
  } else {
    next()
  }
})

export default router;