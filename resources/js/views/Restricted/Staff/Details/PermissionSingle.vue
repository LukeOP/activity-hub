<template>
    <i v-if="action != ''" :style="{ cursor: 'pointer' }" 
        :class="getPermissionIconClass"
        @click="togglePermission" 
    ></i>
</template>

<script setup>
import { useStaffStore } from '../../../../stores/staff';
import { useUserStore } from '../../../../stores/user';
import { useSchoolStore } from '../../../../stores/schools';
import { computed } from 'vue';


const props = defineProps({action: String})

const staffStore = useStaffStore()
const user = useUserStore()
const schoolStore = useSchoolStore()
const school = schoolStore.getSchool

const staff = staffStore.getStaff;

// Set whether staff member is an administrator or not
const administrator = computed(()=>{
  return staff.permissions.some(p => p.type === 'Administrator')
})

// Check if staff has permission already in staff permissions
function StaffHasPermission() {
  return staff.permissions.some(p => p.type == props.action);
}

// Display the correct icon for the permission access
const getPermissionIconClass = computed(() => {
  const hasPerm = StaffHasPermission();
  return `fa-2x ${hasPerm || administrator.value ? "fa-regular fa-circle-check" : "fa-regular fa-circle"}`;
})

// Toggle permission access on/off for non-administrators
function togglePermission() {
  if (!user.hasPermission('STAFF_E', school.id)) return;
  if (administrator.value) return;

  const permission = staff.permissions.some(p => p.type === props.action);
  if (permission) {
    // The permission object with the specified action exists and needs to be removed
    let permissionObject = staff.permissions.find(p => p.type === props.action)
    staffStore.removePermission(permissionObject.id)
  } else {
    // The permission object doesn't exist and needs to be added
    staffStore.setPermission(staff.id, schoolStore.getSchool.id, props.action);
  }
}

</script>

<style lang="scss" scoped>
.fa-circle-check {
  color: $ah-green;
}
.fa-circle-xmark {
  color: $ah-red;
}
.fa-circle {
  color: $ah-grey;
}

</style>