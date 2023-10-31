<template>
  <div v-if="Object.keys(student).length > 0">
    <HeaderLine :heading="student.first_name + ' ' + student.last_name" :school="student.school.name" />
    <ContactDetails :student="student" />
    <LessonDetails :student="student" v-if="user.hasPermission('LESSONS_V', student.school.id)"/>
    <HireDetails :student="student" v-if="user.hasPermission('HIRES_V', student.school.id)"/>
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { useStudentStore } from '/resources/js/stores/students';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';
import ContactDetails from './DetailsComponents/ContactDetails.vue';
import LessonDetails from './DetailsComponents/LessonDetails.vue'
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';
import HireDetails from './DetailsComponents/HireDetails.vue';

const user = useUserStore()
const actions = useActionsStore()
const studentStore = useStudentStore()

const student = computed(()=>{
  return studentStore.getStudent
})

if(user.hasPermission('INSTRUMENTS_E', student.value.school.id)){
  actions.setItems([
    { header: 'Hire Out Instrument', to: { name: 'StudentDetails' }, modal: 'InstrumentHireCreateFromStudent', icon: 'fa-solid fa-circle-check', additional: true}
  ])
}

</script>

<style lang="scss" scoped>

</style>