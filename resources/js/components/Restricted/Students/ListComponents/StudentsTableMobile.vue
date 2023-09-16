<template>
  <div v-for="student in studentStore.getFilteredStudents" :key="student" class="student">
    <StudentsTableMobileCard :student="student" />
  </div>
</template>

<script setup>
import { useStudentStore } from '/resources/js/stores/students';
import StudentsTableMobileCard from './StudentsTableMobileCard.vue'
const studentStore = useStudentStore()
</script>

<style lang="scss" scoped>
.student {
  &:nth-child(odd){
    background-color: lighten($ah-primary-background, 6%);
  }
  &:last-child {
    border-bottom: 3px solid $ah-primary;
  }
}
</style>