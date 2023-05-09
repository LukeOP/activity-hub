<template>
  <div class="menus">
    <img id="logo-img" src="/images/ActivityHub-Logo-Icon.png" alt="Activity Hub Logo">
    <nav-bar @setState="stateControl" :state="currentState" />
    <action-bar @setState="stateControl" :state="currentState" />
  </div>
</template>

<script>
import NavBar from './NavBar.vue'
import ActionBar from './ActionBar.vue'
import { ref, watch } from 'vue'

export default {
  components: {
    NavBar,
    ActionBar
  },
  setup(){

    const currentState = ref('')

    function stateControl(state){
      if(state === 'action true') currentState.value = 'action'
      if(state === 'menu true') currentState.value = 'menu'
    }

      return { currentState, stateControl }
  }
}
</script>

<style lang="scss" scoped>
.menus {
  position:fixed;
  height: 70px;
  width: 100vw;
  z-index: 100;
  margin-bottom: 1rem;
  background: white;
  #logo-img {
    position: absolute;
    height: 60px;
    left: 20px;
    top: 10px;
  }
}
</style>