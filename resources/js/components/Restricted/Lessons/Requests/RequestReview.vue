<template>
  <div v-if="request && !loading">
    <h1>Lesson Request Review</h1>

    <div class="row">
      <h2>Contact Details:</h2>
      <div class="col col-12 col-md-6" id="provided">
        <h4 class="mt-2">Provided Information:</h4>
        <label for="provided-student">Name of Student:</label>
        <input type="text" id="provided-student" class="form-control" v-model="request.student.name" disabled>
        <label for="provided-year">Year Level</label>
        <input type="text" class="form-control" :value="request.student.year" disabled>
      </div>
      <div class="col col-12 col-md-6">
        <h4 class="mt-2">Reviewed Information:</h4>
        <label for="reviewed-student">Name of Student:</label>
        <span style="display:flex">
          <select id="reviewed-student" class="form-control" v-model="selectedStudent" @change="updateStudentDetails" required>
            <option v-for="student in students.data" :key="student.id" :value="student">{{student.first_name}} {{student.last_name}}</option>
          </select>
          <!-- <button class="btn btn-primary form-control" style="height:37px; width: 37px"><i class="fa-solid fa-plus"></i></button> -->
        </span>
        <label for="school">School:</label>
        <input type="text" class="form-control" :value="request.school.name" disabled>
      </div>
    </div>

    <div class="row">
      <h2>Lesson Details:</h2>
      <div class="col col-12 col-md-6">
        <p class="heading">Requested Instrument:</p>
        <p>{{request.requested_instrument}}</p>
        <p class="heading">Previous Experience:</p>
        <p>{{request.experience || 'None provided'}}</p>
      </div>
      <div class="col col-12 col-md-6">
        <label for="funding">Funding Type:</label>
        <select name="funding" class="form-control" :v-model="reviewedData.funding_type">
          <option v-for="option in fundingOptions" :key="option.index" :value="option">{{option}}</option>
        </select>
        <label for="tutor">Assigned Tutor:</label>
        <select name="tutor" class="form-control" v-model="reviewedData.tutor" v-if="filteredTutors.length > 0">
          <option v-for="tutor in filteredTutors" :key="tutor.id" :value="tutor.id">{{tutor.first_name}} {{tutor.last_name}}</option>
        </select>
        <p v-else class="error">You don't have any {{request.requested_instrument.toLowerCase()}} tutors registered at {{request.school.name}}!<br>
        You can edit tutor subjects in the staff menu.</p>
      </div>
    </div>

    <div class="row">
      <div class="col col-12 col-md-6"></div>
      <div class="col col-12 col-md-6">
        <button class="btn btn-primary form-control" :disabled="!formCompleted">Assign Lesson To Tutor</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import useApi from "../../../../composables/useApi";
import { useLessonsStore } from "../../../../stores/lessons";

const lessonStore = useLessonsStore()
const request = lessonStore.getLessonData
const router = useRouter()

const { data:students, loading, fetchData } = useApi('students')
fetchData()
const selectedStudent = ref()

function updateStudentDetails(){
  reviewedData.value.student_id = selectedStudent.value.id
  reviewedData.value.year = selectedStudent.value.year_level
}

const filteredTutors = ref([])
const { data:tutors, fetchData:fetchtutors } = useApi('school-users/' + request.school.id)
fetchtutors().then(()=>{
  filteredTutors.value = tutors.value.filter(t => t.subjects.some(subject => subject.title === request.requested_instrument))
})

const reviewedData = ref({
  student_id: null,
  year: request.student.year,
  parent_name: request.parent.name,
  parent_phone: request.parent.phone,
  parent_email: request.parent.email,
  funding_type: request.funding_type,
  tutor: null
})

const fundingOptions = [
  'Private',
  'Funded',
]

const formCompleted = computed(()=>{
  if(reviewedData.value.student_id != null && reviewedData.value.tutor != null) return true
  return false
})


</script>

<style lang="scss" scoped>
#provided {
  // border: 2px dashed $ah-primary;
  h4 {
    color: $ah-primary;
  }
}
input, select {
  margin-bottom: 0.5rem;
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