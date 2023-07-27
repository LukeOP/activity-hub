<template>
<div>
  <label for="instrument" class="ms-1">Instrument</label>
  <select name="instrument" id="instrument" class="form-control mb-2" v-model="filtering.instrument">
    <option value="" selected>All Instruments</option>
    <option v-for="(instrument, index) in instrumentArray" :key="index" :value="instrument">{{ instrument }}</option>
  </select>

  <label for="tutor" class="ms-1">Tutor</label>
  <select name="tutor" id="tutor" class="form-control mb-2" v-model="filtering.tutor">
    <option value="" selected>All Tutors</option>
    <option v-for="(tutor, index) in tutorArray" :key="index" :value="tutor.id">{{ tutor.name }}</option>
  </select>

  <label for="day" class="ms-1">Day</label>
  <select name="day" id="day" class="form-control mb-2" v-model="filtering.day">
    <option value="" selected>All Days</option>
    <option v-for="(day, index) in dayArray" :key="index" :value="day">{{ day }}</option>
  </select>

  <label for="status" class="ms-1">Status</label>
  <select name="status" id="status" class="form-control mb-2" v-model="filtering.status">
    <option value="" selected>All Statuses</option>
    <option v-for="(status, index) in statusArray" :key="index" :value="status">{{ status }}</option>
  </select>

  <div class="btn btn-primary form-control mt-2" @click="returnFiltered">Filter</div>
  <div class="btn btn-outline-grey form-control mt-2" id="clear-btn" @click="clearFilter">Clear Filter</div>
</div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useFilterStore } from '../../../../stores/filter'

const filter = useFilterStore()
const originalData = ref(filter.data)
const filtering = ref({
  instrument: '',
  tutor: '',
  day: '',
  status: ''
})

// Setup Data Filters
const instrumentArray = computed(()=>{
  return Array.from(new Set(originalData.value.map(d => d.attributes.instrument)))
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

// Return filtered data to component by updating state
function returnFiltered(){
  let filteredData = originalData.value
  if(filtering.value.instrument != '') filteredData = filteredData.filter(d => d.attributes.instrument == filtering.value.instrument)
  if(filtering.value.tutor != '') filteredData = filteredData.filter(d => d.tutor.id == filtering.value.tutor)
  if(filtering.value.day != '') filteredData = filteredData.filter(d => d.attributes.day == filtering.value.day)
  if(filtering.value.status != '') filteredData = filteredData.filter(d => d.attributes.status == filtering.value.status)
  filter.setReturned(filteredData)
}

// Reset filter and return to component
function clearFilter(){
  filtering.value = {
    instrument: '',
    tutor: '',
    day: '',
    status: ''
  }
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