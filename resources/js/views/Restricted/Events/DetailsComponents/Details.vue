<template>
  <div class="row">
    <p>{{ eventStore.getEvent.attributes.description }}</p>
    <div class="col col-12 col-md-3">
      <h3>Location:</h3>
      <span>{{ eventStore.getEvent.attributes.location }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Date:</h3>
      <span>{{ formatDate(eventStore.getEvent.attributes.date) }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Time:</h3>
      <span>{{ moment(eventStore.getEvent.attributes.time, 'HH:mm:ss').format('h:mma') }}</span>
    </div>
    <div class="col col-12">
      <h3>Notes:</h3>
      <span>{{ eventStore.getEvent.attributes.notes }}</span>
    </div>
    
  </div>
</template>

<script setup>
import moment from 'moment';
import { useEventStore } from '../../../../stores/events';

const eventStore = useEventStore()

function formatDate(date){
  return moment(date).format('MMM Do, YYYY')
}

</script>

<style lang="scss" scoped>
h3 {
  color: $ah-primary-dark;
  display: inline-block;
  margin-right: 1rem;
}

</style>