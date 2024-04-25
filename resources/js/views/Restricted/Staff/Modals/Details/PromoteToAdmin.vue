<template>
<div style="text-align:center">
  <h2 class="text-primary"> Promote {{staff.first_name}} to Administrator?</h2>
  <p>Administrators have access to all data related to {{schoolStore.getSchool.name}} and can create, update, and delete data including, lessons, events, and other staff.</p>
  <p>It is advised to only have a few Administrators and set all other individual permission levels as appropriate to staff needs.</p>
  <div>
    <button class="btn btn-grey" @click="cancel">Cancel</button>
    <button class="btn btn-primary ms-3" @click="setAdministrator">Yes, Promote {{staff.first_name}}</button>
  </div>
</div>
  
</template>

<script setup>
import useApi from "../../../../../composables/useApi";
import { useModalStore } from "../../../../../stores/modal";
import { useSchoolStore } from "../../../../../stores/schools";
import { useStaffStore } from "../../../../../stores/staff";
import { useToastStore } from "../../../../../stores/toast";

const staffStore = useStaffStore()
const staff = staffStore.singleStaff
const schoolStore = useSchoolStore()
const modal = useModalStore()
const toast = useToastStore()

function setAdministrator(){
  // const { data, fetchData } = useApi('user-permissions', {user_id: staff.getStaff.id, school_id: schoolStore.getSchool.id, permission_type: 'Administrator'})
  // fetchData().then(()=>{

  // })
  staffStore.setPermission(staff.id, schoolStore.getSchool.id, 'Administrator')
  toast.open('success', 'Administrator Created', `${staff.first_name} has been made an Administrator`)
  cancel()
}

function cancel(){
  modal.close()
}

</script>

<style lang="scss" scoped>
.subject {
  font-weight: bold;
  color: $ah-primary;
}

</style>