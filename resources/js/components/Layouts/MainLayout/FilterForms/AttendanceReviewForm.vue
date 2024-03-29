<template>
<div>
  <label for="attendance" class="ms-1">Attendance</label>
  <select name="attendance" id="attendance" class="form-control mb-2" v-model="filtering.attendance">
    <option value="" selected>All Attendances</option>
    <option v-for="(attendance, index) in attendanceArray" :key="index" :value="attendance">{{ attendance }}</option>
  </select>

  <label for="tutor" class="ms-1">Tutor</label>
  <select name="tutor" id="tutor" class="form-control mb-2" v-model="filtering.tutor">
    <option value="" selected>All Tutors</option>
    <option v-for="(tutor, index) in tutorArray" :key="index" :value="tutor.id">{{ tutor.name }}</option>
  </select>

  <label for="funding" class="ms-1">Funding</label>
  <select name="funding" id="funding" class="form-control mb-2" v-model="filtering.funding">
    <option value="" selected>All Funding Options</option>
    <option v-for="(funding, index) in fundingArray" :key="index" :value="funding">{{ funding }}</option>
  </select>

  <label for="start-date" class="ms-1">From</label>
  <input type="date" name="start-date" v-model="filtering.start_date" class="form-control" :max="filtering.end_date">

  <label for="end-date" class="ms-1">To</label>
  <input type="date" name="end-date" v-model="filtering.end_date" class="form-control" :min="filtering.start_date">

  <div class="btn btn-primary form-control mt-4" @click="returnFiltered">Filter</div>
  <div class="btn btn-outline-grey form-control mt-2 mb-5" id="clear-btn" @click="clearFilter">Clear Filter</div>

  <div>
    <div class="mb-2" style="width:100%; text-align:center; border-bottom:1px solid white">Quick Options</div>
    <button class="btn btn-primary form-control mb-2" @click="quickOption('today')">Today</button>
    <button class="btn btn-primary form-control mb-2" @click="quickOption('yesterday')">Yesterday</button>
    <button class="btn btn-primary form-control mb-2" @click="quickOption('last 7')">Last 7 Days</button>
    <button class="btn btn-primary form-control mb-2" @click="quickOption('last 14')">Last 14 Days</button>
  </div>
</div>
  
  
</template>

<script setup>
import moment from 'moment'
import { computed, ref } from 'vue'
import useSorter from '../../../../composables/useSorter'
import { useFilterStore } from '../../../../stores/filter'
import { useLessonsStore } from '../../../../stores/lessons';

const filter = useFilterStore()
const lessonStore = useLessonsStore()
const sorter = useSorter()
filter.setReturned({})
const originalData = ref(filter.getData)

const attendanceArray = ref(Array.from(new Set(originalData.value.map(d => d.attendance))))

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

const fundingArray = computed(() => {
  // creates a set of tutors for the selected instrument
  var fundingSet = new Set();
  lessonStore.getLessonsData
  .forEach(function(lesson) {
    if(lesson.attributes.funding_type != null) fundingSet.add(lesson.attributes.funding_type)
    })
  // converts set to array
  let fundingTypeArray = Array.from(fundingSet)

  // returns array of instrument tutors
  return fundingTypeArray
})

const filtering = ref({
  attendance: '',
  tutor: '',
  funding: '',
  start_date: formatDate(moment().subtract(7,'d')),
  end_date: formatDate(moment())
})

function returnFiltered(){
  let filteredAttendance = originalData.value
  filteredAttendance = filteredAttendance.filter(att => att.date >= filtering.value.start_date && att.date <= filtering.value.end_date)
  if(filtering.value.attendance != '') filteredAttendance = filteredAttendance.filter(att => att.attendance == filtering.value.attendance)
  if(filtering.value.tutor != '') filteredAttendance = filteredAttendance.filter(d => d.tutor.id == filtering.value.tutor)
  if(filtering.value.funding != '') filteredAttendance = filteredAttendance.filter(d => d.funding_type == filtering.value.funding)
  sorter.sort(filteredAttendance, 'date', 'desc')
  Object.keys(filteredAttendance).length > 0 
  ? filter.setReturned(filteredAttendance)
  : filter.setReturned([])
  
}

returnFiltered()

function clearFilter(){
  filtering.value = {
    attendance: '',
    tutor: '',
    funding: '',
    start_date: formatDate(moment().subtract(7,'d')),
    end_date: formatDate(moment())
  }
  returnFiltered()
}

function formatDate(date){
  return moment(date).format('YYYY-MM-DD')
}

function quickOption(option){
  if(option === 'today') {filtering.value.start_date = formatDate(moment()); filtering.value.end_date = formatDate(moment())}
  if(option === 'yesterday') {filtering.value.start_date = formatDate(moment().subtract(1,'d')); filtering.value.end_date = formatDate(moment().subtract(1,'d'))}
  if(option === 'last 7') {filtering.value.start_date = formatDate(moment().subtract(7,'d')); filtering.value.end_date = formatDate(moment())}
  if(option === 'last 14') {filtering.value.start_date = formatDate(moment().subtract(14,'d')); filtering.value.end_date = formatDate(moment())}
  returnFiltered()
}
</script>

<style lang="scss" scoped>
.clear-btn {
  background: white;
  &:hover {
    background: $ah-grey;
  }
}
</style>