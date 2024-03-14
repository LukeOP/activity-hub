<template>
  <div v-if="request && !loading">
    <HeaderLine heading="Lesson Request Review" :school="request.school.name" />
    <div class="w-100" style="text-align: end;"><span class="text-primary">Form:</span> {{ request.attributes.form_description }}</div>
    
    <form @submit.prevent="assignLesson">
      <section>
        <div class="row">
          <div class="col col-12 col-md-6">
            <h4 class="mt-2">Student Information:</h4>
            <label for="provided-student">Name of Student:
              <input type="text" id="provided-student" class="form-control" v-model="request.student.name" disabled>
            </label> 
          </div>
          <div class="col col-12 col-md-6">
            <h4 class="mt-2">Reviewed Student Information:</h4>
            <label for="reviewed-student">Name of Student:</label>
            <span style="display:flex">
              <select id="reviewed-student" class="form-control" v-model="selectedStudent" @change="updateStudentDetails" required>
                <option v-for="student in students" :key="student.id" :value="student.id">
                  {{student.last_name}}, {{ student.first_name }}
                  <span v-if="student.tutor_group"> - {{ student.tutor_group }}</span>
                  <span v-if="student.age"> - {{ student.age }}</span>
                </option>
              </select>
            </span>
          </div>
        </div>
  
        <div class="row" v-for="field in studentDetailsArray" :key="field">
          <div class="col col-12 col-md-6">
            <label v-if="field.if">{{ field.label }}
              <input :type="field.type" class="form-control" :value="field.value" disabled>
            </label>
          </div>
          <div v-if="selectedStudent" class="col col-12 col-md-6">
            <label v-if="field.if">{{ field.label }}
              <span>
                <input :type="field.type" class="form-control" :value="field.reviewedValue" :disabled="field.disabled">
                <span v-if="!field.disabled" class="copy-btn" @click="copyField(field.label)">copy provided</span>
              </span>
            </label>
          </div>
        </div>
        <hr />
      </section>

      <section v-if="request.parent.email != null || request.parent.name != null || request.parent.phone != null">
        <div class="row mt-4">
          <div class="col col-12 col-md-6">
            <h4 class="mt-2">Parent / Caregiver Information:</h4>
          </div>
          <div class="col col-12 col-md-6">
            <h4 v-if="selectedStudent" class="mt-2">Reviewed Parent / Caregiver Information:</h4>
          </div>
        </div>
  
        <div class="row" v-for="field in contactDetailsArray" :key="field">
          <div class="col col-12 col-md-6">
            <label v-if="field.if && field.value">{{ field.label }}
              <input :type="field.type" class="form-control" :value="field.value" disabled>
            </label>
          </div>
          <div v-if="selectedStudent" class="col col-12 col-md-6" :class="{divider: field.divider}">
            <label v-if="field.if">{{ field.label }}
              <span>
                <input :type="field.type" class="form-control" :value="field.reviewedValue" :disabled="field.disabled" :required="field.required">
                <span v-if="!field.disabled" class="copy-btn" @click="copyField(field.label)">copy provided</span>
              </span>
            </label>
          </div>
        </div>
        <hr />
      </section>
    
      <section>
        <div class="row">
          <h2 class="text-primary">Lesson Details:</h2>
  
          <div class="col col-12 col-md-6">
            <label>Requested Instrument
              <input type="text" class="form-control" :value="request.attributes.requested_instrument" disabled>
            </label>
            <label>Requested Tutor
              <input type="text" class="form-control" :value="getTutor(request.attributes.requested_tutor)" disabled>
            </label>
            <label v-if="fundingOptions.length">Requested Funding
              <input type="text" class="form-control" :value="request.attributes.funding_type" disabled>
            </label>
            <label>Previous Experience
              <input type="text" class="form-control" :value="request.attributes.experience || 'None provided'" disabled>
            </label>
          </div>
  
          <div class="col col-12 col-md-6 mb-5">
            <label>Instrument
              <input type="text" class="form-control" :value="request.attributes.requested_instrument" disabled>
            </label>
            <label for="tutor">Assigned Tutor:
              <select v-if="filteredTutors.length > 0" name="tutor" class="form-control" v-model="reviewedLessonData.tutor" >
                <option v-for="tutor in filteredTutors" :key="tutor.id" :value="tutor.id">{{tutor.first_name}} {{tutor.last_name}}</option>
              </select>
              <p v-else class="error">You don't have any {{request.attributes.requested_instrument.toLowerCase()}} tutors registered at {{request.school.name}}!<br>
                You can edit tutor subjects in the staff menu.</p>
            </label>
            <label for="funding" v-if="fundingOptions.length">Funding Type:
              <select name="funding" class="form-control" v-model="reviewedLessonData.funding_type">
                <option v-for="option in fundingOptions" :key="option" :value="option.value">{{option.value}}</option>
              </select>
            </label>
            <button class="btn btn-primary form-control mt-4" :disabled="!formCompleted || assigningLesson">Assign Lesson To Tutor</button>
          </div>
        </div>
      </section>

    </form>
    <!-- {{ reviewedLessonData }} -->
      
      <!-- <pre>{{ request }}</pre> -->
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import { useRouter } from "vue-router";
import useApi from "../../../../composables/useApi";
import { useLessonsStore } from "../../../../stores/lessons";
import axiosClient from "/resources/js/axios";
import { useToastStore } from "/resources/js/stores/toast";
import { useModalStore } from "/resources/js/stores/modal";
import { useUserStore } from "/resources/js/stores/user";
import { useActionsStore } from "/resources/js/stores/actions";
import HeaderLine from "/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue";
import { useStaffStore } from "../../../../stores/staff";
import { useSchoolStore } from "../../../../stores/schools";

// Init Stores
const lessonStore = useLessonsStore()
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()
const toast = useToastStore()
const modal = useModalStore()
const user = useUserStore()
const actions = useActionsStore()
const router = useRouter()

// Init variables
const request = lessonStore.getRequest
const selectedStudent = ref()
const fetchedStudentData = ref()
const filteredTutors = ref([])
const studentDetailsArray = ref([])
const contactDetailsArray = ref([])
const assigningLesson = ref(false)

//Student Data
const reviewedStudentData = ref({
  year_level: '',
  age: ''
})

// Reviewed Lesson Data
const reviewedLessonData = ref({
  student: null,
  tutor: null,
  funding_type: null,
  experience: request.attributes.experience,
  instrument: request.attributes.requested_instrument
})
// Reviewed Contact Data
const reviewedContactData = ref({
  student: '',
  student_mobile: '',
  student_email: '',
  pc_name: '',
  pc_mobile: '',
  pc_email: '',
  sc_name: '',
  sc_mobile: '',
  sc_email: '',
})

// Load student lists
const { data:students, loading, fetchData } = useApi('school-students/' + request.school.id)
fetchData()

// Update student by fetching student data and populating reviewedData values
function updateStudentDetails(){
  getContactDetails(selectedStudent.value)
  reviewedLessonData.value.student = selectedStudent.value
  reviewedContactData.value.student = selectedStudent.value
}
// Fetches student data
function getContactDetails(student_id){
  const {data: studentData, fetchData } = useApi('students/' + student_id)
  fetchData().then(()=>{ 
    fetchedStudentData.value = studentData.value;
    updateStudentData(studentData.value)
    updateContactDetails(studentData.value)
    refreshStudentDetails()
    refreshContactDetails()
  })
}

function updateStudentData(fetchedStudent){
  reviewedStudentData.value.year_level = fetchedStudent.year_level
  reviewedStudentData.value.age = fetchedStudent.age
}
// Updates contact details based on student selected
function updateContactDetails(fetchedStudent){
  reviewedContactData.value.student_id = fetchedStudent.id
  if(fetchedStudent.contacts != null){
    reviewedContactData.value.student_mobile = fetchedStudent.contacts.student.mobile
    reviewedContactData.value.student_email = fetchedStudent.contacts.student.email
    reviewedContactData.value.pc_name = fetchedStudent.contacts.pc.name
    reviewedContactData.value.pc_mobile = fetchedStudent.contacts.pc.mobile
    reviewedContactData.value.pc_email = fetchedStudent.contacts.pc.email
    reviewedContactData.value.sc_name = fetchedStudent.contacts.sc.name
    reviewedContactData.value.sc_mobile = fetchedStudent.contacts.sc.mobile
    reviewedContactData.value.sc_email = fetchedStudent.contacts.sc.email
  } else {
    reviewedContactData.value.student_mobile = null
    reviewedContactData.value.student_email = null
    reviewedContactData.value.pc_name = null
    reviewedContactData.value.pc_mobile = null
    reviewedContactData.value.pc_email = null
    reviewedContactData.value.sc_name = null
    reviewedContactData.value.sc_mobile = null
    reviewedContactData.value.sc_email = null
  }
}

// Populating the data arrays for user input
function refreshStudentDetails(){
  studentDetailsArray.value = [
    {if: request.student.email, label: 'Student Email', type: 'email', value: request.student.email, reviewedValue: reviewedContactData.value.student_email},
    {if: request.student.phone, label: 'Student Phone', type: 'phone', value: request.student.phone, reviewedValue: reviewedContactData.value.student_mobile},
    {if: request.student.year, label: 'Year Level', type: 'text', value: request.student.year, reviewedValue: reviewedStudentData.value.year_level, disabled: true},
    {if: request.student.age, label: 'Age', type: 'text', value: request.student.age, reviewedValue: reviewedStudentData.value.age, disabled: true},
  ]
}
function refreshContactDetails(){
  contactDetailsArray.value = [
    {if: request.parent.name, label: 'Primary Parent / Caregiver Name', type: 'text', value: request.parent.name, reviewedValue: reviewedContactData.value.pc_name, required: true},
    {if: request.parent.email, label: 'Primary Parent / Caregiver Email', type: 'email', value: request.parent.email, reviewedValue: reviewedContactData.value.pc_email, required: true},
    {if: request.parent.phone, label: 'Primary Parent / Caregiver Phone Number', type: 'phone', value: request.parent.phone, reviewedValue: reviewedContactData.value.pc_mobile, divider: true, required: true},
    {if: request.parent.name, label: 'Secondary Parent / Caregiver Name', type: 'text', value: null, reviewedValue: reviewedContactData.value.sc_name},
    {if: request.parent.email, label: 'Secondary Parent / Caregiver Email', type: 'email', value: null, reviewedValue: reviewedContactData.value.sc_email},
    {if: request.parent.phone, label: 'Secondary Parent / Caregiver Phone Number', type: 'phone', value: null, reviewedValue: reviewedContactData.value.sc_mobile},
  ]
}
// refreshes and updates arrays
function refreshArrays(){
  refreshContactDetails()
  refreshStudentDetails()
}
refreshArrays()

// Fetches school tutors and filters them by the selected instrument
const { data:tutors, fetchData:fetchtutors } = useApi('school-users/' + request.school.id)
fetchtutors().then(()=>{
  filteredTutors.value = tutors.value.filter(t => t.subjects.some(subject => subject.title === request.attributes.requested_instrument))
})

// Copy parent data from request to student data. either primary or secondary caregiver
function copyField(label){
  if(label === 'Student Email') reviewedContactData.value.student_email = request.student.email
  if(label === 'Student Phone') reviewedContactData.value.student_phone = request.student.phone
  if(label === 'Primary Parent / Caregiver Name') reviewedContactData.value.pc_name = request.parent.name
  if(label === 'Primary Parent / Caregiver Email') reviewedContactData.value.pc_email = request.parent.email
  if(label === 'Primary Parent / Caregiver Phone Number') reviewedContactData.value.pc_mobile = request.parent.phone
  if(label === 'Secondary Parent / Caregiver Name') reviewedContactData.value.sc_name = request.parent.name
  if(label === 'Secondary Parent / Caregiver Email') reviewedContactData.value.sc_email = request.parent.email
  if(label === 'Secondary Parent / Caregiver Phone Number') reviewedContactData.value.sc_mobile = request.parent.phone
  refreshArrays()
}

// Array of funding options
const fundingOptions = schoolStore.getSchool.data.funding

function getTutor(tutor_id){
  let selectedStaff = staffStore.getStaffList.find(s => s.id == tutor_id)
  if(selectedStaff) return selectedStaff.full_name
  else return "No Preference"
}

// Checks if the student and tutor has been selected before returning true. Used to disable submit button
const formCompleted = computed(()=>{
  if(reviewedLessonData.value.student != null && reviewedLessonData.value.tutor != null) return true
  return false
})

// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('LESSONS_REQ_D')){
  actionArray.push({ header: 'Delete Request', to: { name: 'LessonRequestReview' }, modal: 'DeleteRequest', red: true, icon: 'fa-solid fa-trash'})
}
actions.setItems(actionArray)

// Assign lesson to tutor and update database
function assignLesson(){
  assigningLesson.value = true
  // Create new lesson
  axiosClient.post('lessons', reviewedLessonData.value).then(res => {
    // Update Student Contacts
    axiosClient.patch('student-contacts/' + reviewedContactData.value.student_id, reviewedContactData.value).then(res => {
      // Delete the lesson request
      axiosClient.delete('lesson-requests/' + request.id).then(res => {
        console.log(res.data);
        // Feedback to the user and redirect them to the requests list
        toast.open('success', 'Lesson Assigned', 'Lesson has been assigned to a tutor')
        assigningLesson.value = false
        router.push({
          name: 'RequestsList'
        })
      })
    })
  })
}
onMounted(async()=>{
  await staffStore.fetchStaff(schoolStore.getSchool.id)
})
</script>

<style lang="scss" scoped>
h4 {
  color: $ah-primary;
}
section {
  margin-top: 1rem;
}
label, input, select {
  margin-bottom: 0.5rem;
  width: 100%;
  span {
    display: flex;
    .form-control {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
    }
    .copy-btn {
      max-height: 37.03px;
      // border: 1px solid $ah-primary;
      background-color: $ah-primary;
      color: white;
      padding: 0.375rem 0.75rem;
      border-radius: 0 0.375rem 0.375rem 0;
      min-width: fit-content;
      &:hover {
        cursor: pointer;
        background-color: $ah-primary-dark;
      }
    }
  }
}
.divider {
  border-bottom: 1px dashed $ah-primary;
  margin-bottom: 0.5rem;
}
.heading, label {
  color: $ah-primary-dark;
  margin: 0;
}
.error {
  color: $ah-red;
}
.hide {
  visibility: hidden;
}

</style>