<template>
<div>
  <label for="attendance" class="ms-1">Attendance</label>
  <select name="attendance" id="attendance" class="form-control mb-2" v-model="filtering.attendance">
    <option value="" selected>All Attendances</option>
    <option v-for="(attendance, index) in selectionArrays" :key="index" :value="attendance">{{ attendance }}</option>
  </select>

  <div class="btn btn-primary form-control mt-2" @click="returnFiltered">Filter</div>
  <div class="btn btn-outline-grey form-control mt-2" id="clear-btn" @click="clearFilter">Clear Filter</div>
</div>
  
  
</template>

<script setup>
import { ref } from 'vue'
import { useFilterStore } from '../../../../stores/filter'

const filter = useFilterStore()
filter.setReturned({})
const originalData = ref(filter.getData)
// console.log(originalData.value)
const selectionArrays = ref(Array.from(new Set(originalData.value.attendance.map(d => d.attendance))))

const filtering = ref({
  attendance: '',
})

function returnFiltered(){
  let filteredAttendance = originalData.value.attendance
  if(filtering.value.attendance != ''){
    filteredAttendance = filteredAttendance.filter(att => att.attendance == filtering.value.attendance)
  }
  const returnLesson = ref({
    id: originalData.value.id,
    attributes: originalData.value.attributes,
    attendance: filteredAttendance,
    school: originalData.value.school,
    student: originalData.value.student,
    tutor: originalData.value.tutor
  })
  filter.setReturned(returnLesson.value)
}

function clearFilter(){
  filtering.value = {
    attendance: '',
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