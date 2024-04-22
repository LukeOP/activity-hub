<template>
  <div v-for="lesson in lessons" :key="lesson" class="lesson">
    <ReviewTableMobileCard :lesson="lesson" />
  </div>
</template>

<script setup>
import ReviewTableMobileCard from './ReviewTableMobileCard.vue'
const props = defineProps({lessons:Array});
</script>

<style lang="scss" scoped>
.lesson {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>