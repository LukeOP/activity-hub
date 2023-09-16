<template>
  <div v-if="Object.keys(student).length > 0">
    <h1>{{ student.first_name }} {{ student.last_name }}:</h1>
    <p class="ms-1">{{ student.school.name }}</p>
    <ContactDetails :student="student" />
    <LessonDetails :student="student" v-if="user.hasPermission('LESSONS_V', student.school.id)"/>
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { useStudentStore } from '/resources/js/stores/students';
import ContactDetails from './DetailsComponents/ContactDetails.vue';
import LessonDetails from './DetailsComponents/LessonDetails.vue'
import { useUserStore } from '/resources/js/stores/user';

const user = useUserStore()
const studentStore = useStudentStore()
const student = computed(()=>{
  return studentStore.getStudent
})

</script>

<style lang="scss" scoped>

</style>