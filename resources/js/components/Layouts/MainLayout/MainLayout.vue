<template>
  <div id="mainLayout">
    <Menus />
    <div id="main-container">
      <BreadCrumbs />
      <div class="container">
        
        <RouterView v-slot="{ Component }">
          <transition name="route" mode="out-in">
            <component :is="Component" />
          </transition>
        </RouterView>

        <Modals />

      </div>
    </div>
  </div>
</template>

<script setup>
import Menus from './Menus.vue' 
import { computed } from 'vue'
import Modals from './Modals.vue'
import BreadCrumbs from './BreadCrumbs.vue'

</script>

<style lang="scss" scoped>

#main-container {
  position: absolute;
  width: calc(100vw - 250px);
  left: 250px;
  top: 70px;
}

/* Styles for mobile */
@media (max-width: 768px) {
  #main-container {
    width: 100%;
    left: 0px;
  }
}



/* route transitions */

.route-enter-from {
  opacity: 0;
  transform: translateX(100px);
}
.route-enter-active {
  transition: all 0.3s ease-out;
}
.route-leave-to {
  opacity: 0;
  transform: translateX(-100px);
}
.route-leave-active {
  transition: all 0.3s ease-in;
}

</style>