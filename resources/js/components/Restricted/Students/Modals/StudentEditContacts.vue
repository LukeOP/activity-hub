<template>
  <div>
    <HeaderLine heading="Edit Student Contact Details" />
    <!-- {{ currentContactDetails.contacts.student.mobile }} -->
    <form @submit.prevent="updateStudentContactDetails">
      <label>Mobile Number
        <input type="number" class="form-control" v-model="formData.student_mobile">
      </label>
      <label>Email
        <input type="email" class="form-control" v-model="formData.student_email">
      </label>
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

const studentStore = useStudentStore()
const toast = useToastStore()
const modal = useModalStore()

const formData = ref({
  student_id: studentStore.getStudent.id,
  student_mobile: '',
  student_email: ''
})

function populateFormData(){
  if(studentStore.getStudent.contacts != null) {
    formData.value.student_mobile = studentStore.getStudent.contacts.student.mobile
    formData.value.student_email = studentStore.getStudent.contacts.student.email
  }
}
populateFormData()

function updateStudentContactDetails(){
  axiosClient.patch('student-contacts/' + formData.value.student_id, formData.value).then((res)=>{
    studentStore.setStudent(res.data.student)
    toast.open('success', 'Student updated', `Contact details for ${res.data.student.first_name} have been updated.`)
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