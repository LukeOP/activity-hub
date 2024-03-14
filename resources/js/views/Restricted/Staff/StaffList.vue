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
    <InvitationController :key="key2" v-if="!mobileFormat && user.hasPermission('STAFF_C', selectedSchool.id)" />
    
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from "vue";
import useApi from "../../../composables/useApi";
import { useSchoolStore } from "../../../stores/schools";
import { useUserStore } from "../../../stores/user";
import { useActionsStore } from "/resources/js/stores/actions";
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import ComponentController from './ListComponents/ComponentController.vue'
import InvitationController from './ListComponents/InvitationController.vue'
import { useWindowSize } from "/resources/js/composables/useWindowSize";
import { useStaffStore } from "/resources/js/stores/staff";

// Initiate Stores
const schoolStore = useSchoolStore()
const user = useUserStore()
const actions = useActionsStore()
const staffStore = useStaffStore()

const { mobileFormat } = useWindowSize()

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
const key2 = ref(0)

// Fetch Schools Data based on Logged in User's school associations. Set selectedSchool to first school on list
// const { data: schools, fetchData: fetchSchools } = useApi('schools')
// if(Object.keys(schoolStore.getSchool).length > 0){
//   selectedSchool.value = schoolStore.getSchool
//   defineActions()
// } else {
//   fetchSchools().then(()=>{
//     schoolStore.setSchools(schools.value)
//     selectedSchool.value = schools.value[0]
//     staffStore.fetchStaff(selectedSchool.value.id)
//     defineActions()
//   })
// }
onMounted(()=>{
  selectedSchool.value = schoolStore.getSchool
  defineActions()
})

// Watch for a change in selected school an update components
watch(() => selectedSchool.value, (newValue) => {
  schoolStore.setSchool(newValue)
  staffStore.fetchStaff(newValue.id)
  defineActions()
  key.value++
  key2.value++
})

// Watch for a change in selected school an update components
watch(() => staffStore.value, () => {
  key2.value++
}, {deep: true})
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