<template>
  <div id="mainLayout">
    <Menus />
    <div id="main-container">
      <BreadCrumbs />
      <div class="container">

        <RouterView v-slot="{ Component }">
          <transition :name="getTransitionName" mode="out-in">
            <component :is="Component" />
          </transition>
        </RouterView>

        <Modals />
      
        <Toast />

      </div>
    </div>
  </div>
</template>

<script setup>
import Menus from './Menus.vue' 
import Modals from './Modals.vue'
import BreadCrumbs from './BreadCrumbs.vue'
import { useRoute, useRouter } from 'vue-router';
import { computed, ref } from 'vue';
import Toast from './Elements/Toast.vue';

const router = useRouter()

// Store route depths for each section
const fromSectionDepth = ref() 
const toSectionDepth = ref() 

// Store route sections to maintain linear progression
const fromSection = ref()
const toSection = ref()

const getTransitionName = computed(() => {
  if(toSection.value === fromSection.value){
    if (fromSectionDepth.value < toSectionDepth.value) {
      return 'forwardFade';
    } else if (fromSectionDepth.value > toSectionDepth.value) {
      return 'backwardFade';
    } else {
      return '';
    }
  }
  else return 'fade'
})

// Update section depth before navigation
router.beforeEach((to, from, next) => {
  fromSectionDepth.value = from.meta.depth
  toSectionDepth.value = to.meta.depth
  fromSection.value = from.meta.section
  toSection.value = to.meta.section
  next()
})

</script>

<style lang="scss" scoped>

#main-container {
  position: absolute;
  width: calc(100% - 250px);
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
</style>
