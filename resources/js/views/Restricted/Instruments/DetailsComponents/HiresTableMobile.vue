<template>
  <div v-for="hire in hires" :key="hire" class="hire">
    <HiresTableMobileCard :hire="hire" />
  </div>
</template>

<script setup>
import HiresTableMobileCard from './HiresTableMobileCard.vue'
const props = defineProps({hires:Array});
</script>

<style lang="scss" scoped>
.hire {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>