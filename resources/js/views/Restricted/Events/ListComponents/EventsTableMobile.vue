<template>
    <EventsTableMobileCard v-for="event in events" :key="event" :event="event" />
</template>

<script setup>
import EventsTableMobileCard from './EventsTableMobileCard.vue'
const props = defineProps({events:Array});
</script>

<style lang="scss" scoped>

</style>