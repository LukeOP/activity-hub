<template>
    <JobsTableRowMobile v-for="job in eventStore.getEvent.jobs" :key="job" :job="job" />
</template>

<script setup>
import useSorter from '../../../../composables/useSorter';
import { useEventStore } from '../../../../stores/events';
import JobsTableRowMobile from './JobsTableRowMobile.vue'

const eventStore = useEventStore()
const sorter = useSorter()

sorter.sort(eventStore.getEvent.jobs, 'due_date')

</script>

<style lang="scss" scoped>

</style>