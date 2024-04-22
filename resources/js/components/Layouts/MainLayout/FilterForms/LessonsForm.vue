<template>
<div>
  <label for="instrument">Instrument</label>
  <select name="instrument" id="instrument" class="form-control mb-2" v-model="filtering.instrument" @change="returnFiltered">
    <option value="" selected>All Instruments</option>
    <option v-for="(instrument, index) in instrumentArray" :key="index" :value="instrument">{{ instrument }}</option>
  </select>

  <!-- <label for="student">Student</label>
  <select name="student" id="student" class="form-control mb-2" v-model="filtering.student" @change="returnFiltered">
    <option value="" selected>All Students</option>
    <option v-for="(student, index) in studentArray" :key="index" :value="student.id">{{ student.name }}</option>
  </select> -->

  <label for="tutor">Tutor</label>
  <select name="tutor" id="tutor" class="form-control mb-2" v-model="filtering.tutor" @change="returnFiltered">
    <option value="" selected>All Tutors</option>
    <option v-for="(tutor, index) in tutorArray" :key="index" :value="tutor.id">{{ tutor.name }}</option>
  </select>

  <label for="day">Day</label>
  <select name="day" id="day" class="form-control mb-2" v-model="filtering.day" @change="returnFiltered">
    <option value="" selected>All Days</option>
    <option v-for="(day, index) in dayArray" :key="index" :value="day">{{ day }}</option>
  </select>

  <label for="status">Status</label>
  <select name="status" id="status" class="form-control mb-2" v-model="filtering.status" @change="returnFiltered">
    <option value="" selected>All Statuses</option>
    <option v-for="(status, index) in statusArray" :key="index" :value="status">{{ status }}</option>
  </select>

  <label for="school" v-if="user.getSchools.length > 1">School
  <select name="school" id="school" class="form-control mb-2" v-model="filtering.school" @change="returnFiltered">
    <option value="" selected>All schools</option>
    <option v-for="(school, index) in schoolArray" :key="index" :value="school.id">{{ school.name }}</option>
  </select></label>

  <!-- <div class="btn btn-primary form-control mt-2" @click="returnFiltered">Filter</div> -->
  <div class="btn btn-primary form-control mt-2" id="clear-btn" @click="clearFilter">Clear Filter</div>
</div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue'
import { useFilterStore } from '../../../../stores/filter'
import { useUserStore } from '../../../../stores/user';

const user = useUserStore()

const filter = useFilterStore()
const originalData = ref(filter.data)
const filtering = ref({
  instrument: '',
  student: '',
  tutor: '',
  day: '',
  status: '',
  school: ''
})

// Setup Data Filters
const instrumentArray = computed(()=>{
  return Array.from(new Set(originalData.value.map(d => d.attributes.instrument)))
})
const studentArray = computed(()=>{
  return originalData.value.reduce((result, d) => {
    const student = { id: d.student.id, name: `${d.student.first_name} ${d.student.last_name}` };
    const existingStudent = result.find(t => t.id === student.id);

    if (!existingStudent) {
      result.push(student);
    }
    
    return result;
  }, []);
})
const tutorArray = computed(()=>{
  return originalData.value.reduce((result, d) => {
    const tutor = { id: d.tutor.id, name: `${d.tutor.first_name} ${d.tutor.last_name}` };
    const existingTutor = result.find(t => t.id === tutor.id);

    if (!existingTutor) {
      result.push(tutor);
    }
    
    return result;
  }, []);
})
const dayArray = ['Monday', 'Tuesday', "Wednesday", "Thursday", "Friday"]
const statusArray = ['Active', 'Pending', "Waiting"]
const schoolArray = computed(()=>{
  return originalData.value.reduce((result, d) => {
    const school = { id: d.school.id, name: `${d.school.name}` };
    const existingschool = result.find(t => t.id === school.id);

    if (!existingschool) {
      result.push(school);
    }
    
    return result;
  }, []);
})

// Return filtered data to component by updating state
function returnFiltered(){
  let filteredData = originalData.value
  if(filtering.value.instrument != '') filteredData = filteredData.filter(d => d.attributes.instrument == filtering.value.instrument)
  // if(filtering.value.student != '') filteredData = filteredData.filter(d => d.student.id == filtering.value.student)
  if(filtering.value.tutor != '') filteredData = filteredData.filter(d => d.tutor.id == filtering.value.tutor)
  if(filtering.value.day != '') filteredData = filteredData.filter(d => d.attributes.day == filtering.value.day)
  if(filtering.value.status != '') filteredData = filteredData.filter(d => d.attributes.status == filtering.value.status)
  if(filtering.value.school != '') filteredData = filteredData.filter(d => d.school.id == filtering.value.school)
  filter.setReturned(filteredData)
}

// Reset filter and return to component
function clearFilter(){
  filtering.value = {
    instrument: '',
    student: '',
    tutor: '',
    day: '',
    status: '',
    school: ''
  }
  returnFiltered()
}
onMounted(()=>{
  returnFiltered()
})
</script>

<style lang="scss" scoped>
label {
  width: 100%;
  margin-left: 0 !important;
}
.clear-btn {
  background: white;
  &:hover {
    background: $ah-grey;
  }
}
</style>