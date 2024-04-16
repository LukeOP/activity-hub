<template>
  <div>
    <HeaderLine heading="Staff" :school="schoolStore.getSchool.name" />
    <div v-if="permittedSchools" class="tab-header mb-3">
      <div v-if="permittedSchools.length > 1">
        <span v-for="school in permittedSchools" :key="school" class="school-tile unselectable" 
          :class="{active: schoolStore.getSchool.id === school.school_id}" 
          @click="schoolStore.setSchool(school.school_id)">{{school.name}}
        </span>
      </div>
    </div>
    
    <ComponentController />
    <InvitationController v-if="!mobileFormat && user.hasPermission('STAFF_C', schoolStore.getSchool.id)" />
    
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch, } from "vue";
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

const permittedSchools = computed(()=>{
  return user.permissions.filter(p => (p.type == 'STAFF_V' || p.type == 'Administrator'))
})

// Set side actions available on this page
function defineActions(){
  const actionArray = []
  if(user.hasPermission('STAFF_C', schoolStore.getSchool.id)){
    actionArray.push({ header: 'Link New Staff', to: { name: 'StaffList' }, icon: 'fa-solid fa-square-plus', modal: 'NewStaff'})
  }
  actions.setItems(actionArray)
}

watch(()=>schoolStore.getSchool, () => {
  staffStore.fetchStaff(schoolStore.getSchool.id)
  defineActions()
})

onMounted(()=>{
  staffStore.fetchStaff(schoolStore.getSchool.id)
  defineActions()
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