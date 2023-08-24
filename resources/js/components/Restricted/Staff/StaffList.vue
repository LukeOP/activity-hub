<template>
  <div>
    <h1>Staff</h1>
    <div v-if="schools" class="tab-header mb-3">
      <span class="school-tile unselectable" 
      :class="{active: selectedSchool === school.id}" 
      v-for="school in schools.data" :key="school.id" 
      @click="selectedSchool = school.id; key++">{{school.name}}</span>
    </div>
    <div v-if="selectedSchool">
      <StaffTable :school_id="selectedSchool" :key="key" />
    </div>
    
    
  </div>
</template>

<script setup>
import { ref } from "vue";
import useApi from "../../../composables/useApi";
import { useSchoolStore } from "../../../stores/schools";
import { useUserStore } from "../../../stores/user";
import StaffTable from './ListComponents/StaffTable.vue'

const schoolStore = useSchoolStore()
const currentSchool = schoolStore.getSchool

const selectedSchool = ref('')
const key = ref(0)


const { data: schools, fetchData: fetchSchools } = useApi('schools')
fetchSchools().then(()=>{
  if(Object.keys(currentSchool).length > 0) {selectedSchool.value = currentSchool.id}
  else {selectedSchool.value = schools.value.data[0].id}
});

</script>

<style lang="scss" scoped>
.school-tile {
  background: $ah-grey;
  color: white;
  padding: 10px;
  cursor: pointer;
  margin-right: 0.5rem;
  border-radius: 0.5rem;
  &:hover {
    background: $ah-grey-dark;
  }
}
.active {
  background: $ah-primary;
  // box-shadow: 5px 5px 5px $ah-grey;
  &:hover {
    background: $ah-primary;
    cursor: default;
  }
}

</style>