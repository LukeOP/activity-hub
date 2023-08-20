<template>
  <div>
    <h1>Staff</h1>
    <div v-if="schools" class="tab-header">
      <span class="school-tile unselectable" 
      :class="{active: currentSchool === school.id}" 
      v-for="school in schools.data" :key="school.id" 
      @click="currentSchool = school.id; key++">{{school.name}}</span>
    </div>
    <div v-if="currentSchool.length > 0">
      <StaffTable :school_id="currentSchool" :key="key" />
    </div>
    
    
  </div>
</template>

<script setup>
import { ref } from "vue";
import useApi from "../../../composables/useApi";
import { useUserStore } from "../../../stores/user";
import StaffTable from './ListComponents/StaffTable.vue'

const currentSchool = ref('')
const key = ref(0)


const { data: schools, fetchData: fetchSchools } = useApi('schools')
fetchSchools().then(()=>{
  currentSchool.value = schools.value.data[0].id
});

</script>

<style lang="scss" scoped>
.tab-header {
  width: fit-content;
  padding-top: 7px;
  padding-bottom: 7px;
  background: $ah-grey;
  border-top-right-radius: 0.5rem;
  border-top-left-radius: 0.5rem;
}
.school-tile {
  background: $ah-grey;
  color: white;
  padding: 10px;
  cursor: pointer;
  &:first-child {
    border-top-left-radius: 0.5rem;
  }
  &:last-child {
    border-top-right-radius: 0.5rem;
  }
}
.active {
  background: $ah-primary;
  // box-shadow: 5px 5px 5px $ah-grey;
  border-top-right-radius: 0.5rem;
  border-top-left-radius: 0.5rem;
}

</style>