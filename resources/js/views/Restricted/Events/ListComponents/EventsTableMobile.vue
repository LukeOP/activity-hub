<template>
  <div v-for="event in events" :key="event" class="event">
    <EventsTableMobileCard :event="event" />
  </div>
</template>

<script setup>
import EventsTableMobileCard from './EventsTableMobileCard.vue'
const props = defineProps({events:Array});
</script>

<style lang="scss" scoped>
.event {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>