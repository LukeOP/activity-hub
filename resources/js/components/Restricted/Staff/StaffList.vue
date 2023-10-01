<template>
  <div>
    <HeaderLine heading="Staff" :school="selectedSchool.name" />
    <div v-if="schoolStore.getSchools" class="tab-header mb-3">
      <div v-if="schoolStore.getSchools.length > 1">
        <span class="school-tile unselectable" 
        :class="{active: selectedSchool.id === school.id}" 
        v-for="school in schoolStore.getSchools" :key="school.id" 
        @click="selectedSchool = school; key++">{{school.name}}</span>
      </div>
    </div>
    <ComponentController :key="key" />
    <!-- <div v-if="selectedSchool">
      <component :is="currentComponent" :staff="filteredStaff" />
      <StaffTable :school_id="selectedSchool.id" :key="key" />
      <InvitationTable :school_id="selectedSchool.id" :key="key" />
    </div> -->
    
    
  </div>
</template>

<script setup>
import { computed, ref, watch } from "vue";
import useApi from "../../../composables/useApi";
import { useSchoolStore } from "../../../stores/schools";
import { useUserStore } from "../../../stores/user";
import StaffTable from './ListComponents/StaffTable.vue'
import StaffTableMobile from './ListComponents/StaffTableMobile.vue'
import { useActionsStore } from "/resources/js/stores/actions";
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue'
import { useWindowSize } from "/resources/js/composables/useWindowSize";
import ComponentController from './ListComponents/ComponentController.vue'

// Initiate Stores
const schoolStore = useSchoolStore()
const user = useUserStore()
const actions = useActionsStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? StaffTable : StaffTableMobile
})

// Set side actions available on this page
function defineActions(){
  const actionArray = []
  if(user.hasPermission('STAFF_C', selectedSchool.value.id)){
    actionArray.push({ header: 'Link New Staff', to: { name: 'StaffList' }, icon: 'fa-solid fa-square-plus', modal: 'NewStaff'})
  }
  actions.setItems(actionArray)
}

// Assign selected school
const selectedSchool = ref({})

// Key to update components
const key = ref(0)

// Fetch Schools Data based on Logged in User's school associations. Set selectedSchool to first school on list
const { data: schools, fetchData: fetchSchools } = useApi('schools')
if(Object.keys(schoolStore.getSchool).length > 0){
  selectedSchool.value = schoolStore.getSchool
} else {
  fetchSchools().then(()=>{
    schoolStore.setSchools(schools.value)
    selectedSchool.value = schools.value[0]
    defineActions()
  })
}

// Watch for a change in selected school an update components
watch(() => selectedSchool.value, (newValue) => {
  schoolStore.setSchool(newValue)
  defineActions()
  key.value++
  })

</script>

<style lang="scss" scoped>
.tab-header {
  display: flex;
  justify-content: space-between;
}
.school-tile {
  color: $ah-grey-dark;
  margin-right: 0.5rem;
  &:hover {
    color: $ah-grey-dark;
    border-bottom: 1px solid $ah-grey-dark;
    cursor: pointer;
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
  color: $ah-primary;
  // text-decoration: underline;;
  font-weight: bold;
  // background: $ah-primary;
  &:hover {
    background: transparent;
    border: none;
    color: $ah-primary;
    cursor: default;
  }
}

</style>