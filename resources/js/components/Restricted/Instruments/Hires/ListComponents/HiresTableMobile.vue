<template>
  <div v-for="hire in filteredHires" :key="hire" class="hire">
    <HiresTableMobileCard :hire="hire" />
  </div>
</template>

<script setup>
import { useHireStore } from '../../../../../stores/hires';
import HiresTableMobileCard from './HiresTableMobileCard.vue';
const hireStore = useHireStore()
const filteredHires = hireStore.getFilteredHires
</script>

<style lang="scss" scoped>
.hire {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>