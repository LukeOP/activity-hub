<template>
  <div>
    <h1>Staff</h1>
    <div v-if="schools" class="tab-header mb-3">
      <div>
        <span class="school-tile unselectable" 
        :class="{active: selectedSchool.id === school.id}" 
        v-for="school in schools.data" :key="school.id" 
        @click="selectedSchool = school; key++">{{school.name}}</span>
      </div>
      <span v-if="user.hasPermission('STAFF_C', selectedSchool.id)" class="add-staff" @click="handleNewStaffClick">New Staff Member</span>
    </div>
    <div v-if="selectedSchool">
      <StaffTable :school_id="selectedSchool.id" :key="key" />
      <InvitationTable :school_id="selectedSchool.id" :key="key" />
    </div>
    
    
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import useApi from "../../../composables/useApi";
import { useModalStore } from "../../../stores/modal";
import { useSchoolStore } from "../../../stores/schools";
import { useUserStore } from "../../../stores/user";
import StaffTable from './ListComponents/StaffTable.vue'
import InvitationTable from './ListComponents/InvitationTable.vue'

const schoolStore = useSchoolStore()
const currentSchool = schoolStore.getSchool
const modal = useModalStore()
const user = useUserStore()

const selectedSchool = ref(currentSchool)
const key = ref(0)

const { data: schools, fetchData: fetchSchools } = useApi('schools')
fetchSchools().then(()=>{
  if(Object.keys(currentSchool).length > 0) {selectedSchool.value = currentSchool}
  else {
    selectedSchool.value = schools.value.data[0]}
});

watch(() => selectedSchool.value, (newValue) => {
  schoolStore.setSchool(newValue)
  key.value++
  })

function handleNewStaffClick(){
  modal.open('NewStaff')
}

</script>

<style lang="scss" scoped>
.tab-header {
  display: flex;
  justify-content: space-between;
}
.school-tile {
  display: inline-flex;
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
.add-staff {
  background: $ah-secondary;
  color: white;
  padding: 10px;
  border-radius: 0.5rem;
  &:hover {
    background: $ah-secondary-dark;
    cursor: pointer;
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