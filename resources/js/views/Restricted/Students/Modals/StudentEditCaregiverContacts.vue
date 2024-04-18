<template>
  <div>
    <HeaderLine heading="Edit Caregiver Contact Details" />
    <!-- {{ currentContactDetails.contacts.student.mobile }} -->
    <form @submit.prevent="updateStudentContactDetails">
      <h2>Primary Caregiver</h2>
      <label>Name
        <input type="text" class="form-control" v-model="formData.pc_name" required>
      </label>
      <label>Relationship to Student
        <input type="text" class="form-control" v-model="formData.pc_relationship">
      </label>
      <label>Mobile Number
        <input type="phone" class="form-control" v-model="formData.pc_mobile">
      </label>
      <label>Email
        <input type="email" class="form-control" v-model="formData.pc_email">
      </label>

      <input type="checkbox" class="mb-4" v-model="secondary">
      <span class="mx-2">Secondary Caregiver</span>

      <span v-if="secondary">
        <h2>Secondary Caregiver</h2>
        <label>Name
          <input type="text" class="form-control" v-model="formData.sc_name" required>
        </label>
        <label>Relationship to Student
          <input type="text" class="form-control" v-model="formData.sc_relationship">
        </label>
        <label>Mobile Number
          <input type="phone" class="form-control" v-model="formData.sc_mobile">
        </label>
        <label>Email
          <input type="email" class="form-control" v-model="formData.sc_email">
        </label>
      </span>

      <input type="submit" class="btn btn-primary float-end">
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import axiosClient from '/resources/js/axios';
import { useStudentStore } from '/resources/js/stores/students';
import { useToastStore } from '/resources/js/stores/toast';
import { useModalStore } from '/resources/js/stores/modal';
import useApi from '../../../../composables/useApi';

const studentStore = useStudentStore()
const toast = useToastStore()
const modal = useModalStore()

const secondary = ref(false)

const formData = ref({
  student_id: studentStore.getStudent.id,
  pc_name: '',
  pc_relationship: '',
  pc_mobile: '',
  pc_email: '',
  sc_name: '',
  sc_relationship: '',
  sc_mobile: '',
  sc_email: '',
})

function populateFormData(){
  if(studentStore.getStudent.contacts != null) {
    formData.value.pc_name = studentStore.getStudent.contacts.pc.name
    formData.value.pc_relationship = studentStore.getStudent.contacts.pc.relationship
    formData.value.pc_mobile = studentStore.getStudent.contacts.pc.mobile
    formData.value.pc_email = studentStore.getStudent.contacts.pc.email
    formData.value.sc_name = studentStore.getStudent.contacts.sc.name
    formData.value.sc_relationship = studentStore.getStudent.contacts.sc.relationship
    formData.value.sc_mobile = studentStore.getStudent.contacts.sc.mobile
    formData.value.sc_email = studentStore.getStudent.contacts.sc.email
  }
}
populateFormData()

function updateStudentContactDetails(){
  // if(caregiverEmailOrPhoneProvided()){
    const {data, fetchData} = useApi('student-contacts/' + formData.value.student_id, formData.value, 'PATCH', true)
    fetchData().then(()=>{
      studentStore.updateStudent(data.value.data)
      // toast.open('success', 'Student updated', `Contact details for ${res.data.student.first_name} have been updated.`)
      modal.close()
    })
  // } else {
  //   toast.open('info', 'Insufficient Details', 'A name, relationship and one of either email or mobile number is required.')
  // }
}

// function caregiverEmailOrPhoneProvided(){
//   const isNullOrEmpty = value => value == null || value === '';

//   if(!isNullOrEmpty(formData.value.pc_email) && !isNullOrEmpty(formData.value.pc_mobile)) return true
  
//   if(secondary.value && (!isNullOrEmpty(formData.value.sc_email) && !isNullOrEmpty(formData.value.sc_mobile))) return true

//   return false
// }

// function removeSecondaryCaregiver(){
//   formData.value.sc_name == ''
//   formData.value.sc_relationship == ''
//   formData.value.sc_mobile == ''
//   formData.value.sc_email == ''
// }


</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary;
}
label {
  width: 100%;
  margin-bottom: 0.5rem;
}

</style>