<template>
  <div>
    <HeaderLine :heading="currentEvent.attributes.name + ' - Event Details'" :school="currentEvent.school.name"/>
    <Details :event="currentEvent" />
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import Details from './DetailsComponents/Details.vue'

const eventStore = useEventStore()
const currentEvent = ref(eventStore.getEvent)

</script>

<style lang="scss" scoped>

</style>