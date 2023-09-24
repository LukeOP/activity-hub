<template>
  <div v-for="member in staff" :key="member" class="staff">
    <h3>member</h3>
    <!-- <StaffTableMobileCard :staff="member" /> -->
  </div>
</template>

<script setup>
// import StaffTableMobileCard from './StaffTableMobileCard.vue'
const props = defineProps({staff:Array});
</script>

<style lang="scss" scoped>
.staff {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>