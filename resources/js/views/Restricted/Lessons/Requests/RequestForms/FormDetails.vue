<template>
  <div>
    <HeaderLine heading="Lesson Signup Form Details" link1="Forms List" link2="Preview Form" @link1="returnToFormList" @link2="previewForm" />
    <!-- <pre>{{ formData }}</pre> -->
    <button class="btn btn-secondary float-end top-btn" @click="saveUpdates" :disabled="saving">Save Form</button>
    <button class="btn btn-primary float-end top-btn" @click="copyURL">Copy Form URL</button>
    <form @submit.prevent="">
      <section id="main-details">
        <h2>Form Setup:</h2>
        <p>These options relate to the setup of the form</p>

        <div class="checkbox-option">
          <!-- <input type="checkbox" v-model="formData.school_name_cb"> -->
          <div class="description" style="padding-left: 29px;">Form Name:</div>
          <input type="text" v-model="formData.description" class="form-control">
        </div>

        <div class="checkbox-option">
          <!-- <input type="checkbox" v-model="formData.school_name_cb"> -->
          <div class="description" style="padding-left: 29px;">Form's Associated Year:</div>
          <select class="form-control editField" v-model="formData.year">
            <option v-for="year in yearSelect" :key="year" :value="year">{{ year }}</option>
          </select>
        </div>
        <hr />
      </section>

      <section id="header-section">
        <h2>Header Options:</h2>
        <p>These options relate to the displayed header of the online form.<br>
          Tick the fields you wish to display and add custom text.</p>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.logo_cb" :disabled="!currentForm.school.logo">
          <div class="description">Display School Logo</div>
          <img style="height: 50px" :src="currentForm.school.logo" alt="">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.school_name_cb">
          <div class="description">Display School Name:</div>
          <input type="text" v-model="formData.school_name" class="form-control" style="background-color: transparent; border: none; color: black;" disabled>
        </div>

        <div class="checkbox-option">
          <input type="checkbox" checked disabled>
          <div class="description">Title Header:</div>
          <input type="text" v-model="formData.heading" class="form-control">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.header_content_cb">
          <div class="description">Header Information Field:</div>
          <textarea class="form-control" v-model="formData.header_content" :disabled="!formData.header_content_cb"></textarea>
        </div>
        <hr/>
      </section>

      <section id="contact-section">
        <h2>Contact Options:</h2>
        <p>These options relate to the contact details fields of the online form.<br>
          Tick the fields you wish to display. You may create a custom label for each field.</p>

        <h3>Student Details:</h3>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.contact_content_cb">
          <div class="description">Contact Details Information Field:</div>
          <textarea class="form-control" v-model="formData.contact_content" :disabled="!formData.contact_content_cb"></textarea>
        </div>

        <div class="checkbox-option">
          <input type="checkbox" checked disabled>
          <span class="description">Student Name Field:</span>
          <input type="text" class="form-control" v-model="formData.student_name">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.student_email_cb">
          <div class="description">Student Email Field:</div>
          <input type="text" class="form-control" v-model="formData.student_email" :disabled="!formData.student_email_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.student_phone_cb">
          <div class="description">Student Phone Field:</div>
          <input type="text" class="form-control" v-model="formData.student_phone" :disabled="!formData.student_phone_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.student_age_cb">
          <div class="description">Student Age Field:</div>
          <input type="text" class="form-control" v-model="formData.student_age" :disabled="!formData.student_age_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.student_year_cb">
          <div class="description">Student Year Level Field:</div>
          <input type="text" class="form-control" v-model="formData.student_year" :disabled="!formData.student_year_cb">
        </div>

        <h3>Parent/Caregiver Details:</h3>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.pc_name_cb">
          <div class="description">Parent/Caregiver Name Field:</div>
          <input type="text" class="form-control" v-model="formData.pc_name" :disabled="!formData.pc_name_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.pc_phone_cb">
          <div class="description">Parent/Caregiver Phone Field:</div>
          <input type="text" class="form-control" v-model="formData.pc_phone" :disabled="!formData.pc_phone_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.pc_email_cb">
          <div class="description">Parent/Caregiver Email Field:</div>
          <input type="text" class="form-control" v-model="formData.pc_email" :disabled="!formData.pc_email_cb">
        </div>
        <hr/>
      </section>

      <section id="lesson-options">
        <h2>Lesson Options</h2>
        <p>These options relate to the lesson details fields of the online form.<br>
          Tick the fields you wish to display. You may create a custom label for each field.</p>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.lesson_content_cb">
          <div class="description">Lesson Details Information Field:</div>
          <textarea class="form-control" v-model="formData.lesson_content" :disabled="!formData.lesson_content_cb"></textarea>
        </div>

        <div class="checkbox-option">
          <input type="checkbox" checked disabled>
          <span class="description">Instrument:</span>
          <input type="text" class="form-control" v-model="formData.instrument">
        </div>

        <div class="checkbox-option" style="display: block;">
          <div class="description text-primary">Instruments to display on the form:</div>
          <div class="optionSelection mb-3">
            <div class="option" 
              v-for="instrument in staffStore.getSubjects" :key="instrument" 
              :class="{selected: isSelectedInstrument(instrument)}" 
              @click="instrumentClick(instrument)">{{ instrument }}</div>
          </div>
          <!-- <pre>
            {{ selectedInstruments }}
          </pre> -->
        </div>

        <div class="checkbox-option">
          <input type="checkbox" checked  v-model="formData.tutor_cb">
          <span class="description">Tutor:</span>
          <input type="text" class="form-control" v-model="formData.tutor" :disabled="!formData.tutor_cb">
        </div>

        <div class="checkbox-option">
          <input type="checkbox" checked  v-model="formData.funding_type_cb">
          <span class="description">Funding Type:</span>
          <input type="text" class="form-control" v-model="formData.funding_type" :disabled="!formData.funding_type_cb">
        </div>
        <div class="checkbox-option" style="display: block;">
          <div class="description text-primary">Funding Types to display on the form:</div>
          <div class="optionSelection mb-3">
            <div class="option" 
              v-for="fundingOption in schoolStore.getFunding" :key="fundingOption" 
              :class="{selected: isSelectedFunding(fundingOption)}" 
              @click="fundingClick(fundingOption)">{{ fundingOption }}</div>
          </div>
        </div>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.experience_cb">
          <div class="description">Previous Experience Field:</div>
          <input type="text" class="form-control" v-model="formData.experience" :disabled="!formData.experience_cb">
        </div>
        <hr />
      </section>

      <section id="footer-options">
        <h2>Footer Options</h2>
        <p>These options relate to the footer section of the online form.<br>
          Tick the fields you wish to display. You may create a custom label for each field.</p>

        <div class="checkbox-option">
          <input type="checkbox" v-model="formData.footer_content_cb">
          <div class="description">Footer Information Field:</div>
          <textarea class="form-control" v-model="formData.footer_content" :disabled="!formData.footer_content_cb"></textarea>
        </div>
      </section>

    </form>
    <!-- <pre>{{ currentForm }}</pre> -->
  </div>
</template>

<script setup>
import { useLessonsStore } from '/resources/js/stores/lessons';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import moment from 'moment';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useActionsStore } from '../../../../../stores/actions';
import { useUserStore } from '../../../../../stores/user';
import { useStaffStore } from '../../../../../stores/staff';
import { useSchoolStore } from '../../../../../stores/schools';


// Initiate Stores
const lessonStore = useLessonsStore()
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()
const currentForm = lessonStore.getRequestForm
const toast = useToastStore()
const actions = useActionsStore()
const user = useUserStore()
const saving = ref(false)
const subjects = ref([])

// Initiate Composables
const router = useRouter()

function setActions(){
  let actionsArray = []
  if(user.hasPermission('LESSON_FRM_D', currentForm.school.id)){
    actionsArray.push({ header: 'Delete Request Form', to: { name: 'RequestFormDetails' }, modal: 'DeleteRequestForm', icon: 'fa-solid fa-trash', additional: true, red: true})
  }
  actions.setItems(actionsArray)
}
setActions()

// Initiate Variables
const thisYear = moment().format('YYYY')
const yearSelect = ref({
  year1: moment(thisYear, 'YYYY').format('YYYY'),
  year2: moment(thisYear, 'YYYY').add(1, 'years').format('YYYY'),
  year3: moment(thisYear, 'YYYY').add(2, 'years').format('YYYY'),
  year4: moment(thisYear, 'YYYY').add(3, 'years').format('YYYY'),
  year5: moment(thisYear, 'YYYY').add(4, 'years').format('YYYY')
})

let selectedInstruments = ref(currentForm.available_instruments)
let selectedFunding = ref(currentForm.available_funding)


function isSelectedInstrument(instrument){
  return selectedInstruments.value.filter(i => i == instrument)[0] != undefined
}

function instrumentClick(instrument){
  if(isSelectedInstrument(instrument)){
    const index = selectedInstruments.value.indexOf(instrument)
    selectedInstruments.value.splice(index, 1)
  } else {
    selectedInstruments.value.push(instrument)
  }
}

function isSelectedFunding(funding){
  return selectedFunding.value.filter(f => f == funding)[0] != undefined
}

function fundingClick(funding){
  if(isSelectedFunding(funding)){
    const index = selectedFunding.value.indexOf(funding)
    selectedFunding.value.splice(index, 1)
  } else {
    selectedFunding.value.push(funding)
  }
}

const fetchSubjects = async () => {
  try {
    loading.value = true;
    subjects.value = staffStore.getSubjects();
  } catch (err) {
    error.value = err.message || 'An error occurred';
  } finally {
    loading.value = false;
  }
}

// const formData = ref(currentForm)
const formData = ref({
  // Setup
  description: currentForm.attributes.description,
  year: currentForm.attributes.year,
  // Header
  logo_cb: convertToBool(currentForm.inputs.logo),
  logo: currentForm.school.logo,
  school_name_cb: convertToBool(currentForm.inputs.school_name),
  school_name: currentForm.school.name,
  heading_cb: convertToBool(currentForm.inputs.heading),
  heading: currentForm.content.heading,
  header_content_cb: convertToBool(currentForm.inputs.header_content),
  header_content: currentForm.content.header_content,
  // Contact
  contact_content_cb: convertToBool(currentForm.inputs.contact_content),
  contact_content: currentForm.content.contact_content,
  student_name_cb: convertToBool(currentForm.inputs.student_name),
  student_name: currentForm.field_labels.student_name,
  student_email_cb: convertToBool(currentForm.inputs.student_email),
  student_email: currentForm.field_labels.student_email,
  student_phone_cb: convertToBool(currentForm.inputs.student_phone),
  student_phone: currentForm.field_labels.student_phone,
  student_age_cb: convertToBool(currentForm.inputs.student_age),
  student_age: currentForm.field_labels.student_age,
  student_year_cb: convertToBool(currentForm.inputs.student_year),
  student_year: currentForm.field_labels.student_year,
  pc_name_cb: convertToBool(currentForm.inputs.pc_name),
  pc_name: currentForm.field_labels.pc_name,
  pc_phone_cb: convertToBool(currentForm.inputs.pc_phone),
  pc_phone: currentForm.field_labels.pc_phone,
  pc_email_cb: convertToBool(currentForm.inputs.pc_email),
  pc_email: currentForm.field_labels.pc_email,
  // Lesson
  lesson_content_cb: convertToBool(currentForm.inputs.lesson_content),
  lesson_content: currentForm.content.lesson_content,
  instrument_cb: convertToBool(currentForm.inputs.instrument),
  instrument: currentForm.field_labels.instrument,
  tutor_cb: convertToBool(currentForm.inputs.tutor),
  tutor: currentForm.field_labels.tutor,
  funding_type_cb: convertToBool(currentForm.inputs.funding_type),
  funding_type: currentForm.field_labels.funding_type,
  experience_cb: convertToBool(currentForm.inputs.experience),
  experience: currentForm.field_labels.experience,
  // Footer
  footer_content_cb: convertToBool(currentForm.inputs.footer_content),
  footer_content: ''
})

if (lessonStore.getFormPreview.description === currentForm.attributes.description) {
  formData.value = lessonStore.getFormPreview
}

function convertToBool(value){
  return value === 0 ? false : true
}

function saveUpdates(){
  saving.value = true
  formData.value.available_instruments = selectedInstruments.value
  formData.value.available_funding = selectedFunding.value
  axiosClient.patch('/lesson-request-forms/' + currentForm.id, formData.value).then(res => {
    // console.log(res.data)
    toast.open('success', 'Form Updated', 'Form changes have been saved. ')
    saving.value = false
  })
}

let url = import.meta.env.VITE_URL

async function copyURL(){
  try {
    await navigator.clipboard.writeText(url + '/forms/' + currentForm.id)
    toast.open('success', 'Link Copied!', 'A link to this form has been copied to your clipboard.')
  } catch($e) {
    toast.open('error', 'Error in getting Link', 'There was an error in getting your form link.')
  }
}

function previewForm(){
  lessonStore.setFormPreview(formData.value)
  router.push({
    name: 'RequestFormPreview'
  })
}
function returnToFormList(){
  router.push({
    name: 'RequestFormsList'
  })
}
onMounted(()=>{
  fetchSubjects
})

</script>

<style lang="scss" scoped>
section {
  // border-top: 1px dashed $ah-primary;
  // margin-top: 2rem;
  padding-top: 10px;
  padding-left: 20px;
  // &:first-of-type {
  //   border: none;
  // }
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
  }
  input[type="text"], textarea, select, .editField{
    display: inline-block;
    width: 300px;
  }
  .noBox {
    visibility: hidden;
  }
  .optionSelection {
    // background-color: brown;
    display: flex;
    flex-wrap: wrap;
    max-width: 595px;
    padding: 0.375rem;
    .option {
      text-align: center;
      min-width: 95px;
      padding: 5px 10px;
      margin: 0.25rem 1rem 0.25rem 0;
      border-radius: 1rem;
      border:1px solid $ah-grey;
      color: $ah-grey;
      &:hover {
        cursor: pointer;
        color: $ah-primary;
        border-color: $ah-primary;
      }
    }
    .selected {
      background-color: $ah-primary;
      border-color: $ah-primary;
      color: white;
      &:hover {
        background-color: $ah-grey;
        border-color: $ah-grey;
        color: white;
      }
    }
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
.form-control:disabled {
  color: grey;
}



</style>