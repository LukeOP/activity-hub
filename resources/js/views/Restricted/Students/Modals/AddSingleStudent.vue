<template>
  <div>
    <HeaderLine heading="Add New Student" />
    <form @submit.prevent="addStudent()">
      <label>School*
        <select class="form-control" required v-model="formData.school_id">
          <option v-for="school in availableSchools" :key="school" :value="school.id" selected>{{school.name}}</option>
        </select>
      </label>
      <label>First Name*
        <input type="text" class="form-control" required v-model="formData.first_name">
      </label>
      <label>Last Name*
        <input type="text" class="form-control" required v-model="formData.last_name">
      </label>
      <input type="checkbox" v-model="advanced">
      <span style="margin-left: 1rem;">Advanced Setup</span>
      <span v-if="advanced">
        <label>Tutor Group
          <input type="text" class="form-control" v-model="formData.tutor_group">
        </label>
        <label>Year Level
          <input type="text" class="form-control" v-model="formData.year_level">
        </label>
        <!-- <label>Gender
          <input type="text" class="form-control" v-model="formData.gender">
        </label> -->
        <label>Date of Birth
          <input type="date" class="form-control" v-model="formData.date_of_birth">
        </label>
        <label>Student Identifier (NSN or other unique number)
          <input type="text" class="form-control" v-model="formData.identifier">
        </label>
      </span>
      <input type="submit" class="btn btn-primary float-end" value="Add Student">
    </form>
  </div>
</template>

<script setup>
import { computed, ref } from 'vue';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useStudentStore } from '/resources/js/stores/students';
import axiosClient from '/resources/js/axios';
import { useModalStore } from '/resources/js/stores/modal';
import { useToastStore } from '/resources/js/stores/toast';

const user = useUserStore()
const studentStore = useStudentStore()
const modal = useModalStore()
const toast = useToastStore()

const advanced = ref(false)
const formData = ref({
  school_id: '',
  first_name: '',
  last_name: '',
  tutor_group: '',
  year_level: '',
  // gender: '',
  date_of_birth: '',
  identifier: ''
})

const availableSchools = computed(()=>{
  let array = []
  user.getSchools.forEach(school => {
    if(user.hasPermission('STUDENT_C', school.id)) {
      array.push(school)
    }
  });
  return array
})

function addStudent(){
  axiosClient.post('students', formData.value).then(res => {
    studentStore.addStudent(res.data)
    toast.open('success', 'New Student Added', `${res.data.first_name} has been added to student lists.`)
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
  margin-bottom: 1rem;
}

</style>