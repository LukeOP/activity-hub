<template>
  <div v-for="request in requests" :key="request" class="request">
    <RequestsTableMobileCard :request="request" />
  </div>
</template>

<script setup>
import RequestsTableMobileCard from './RequestsTableMobileCard.vue'
const props = defineProps({requests:Array});
</script>

<style lang="scss" scoped>
.request {
  &:nth-child(odd){
  background-color: lighten($ah-primary-background, 6%);
  }
}
</style>