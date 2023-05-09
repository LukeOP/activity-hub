<template>
  <menus />
  <div id="main-container">
    <div class="container">
      <h1>Hello</h1>
    </div>
  </div>
  
</template>

<script>
import Menus from '../Layouts/MainLayout/Menus.vue'
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
}

/* Styles for mobile */
@media (max-width: 768px) {
  #main-container {
    width: 100%;
    left: 0px;
  }
}

</style>