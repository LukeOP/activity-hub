<template>
  <div v-for="lesson in lessons" :key="lesson" class="lesson" v-if="lessons.length > 0">
    <!-- <pre>{{ lesson }}</pre> -->
    
    <ReviewTableMobileCard :lesson="lesson" />
  </div>
  <div v-else class="noRecords">
    <p id="main-comment">No records for this time period</p>
    <p>Use the filter to select a different date range</p>
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
.noRecords {
  color: $ah-grey;
  text-align: center;
  padding: 20px;
  background-color: $ah-grey-background;
  #main-comment {
    font-size: 1.25rem;
    color: $ah-primary;
  }
}
</style>