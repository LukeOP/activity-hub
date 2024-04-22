<template>
  <div v-for="attendance in attendanceData" :key="attendance" class="attendance">
    <AttendanceTableMobileCard :attendance="attendance" />
  </div>
</template>

<script setup>
import AttendanceTableMobileCard from './AttendanceTableMobileCard.vue'
const props = defineProps({attendanceData:Array});
</script>

<style lang="scss" scoped>
.attendance {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
}
</style>