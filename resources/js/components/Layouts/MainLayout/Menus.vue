<template>
  <div id="logo-img">
    <ActivityHubIconSVG />
  </div>
  <div class="menus">
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
  // background: rgb(83, 34, 34);
}
#logo-img {
  position: absolute;
  max-width: 60px;
  height: 60px;
  left: 10px;
  top: 5px;
  visibility: hidden;
}
@media (max-width: 768px) {
  .menus {
    height: 60px;
  }
  #logo-img {
    visibility: visible;
  }
}
</style>