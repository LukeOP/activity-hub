import { createRouter, createWebHistory } from "vue-router";

import { useUserStore } from "../stores/user";
import publicRoutes from "./publicRoutes";
import authRoutes from "./authRoutes";

import Test from '../views/Public/Test.vue'
import { useFilterStore } from "../stores/filter";

const routes = [
  {
    path: '/test',
    name: 'test',
    component: Test,
  },
  ...publicRoutes,
  ...authRoutes,
  {
    path: "/:catchAll(.*)",
    redirect: (to) => {
      const user = useUserStore()
      if(user.token){
        return { name: "NotFoundRestricted"}
      } else {
        return { name: "NotFoundPublic"}
      }
    }
  }
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
  const filter = useFilterStore()
  filter.reset()
  if(to.meta.requiresAuth && !user.token){
    next({name: 'Login'})
  } else {
    next()
  }
})

export default router;