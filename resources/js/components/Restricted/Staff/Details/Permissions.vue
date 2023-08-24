<template>
  <div>
    <h3>School Permissions:</h3>
    <h4>Administrator: 
      <i :style="{ cursor: 'pointer' }" :class="getPermissionIconClass('administrator', 'administrator')" @click="toggleAdministrator()" />
    </h4>
    <table>
      <thead>
        <tr>
          <th>Access</th>
          <th>Restricted</th>
          <th>View</th>
          <th>Edit</th>
          <th>Create</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody :class="{disabled: !user.hasPermission('STAFF_E', school.id) && !user.hasPermission('administrator', school.id)}">
        <tr v-for="permission in permissionsArray" :key="permission.access">
          <td>{{ permission.access }}</td>
          <td v-for="action in permission.actions" :key="action" :style="{ width: '15%' }">
            <i :style="{ cursor: 'pointer' }" :class="getPermissionIconClass(permission, action)"
              @click="togglePermission(action)"></i>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useSchoolStore } from "../../../../stores/schools";
import { useStaffStore } from "../../../../stores/staff";
import { useUserStore } from "../../../../stores/user";

const staffStore = useStaffStore();
const staff = staffStore.getStaff;
const schoolStore = useSchoolStore();
const school = schoolStore.getSchool
const user = useUserStore()

const isAdministrator = computed(() => (staff.permissions.find(p => p.type === "administrator") ? "Yes" : "No"));

function hasPermission(value) {
  return isAdministrator.value === "Yes" || staff.permissions.some(p => p.type === value);
}

const permissionsArray = [
  { access: "Lessons", actions: ["LESSONS_R", "LESSONS_V", "LESSONS_E", "LESSONS_C", "LESSONS_D"] },
  { access: "Attendance", actions: ["ATTENDANCE_R", "ATTENDANCE_V", "ATTENDANCE_E", "ATTENDANCE_C", "ATTENDANCE_D"] },
  { access: "Students", actions: ["STUDENTS_R", "STUDENTS_V", "STUDENTS_E", "STUDENTS_C", "STUDENTS_D"] },
  { access: "Events", actions: ["EVENTS_R", "EVENTS_V", "EVENTS_E", "EVENTS_C", "EVENTS_D"] },
  { access: "Instruments", actions: ["INSTRUMENTS_R", "INSTRUMENTS_V", "INSTRUMENTS_E", "INSTRUMENTS_C", "INSTRUMENTS_D"] },
  { access: "Hires", actions: ["HIRES_R", "HIRES_V", "HIRES_E", "HIRES_C", "HIRES_D"] },
  { access: "Rooms", actions: ["ROOMS_R", "ROOMS_V", "ROOMS_E", "ROOMS_C", "ROOMS_D"] },
  { access: "Bookings", actions: ["BOOKINGS_R", "BOOKINGS_V", "BOOKINGS_E", "BOOKINGS_C", "BOOKINGS_D"] },
  { access: "Staff", actions: ["STAFF_R", "STAFF_V", "STAFF_E", "STAFF_C", "STAFF_D"] },
  
];

function getPermissionIconClass(permission, action) {
  if(permission == 'administrator'){
    const hasPerm = hasPermission(action);
    return `${hasPerm ? "fa-solid fa-circle-check" : "fa-regular fa-circle-xmark"}`;
  }
  const hasPerm = hasPermission(action);
  return `fa-2x ${hasPerm ? "fa-solid fa-circle-check" : "fa-regular fa-circle"}`;
}

function togglePermission(action){
  if((user.hasPermission('STAFF_E', school.id) || user.hasPermission('administrator', school.id)) && isAdministrator.value === 'No') {
    if(hasPermission(action)) {
      let permission = staff.permissions.find(p => p.type === action)
      staffStore.removePermission(permission.id)
    }
    else {
      staffStore.setPermission(staff.id, school.id, action)
    }
  }
}
function toggleAdministrator(){
  if(user.hasPermission('administrator', school.id) && (user.attributes.id != staff.id)) {
    console.log(user.attributes.id, staff.id)
    if(hasPermission('administrator')) {
      let permission = staff.permissions.find(p => p.type === 'administrator')
      staffStore.removePermission(permission.id)
    }
    else {
      staffStore.setPermission(staff.id, school.id, 'administrator')
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