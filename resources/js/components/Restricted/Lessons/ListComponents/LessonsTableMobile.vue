<template>
  <div v-for="lesson in lessons" :key="lesson" class="lesson">
    <LessonsTableMobileCard :lesson="lesson" />
  </div>
</template>

<script setup>
import LessonsTableMobileCard from './LessonsTableMobileCard.vue'
const props = defineProps({lessons:Array});
</script>

<style lang="scss" scoped>
.lesson {
  &:nth-child(odd){
  background-color: lighten($ah-primary-background, 6%);
  }
}
</style>