<template>
  <div class="row">
    <p>{{ event.attributes.description }}</p>
    <div class="col col-12 col-md-3">
      <h3>Location:</h3>
      <span>{{ event.attributes.location }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Date:</h3>
      <span>{{ formatDate(event.attributes.date) }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3>Time:</h3>
      <span>{{ moment(event.attributes.time, 'HH:mm:ss').format('h:mma') }}</span>
    </div>
    <div class="col col-12 col-md-3">
      <h3></h3>
      <span></span>
    </div>
    
  </div>
</template>

<script setup>
import moment from 'moment';

const props = defineProps({event:Object})

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