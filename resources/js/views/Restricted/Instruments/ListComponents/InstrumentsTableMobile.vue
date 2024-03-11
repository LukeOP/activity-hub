<template>
  <div v-for="instrument in instruments" :key="instrument" class="instrument">
    <InstrumentsTableMobileCard :instrument="instrument" />
  </div>
</template>

<script setup>
import InstrumentsTableMobileCard from './InstrumentsTableMobileCard.vue'
const props = defineProps({instruments:Array});
</script>

<style lang="scss" scoped>
.instrument {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>