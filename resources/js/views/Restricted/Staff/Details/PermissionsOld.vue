<template>
  <div>
    <h3>School Permissions:</h3>
    <h4>Administrator:
      <i :style="{ cursor: 'pointer' }" :class="getPermissionIconClass('Administrator', 'Administrator')" @click="toggleAdministrator()" />
    </h4>
    <table v-if="!mobileDevice">
      <thead>
        <tr>
          <th>Access</th>
          <th>Restricted View</th>
          <th>View</th>
          <th>Edit</th>
          <th>Create</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody :class="{disabled: !user.hasPermission('STAFF_E', school.id) && !user.hasPermission('Administrator', school.id)}">
        <PermissionRow v-for="permission in permissionsArray" :key="permission.access" :permission="permission" />
      </tbody>
    </table>
    <div v-else>
      <p>Individual User Permissions cannot be set on a mobile device.</p>
    </div>
  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import { useSchoolStore } from "../../../../stores/schools";
import { useStaffStore } from "../../../../stores/staff";
import { useUserStore } from "../../../../stores/user";
import { useWindowSize } from "/resources/js/composables/useWindowSize";
import PermissionRow from "./PermissionRow.vue";

// Initiate Stores
const staffStore = useStaffStore();
const schoolStore = useSchoolStore();
const user = useUserStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get stored values
const staff = staffStore.getStaff;
const school = schoolStore.getSchool

// Get window size to set display
const mobileDevice = computed(() => {
  return windowSize.value.width < 768 ? true : false
})

// // Set whether staff member is an administrator or not
// const administrator = staff.permissions.some(p => p.type === 'Administrator')

// Check if staff has permission already in staff permissions
function StaffHasPermission(value) {
  return staff.permissions.some(p => p.type == value);
}

// Permission array of values that can be toggled by an administrator or 'STAFF_E'
const permissionsArray = staffStore.permissionsArray;

// Display the correct icon for the permission access
function getPermissionIconClass(permission, action) {
  console.log('checking');
  if(permission == 'Administrator'){
    const hasPerm = StaffHasPermission(action);
    return `${hasPerm ? "fa-solid fa-circle-check" : "fa-regular fa-circle-xmark"}`;
  }
  const hasPerm = StaffHasPermission(action);
  return `fa-2x ${hasPerm ? "fa-solid fa-circle-check" : "fa-regular fa-circle"}`;
}

// // Toggle permission access on/off for non-administrators
// function togglePermission(action) {
//   if (!user.hasPermission('STAFF_E', school.id)) return;
//   if (administrator) return;

//   const permission = staff.permissions.some(p => p.type === action);
//   if (permission) {
//     // The permission object with the specified action exists and needs to be removed
//     let permissionObject = staff.permissions.find(p => p.type === action)
//     staffStore.removePermission(permissionObject.id);
//     refresh.value++
//   } else {
//     // The permission object doesn't exist and needs to be added
//     staffStore.setPermission(staff.id, school.id, action);
//   }
// }


// Toggle whether a staff member is an administrator or not
function toggleAdministrator(){
  if(user.hasPermission('Administrator', school.id) && (user.attributes.id != staff.id)) {
    if(StaffHasPermission('Administrator')) {
      let permission = staff.permissions.find(p => p.type === 'Administrator')
      staffStore.removePermission(permission.id)
    }
    else {
      staffStore.setPermission(staff.id, school.id, 'Administrator')
    }
  }
}

</script>


<style lang="scss" scoped>
h3 {
  color: $ah-primary;
}
table {
  width: 100%;
  border-bottom: 5px solid $ah-primary;
  thead {
  background: $ah-primary-light;
  color:white;
  }
  tbody tr td {
    padding-top: 0.75rem;
    padding-bottom: 0.75rem;
    border-bottom: 1px solid $ah-grey;
    &:first-of-type{
      color: $ah-primary;
    }
  }
}
tr:hover {
  cursor: default;
  background-color: transparent;
}
.Yes {
  color: $ah-secondary-dark;
}
.fa-circle-check {
  color: $ah-green;
}
.fa-circle-xmark {
  color: $ah-red;
}
.fa-circle {
  color: $ah-primary;
}
.orange {
  color: orange;
}
.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

</style>