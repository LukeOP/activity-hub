<template>
  <div id="mainLayout">
    <menus />
    <div id="main-container">
      <div class="container">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Menus from './Menus.vue' 

export default {
  components: {
    Menus
  }
}
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

</style>