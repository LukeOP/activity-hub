<template>
  <div v-if="request && !loading">
    <h1>Lesson Request Review</h1>
    <form @submit.prevent="assignLesson">

      <div class="row">
        <h2>Contact Details:</h2>
        <div class="col col-12 col-md-6" id="provided">
          <h4 class="mt-2">Provided Information:</h4>
          <label for="provided-student">Name of Student:
            <input type="text" id="provided-student" class="form-control" v-model="request.student.name" disabled>
          </label>
          <label v-if="request.student.year" for="provided-year">Year Level
            <input type="text" class="form-control" :value="request.student.year" disabled>
          </label>
        </div>
        <div class="col col-12 col-md-6">
          <h4 class="mt-2">Reviewed Information:</h4>
          <label for="reviewed-student">Name of Student:</label>
          <span style="display:flex">
            <select id="reviewed-student" class="form-control" v-model="selectedStudent" @change="updateStudentDetails" required>
              <option v-for="student in students" :key="student.id" :value="student.id">{{student.full_name}}</option>
            </select>
          </span>
          <label for="school">School:</label>
          <input type="text" class="form-control" :value="request.school.name" disabled>
        </div>
      </div>
    
      <div class="row">
        <h2>Lesson Details:</h2>
        <div class="col col-12 col-md-6">
          <p class="heading">Requested Instrument:</p>
          <p>{{request.attributes.requested_instrument}}</p>
          <p class="heading">Previous Experience:</p>
          <p>{{request.attributes.experience || 'None provided'}}</p>
        </div>
        <div class="col col-12 col-md-6">
          <label for="funding" v-if="request.attributes.funding_type">Funding Type:
            <select name="funding" class="form-control" :v-model="reviewedData.funding_type">
              <option v-for="option in fundingOptions" :key="option" :value="option">{{option}}</option>
            </select>
          </label>
          <label for="tutor">Assigned Tutor:
            <select v-if="filteredTutors.length > 0" name="tutor" class="form-control" v-model="reviewedData.tutor" >
              <option v-for="tutor in filteredTutors" :key="tutor.id" :value="tutor.id">{{tutor.first_name}} {{tutor.last_name}}</option>
            </select>
            <p v-else class="error">You don't have any {{request.attributes.requested_instrument.toLowerCase()}} tutors registered at {{request.school.name}}!<br>
              You can edit tutor subjects in the staff menu.</p>
          </label>
        </div>
      </div>
      
      <div class="row">
        <div class="col col-12 col-md-6"></div>
        <div class="col col-12 col-md-6">
          <button class="btn btn-primary form-control" :disabled="!formCompleted">Assign Lesson To Tutor</button>
        </div>
      </div>

    </form>
      
      <!-- <pre>{{ request }}</pre> -->
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import useApi from "../../../../composables/useApi";
import { useLessonsStore } from "../../../../stores/lessons";
import axiosClient from "/resources/js/axios";
import { useToastStore } from "/resources/js/stores/toast";
import { useModalStore } from "/resources/js/stores/modal";
import { useUserStore } from "/resources/js/stores/user";
import { useActionsStore } from "/resources/js/stores/actions";

const lessonStore = useLessonsStore()
const request = lessonStore.getRequest
const toast = useToastStore()
const modal = useModalStore()
const user = useUserStore()
const actions = useActionsStore()
const router = useRouter()

const { data:students, loading, fetchData } = useApi('students')
fetchData()
const selectedStudent = ref()

function updateStudentDetails(){
  reviewedData.value.student = selectedStudent.value
  reviewedData.value.year = selectedStudent.value.year_level
}

const filteredTutors = ref([])
const { data:tutors, fetchData:fetchtutors } = useApi('school-users/' + request.school.id)
fetchtutors().then(()=>{
  filteredTutors.value = tutors.value.filter(t => t.subjects.some(subject => subject.title === request.attributes.requested_instrument))
})

const reviewedData = ref({
  student: null,
  tutor: null,
  year: request.student.year || '',
  parent_name: request.parent.name || '',
  parent_phone: request.parent.phone || '',
  parent_email: request.parent.email || '',
  funding_type: request.funding_type || '',
  experience: request.attributes.experience,
  instrument: request.attributes.requested_instrument
})

const fundingOptions = [
  'Private',
  'Funded',
]

const formCompleted = computed(()=>{
  if(reviewedData.value.student != null && reviewedData.value.tutor != null) return true
  return false
})

// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('LESSONS_REQ_D')){
  actionArray.push({ header: 'Delete Request', to: { name: 'LessonRequestReview' }, modal: 'DeleteRequest', red: true, icon: 'fa-solid fa-trash'})
}
actions.setItems(actionArray)

function assignLesson(){
  axiosClient.post('lessons', reviewedData.value).then(res => {
    axiosClient.delete('lesson-requests/' + request.id).then(res => {
      toast.open('success', 'Lesson Assigned', 'Lesson has been assigned to a tutor')
      router.push({
        name: 'RequestsList'
      })
    })
  })
}


</script>

<style lang="scss" scoped>
#provided {
  // border: 2px dashed $ah-primary;
  h4 {
    color: $ah-primary;
  }
}
label, input, select {
  margin-bottom: 0.5rem;
  width: 100%;
}
.row {
  margin-bottom: 2rem;
}
.heading, label {
  color: $ah-primary-dark;
  margin: 0;
}
.error {
  color: $ah-red;
}

</style>