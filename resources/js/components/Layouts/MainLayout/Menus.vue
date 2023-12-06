<template>
  <div class="menus">
    <div id="logo-img">
      <ActivityHubIconSVG />
    </div>
    <top-bar />
    <profile-menu />
    <nav-bar @setState="stateControl" :state="currentState" />
    <action-bar @setState="stateControl" :state="currentState" />
    <filter-bar @setState="stateControl" :state="currentState" />
  </div>
</template>

<script setup>
import NavBar from './NavBar.vue'
import ActionBar from './ActionBar.vue'
import FilterBar from './FilterBar.vue'
import ProfileMenu from './ProfileMenu.vue'
import TopBar from './TopBar.vue'
import { ref } from 'vue'
import ActivityHubIconSVG from './Elements/SVG/ActivityHubIconSVG.vue'


const currentState = ref('')

function stateControl(state){
  if(state === 'action true') currentState.value = 'action'
  if(state === 'nav true') currentState.value = 'nav'
  if(state === 'filter true') currentState.value = 'filter'
}
</script>

<style lang="scss" scoped>
.menus {
  position:fixed;
  height: 50px;
  width: 100vw;
  z-index: 100;
  margin-bottom: 1rem;
  // background: white;
  #logo-img {
    position: absolute;
    height: 60px;
    left: 20px;
    top: 10px;
  }
}
@media (max-width: 768px) {
  .menus {
    height: 70px;
  }
}
</style>