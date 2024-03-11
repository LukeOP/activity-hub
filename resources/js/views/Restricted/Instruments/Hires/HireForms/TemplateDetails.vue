<template>
  <div>
    <HeaderLine heading="Hire Agreement Template Details" link1="Forms List" @link1="returnToFormList" />
    <button class="btn btn-secondary float-end top-btn" @click="saveUpdates">Save Template</button>
    <form @submit.prevent="">
      <section id="main-details">
        <h2>Template Setup:</h2>
        <p>These options relate to the setup of the template</p>

        <div class="checkbox-option">
          <div class="description">Template Name:</div>
          <input type="text" v-model="formData.description" class="form-control">
        </div>

      </section>
      
      <section id="content-section">
        <h2>Content:</h2>
        <p>This section relates to the content of the online hire agreement.</p>
          
          <div class="checkbox-option">
            <input type="checkbox" v-model="formData.logo_cb" :disabled="!currentForm.school.logo">
            <div class="description" style="padding-left: 0;">Display School Logo</div>
          </div>
          
          <div class="checkbox-option">
            <input type="checkbox" v-model="formData.school_name_cb">
            <div class="description" style="padding-left: 0;">Display School Name:</div>
          </div>
          
          <div class="checkbox-option">
            <div class="description">Header:</div>
            <input type="text" v-model="formData.header_title" class="form-control">
          </div>
          
          <div class="checkbox-option">
            <div class="description">Content Header:</div>
            <input type="text" class="form-control" v-model="formData.content_header">
          </div>

          <div class="checkbox-option">
            <div class="description">Content:</div>
            <textarea class="form-control w-100" v-model="formData.content"></textarea>
          </div>
        
          
        </section>
      </form>
  </div>
</template>

<script setup>
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import moment from 'moment';
import { computed, ref } from 'vue';
import { useRouter } from 'vue-router';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useHireStore } from '/resources/js/stores/hires';

// Initiate Stores
const hireStore = useHireStore()
const currentForm = hireStore.getHireData
const toast = useToastStore()

// Initiate Composables
const router = useRouter()

// Initiate Variables
const thisYear = moment().format('YYYY')
const yearSelect = ref({
  year1: moment(thisYear, 'YYYY').format('YYYY'),
  year2: moment(thisYear, 'YYYY').add(1, 'years').format('YYYY'),
  year3: moment(thisYear, 'YYYY').add(2, 'years').format('YYYY'),
  year4: moment(thisYear, 'YYYY').add(3, 'years').format('YYYY'),
  year5: moment(thisYear, 'YYYY').add(4, 'years').format('YYYY')
})


// const formData = ref(currentForm)
const formData = ref({
  // Setup
  description: currentForm.template.description,
  year: "2024",
  // Header
  logo: 'Logo',
  school_name: 'Name',
  header_title: 'MGS Instrument Hire Agreement',
  content_header: 'Header Content',
  content: ''
})
    

// if (hireStore.getFormPreview.description === currentForm.attributes.description) {
//   formData.value = hireStore.getFormPreview
// }


// function saveUpdates(){
//   // console.log(formData.value);
//   axiosClient.patch('/lesson-request-forms/' + currentForm.id, formData.value).then(res => {
//     // console.log(res.data)
//     toast.open('success', 'Form Updated', 'Form changes have been saved. ')
//   })
// }

// let url = ''
// if(import.meta.env.VITE_ENV === 'production') url = 'https://activityhub.co.nz'
// else url = 'http://localhost:8000'

// async function copyURL(){
//   try {
//     await navigator.clipboard.writeText(url + '/forms/' + currentForm.id)
//     toast.open('success', 'Link Copied!', 'A link to this form has been copied to your clipboard.')
//   } catch($e) {
//     toast.open('error', 'Error in getting Link', 'There was an error in getting your form link.')
//   }
// }

// function previewForm(){
//   hireStore.setFormPreview(formData.value)
//   router.push({
//     name: 'RequestFormPreview'
//   })
// }
function returnToFormList(){
  router.push({
    name: 'HireFormList'
  })
}

</script>

<style lang="scss" scoped>
section {
  border-top: 1px dashed $ah-primary;
  margin-top: 2rem;
  padding-top: 10px;
  padding-left: 20px;
  &:first-of-type {
    border: none;
  }
}
.checkbox-option {
    display: flex;
    align-items: baseline;
  padding-bottom: 10px;
  input[type="checkbox"] {
    margin-right: 1rem;
  }
  .description {
    display: inline-block;
    margin-right: 1rem;
    min-width: 250px;
    padding-left: 29px;
  }
  input[type="text"], textarea, .editField{
    display: inline-block;
    width: 300px;
  }
}
.btn {
  margin-bottom: 10px;
  border-radius: 0;
  margin-left: 0.25rem;
  &:first-of-type {
    border-top-right-radius: 0.75rem;
    border-bottom-right-radius: 0.75rem;
  }
  &:last-of-type {
    border-top-left-radius: 0.75rem;
    border-bottom-left-radius: 0.75rem;
  }
}
.top-btn {
  min-width: 125px;
}

</style>