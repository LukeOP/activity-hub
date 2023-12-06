<template>
  <div>
    <HeaderLine heading="Edit Student Details" />
    <form @submit.prevent="">
      <label>First Name
        <input type="text" class="form-control" required v-model="formData.first_name">
      </label>
      <label>Last Name
        <input type="text" class="form-control" required v-model="formData.last_name">
      </label>
      <label>Tutor/Form Group
        <input type="text" class="form-control" v-model="formData.tutor_group">
      </label>
      <label>Year Level
        <input type="text" class="form-control" v-model="formData.year_level">
      </label>
      <label>Date of Birth
        <input type="date" class="form-control" v-model="formData.date_of_birth" :max="moment().format('YYYY-MM-DD')">
      </label>
      <label>Student Identifier
        <input type="text" class="form-control" v-model="formData.identifier">
      </label>
      <input type="submit" class="btn btn-primary float-end" value="Update Student" @click="handleUpdate">
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useStudentStore } from '/resources/js/stores/students';
import moment from 'moment';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useModalStore } from '/resources/js/stores/modal';

const studentStore = useStudentStore()
const toast = useToastStore()
const modal = useModalStore()
const currentStudent = studentStore.getStudent

const formData = ref({
  first_name: currentStudent.first_name,
  last_name: currentStudent.last_name,
  tutor_group: currentStudent.tutor_group,
  year_level: currentStudent.year_level,
  date_of_birth: moment(currentStudent.date_of_birth).format('YYYY-MM-DD'),
  identifier: currentStudent.identifier,
})

function handleUpdate(){
  axiosClient.patch('students/' + currentStudent.id, formData.value).then(res => {
    studentStore.setStudent(res.data)
    toast.open('success', 'Student Updated', `Student details for ${currentStudent.first_name} have been updated`)
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
  margin-bottom: 0.5rem;
}

</style>