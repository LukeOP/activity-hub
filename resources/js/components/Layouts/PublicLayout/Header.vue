<template>
  <div class="container py-2">
    <div id="logo-icon">
      <ActivityHubIconSVG />
    </div>
    <span id="company-name">Activity Hub</span>
  </div>
</template>

<script setup>
import ActivityHubIconSVG from '../MainLayout/Elements/SVG/ActivityHubIconSVG.vue'

</script>

<style lang="scss" scoped>
#logo-icon {
  display: inline-block;
  height: 50px;
}
#company-name {
  padding-top:15px;
  font-size: 20px
}

</style>