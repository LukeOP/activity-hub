<template>
  <!-- <menus /> -->
  <div id="main-container" class="mt-5">
  </div>
  
</template>

<script setup>
import Menus from '../Layouts/MainLayout/Menus.vue'

</script>

<style lang="scss" scoped>
#main-container {
  position: absolute;
  width: calc(100vw - 250px);
  left: 250px;
}
.icon {
  width: 4rem;
  fill: rgb(202, 83, 4);
  &:hover{
    fill: purple;
  }
}

/* Styles for mobile */
@media (max-width: 768px) {
  #main-container {
    width: 100%;
    left: 0px;
  }
}

</style>