import { createRouter, createWebHistory } from "vue-router";

import { useUserStore } from "../stores/user";
import { useGeneralStore } from "../stores/general";
import publicRoutes from "./publicRoutes";
import authRoutes from "./authRoutes";

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
  if(to.meta.requiresAuth && !user.token){
    next({name: 'home'})
  } else {
    next()
  }
})

export default router;