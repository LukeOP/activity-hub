<template>
  <section class="row">
    <div class="col col-12 col-md-6">
      <h2>State: <span class="value">{{ instrument.attributes.state.description }}</span></h2>
      <h2>Notes: <span class="value">{{ instrument.attributes.notes }}</span></h2>
    </div>
    <div class="col col-12 col-md-6">
      <h2>Type: <span class="value">{{ instrument.attributes.type }}</span></h2>
      <h2>Family: <span class="value">{{ instrument.attributes.family }}</span></h2>
    </div>
    <!-- <h2>Created: <span class="value">{{ formatDate(instrument.timestamp.created_at) }}</span></h2>
    <h2>Updated: <span class="value">{{ formatDate(instrument.timestamp.updated_at) }}</span></h2> -->
    <h2 v-if="instrument.timestamp.deleted_at">Removed from Service: <span class="value">{{ formatDate(instrument.timestamp.deleted_at) }}</span></h2>
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
  // border-bottom: 1px dashed $ah-primary;
}
h2 {
  color: $ah-primary-dark;
  font-weight: bold;
  font-size: 1rem;
  margin-right: 0.3rem;
}
.value {
  color: #212529;
  font-weight:400;
}

</style>