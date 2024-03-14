<template>
<div style="text-align:center">
  <h2 class="text-primary"> Demote {{staff.first_name}} from Administrator?</h2>
  <p>Administrators have access to all data related to {{schoolStore.getSchool.name}} and can create, update, and delete data including, lessons, events, and other staff.</p>
  <p>Demoting someone will restrict them to actions permitted in the school permissions section. They will retain any permissions that were set before they became an Administrator.</p>
  <div>
    <button class="btn btn-grey" @click="cancel">Cancel</button>
    <button class="btn btn-primary ms-3" @click="setAdministrator">Yes, Demote {{staff.first_name}}</button>
  </div>
</div>
  
</template>

<script setup>
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
  let permissionObject = staff.permissions.find(p => p.type === 'Administrator')
  staffStore.removePermission(permissionObject.id)
  toast.open('success', 'Administrator Removed', `${staff.first_name} is no longer an Administrator`)
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