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

  <label for="start-date" class="ms-1">From</label>
  <input type="date" name="start-date" v-model="filtering.start_date" class="form-control" :max="filtering.end_date">

  <label for="end-date" class="ms-1">To</label>
  <input type="date" name="end-date" v-model="filtering.end_date" class="form-control" :min="filtering.start_date">

  <div class="btn btn-primary form-control mt-2" @click="returnFiltered">Filter</div>
  <div class="btn btn-outline-grey form-control mt-2" id="clear-btn" @click="clearFilter">Clear Filter</div>
</div>
  
  
</template>

<script setup>
import moment from 'moment'
import { computed, ref } from 'vue'
import useSorter from '../../../../composables/useSorter'
import { useFilterStore } from '../../../../stores/filter'

const filter = useFilterStore()
const sorter = useSorter()
filter.setReturned({})
const originalData = ref(filter.getData)

const attendanceArray = ref(Array.from(new Set(originalData.value.map(d => d.lesson.attendance))))
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

const filtering = ref({
  attendance: '',
  tutor: '',
  start_date: moment().subtract(7,'d').format('YYYY-MM-DD'),
  end_date: moment().format('YYYY-MM-DD')
})
console.log(filtering.value)

function returnFiltered(){
  let filteredAttendance = originalData.value
  filteredAttendance = filteredAttendance.filter(att => att.lesson.date >= filtering.value.start_date && att.lesson.date <= filtering.value.end_date)
  if(filtering.value.attendance != '') filteredAttendance = filteredAttendance.filter(att => att.lesson.attendance == filtering.value.attendance)
  if(filtering.value.tutor != '') filteredAttendance = filteredAttendance.filter(d => d.tutor.id == filtering.value.tutor)
  sorter.sort(filteredAttendance, 'lesson.date', 'desc')
  filter.setReturned(filteredAttendance)
}

returnFiltered()

function clearFilter(){
  filtering.value = {
    attendance: '',
    tutor: '',
    start_date: moment().subtract(7,'d').format('YYYY-MM-DD'),
    end_date: moment().format('YYYY-MM-DD')
  }
  filter.setReturned({})
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