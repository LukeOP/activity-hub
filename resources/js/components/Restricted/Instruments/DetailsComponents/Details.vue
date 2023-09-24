<template>
  <section>
    <div>State: {{ instrument.attributes.state.description }}</div>
    <div>Notes: {{ instrument.attributes.notes }}</div>
    <div>Type: {{ instrument.attributes.type }}</div>
    <div>Family: {{ instrument.attributes.family }}</div>
    <div>Created: {{ formatDate(instrument.timestamp.created_at) }}</div>
    <div>Updated: {{ formatDate(instrument.timestamp.updated_at) }}</div>
    <div v-if="instrument.timestamp.deleted_at">Removed from Service: {{ formatDate(instrument.timestamp.deleted_at) }}</div>
  </section>
</template>

<script setup>
import moment from 'moment';

const props = defineProps({instrument: Object})

function formatDate(date){
  return moment(date).format('DD MMM YYYY')
}

</script>

<style lang="scss" scoped>
section {
  padding: 10px 10px 2rem;
  border-bottom: 1px dashed $ah-primary;
}

</style>