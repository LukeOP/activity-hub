<template>
<div>
  <label for="instrumentFamily" class="ms-1">Instrument Family</label>
  <select name="instrumentFamily" id="instrumentFamily" class="form-control mb-2" v-model="filtering.family" @change="returnFiltered">
    <option value="" selected>All Families</option>
    <option v-for="(instrument, index) in instrumentFamilyArray" :key="index" :value="instrument">{{ instrument }}</option>
  </select>

  <label for="instrument" class="ms-1">Instrument Type</label>
  <select name="instrument" id="instrument" class="form-control mb-2" v-model="filtering.type" @change="returnFiltered">
    <option value="" selected>All Instruments</option>
    <option v-for="(instrument, index) in instrumentTypeArray" :key="index" :value="instrument">{{ instrument }}</option>
  </select>

  <label for="status" class="ms-1">Status</label>
  <select name="status" id="status" class="form-control mb-2" v-model="filtering.status" @change="returnFiltered">
    <option value="" selected>All Statuses</option>
    <option v-for="(status, index) in statusArray" :key="index" :value="status.id">{{ status.description }}</option>
  </select>

  <label v-if="user.getSchools.length > 1" for="school" class="ms-1">School</label>
  <select v-if="user.getSchools.length > 1" name="school" id="school" class="form-control mb-2" v-model="filtering.school" @change="returnFiltered">
    <option value="" selected>All schools</option>
    <option v-for="(school, index) in schoolArray" :key="index" :value="school.id">{{ school.name }}</option>
  </select>

  <div class="btn btn-primary form-control mt-2" id="clear-btn" @click="clearFilter">Clear Filter</div>
</div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useFilterStore } from '../../../../stores/filter'
import { useUserStore } from '/resources/js/stores/user';

const filter = useFilterStore()
const originalData = ref(filter.data)
const user = useUserStore()
const filtering = ref({
  type: '',
  family: '',
  status: '',
  school: ''
})

// Setup Data Filters

// Instrument Types
const instrumentTypeArray = computed(()=>{
  return Array.from(new Set(originalData.value.map(d => d.attributes.type)))
})

// Instrument Families
const instrumentFamilyArray = computed(()=>{
  return Array.from(new Set(originalData.value.map(d => d.attributes.family)))
})

// Get Status'
const statusArray = computed(()=>{
  return originalData.value.reduce((result, data) => {
    const status = { id: data.attributes.state.id, description: `${data.attributes.state.description}` };
    const existingStatus = result.find(t => t.id === status.id);

    if (!existingStatus) {
      result.push(status);
    }
    
    return result;
  }, []);
})

// Get Schools
const schoolArray = computed(()=>{
  return originalData.value.reduce((result, data) => {
    const school = { id: data.school.id, name: `${data.school.name}` };
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
  if(filtering.value.type != '') filteredData = filteredData.filter(d => d.attributes.type == filtering.value.type)
  if(filtering.value.family != '') filteredData = filteredData.filter(d => d.attributes.family == filtering.value.family)
  if(filtering.value.status != '') filteredData = filteredData.filter(d => d.attributes.state.id == filtering.value.status)
  if(filtering.value.school != '') filteredData = filteredData.filter(d => d.school.id == filtering.value.school)
  filter.setReturned(filteredData)
}

// Reset filter and return to component
function clearFilter(){
  filtering.value = {
    type: '',
    family: '',
    status: '',
    school: ''
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