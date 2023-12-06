<template>
  <div v-if="Object.keys(student).length > 0">
    <HeaderLine :heading="student.first_name + ' ' + student.last_name" :school="student.school.name" />
    <p class="text-primary float-end">{{ student.identifier }}</p>
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

const actionArray = []
if(user.hasPermission('STUDENTS_E', student.value.school.id)){
  actionArray.push({ header: 'Edit Student', to: { name: 'StudentDetails' }, modal: 'StudentEdit', icon: 'fa-solid fa-user-pen', additional: true})
  actionArray.push({ header: 'Edit Contact Details', to: { name: 'StudentDetails' }, modal: 'StudentEditContacts', icon: 'fa-solid fa-phone', additional: true})
  actionArray.push({ header: 'Edit Caregiver Details', to: { name: 'StudentDetails' }, modal: 'StudentEditCaregiverContacts', icon: 'fa-solid fa-person-breastfeeding', additional: true})
}
if(user.hasPermission('LESSONS_C', student.value.school.id)){
  actionArray.push({ header: 'Create New Lesson', to: { name: 'LessonCreate' }, icon: 'fa-solid fa-graduation-cap', additional: true})
}
if(user.hasPermission('HIRES_C', student.value.school.id)){
  actionArray.push({ header: 'Hire Out Instrument', to: { name: 'StudentDetails' }, modal: 'InstrumentHireCreateFromStudent', icon: 'fa-solid fa-guitar', additional: true})
}
actions.setItems(actionArray)

</script>

<style lang="scss" scoped>

</style>