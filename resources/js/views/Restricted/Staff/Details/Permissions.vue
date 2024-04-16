<template>
    <div>
        <h3>School Permissions</h3>
        <h4>{{ school.name }} Administrator:
            <i :class="isAdmin()"></i>
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
            <!-- <tbody :class="{disabled: true}"> -->
            <tbody :class="{disabled: !user.hasPermission('STAFF_E', school.id)}">
                <tr v-for="permissionRow in staffStore.permissionsArray" :key="permissionRow">
                    <td>{{ permissionRow.access }}</td>
                    <td v-for="action in permissionRow.actions" :key="action">
                        <ToolTip :tip="getTip(permissionRow, action)">
                            <PermissionSingle :action="action" />
                        </ToolTip>
                    </td>
                </tr>
            </tbody>
        </table>
        <div v-else>
            <p>Individual User Permissions cannot be set on a mobile device.</p>
        </div>

    </div>
</template>

<script setup>
import { useStaffStore } from '../../../../stores/staff';
import { useSchoolStore } from '../../../../stores/schools';
import { useUserStore } from '../../../../stores/user';
import { useWindowSize } from "/resources/js/composables/useWindowSize";
import { computed } from 'vue';
import PermissionSingle from './PermissionSingle.vue';
import ToolTip from '../../../../components/Layouts/MainLayout/Elements/ToolTip.vue';

const staffStore = useStaffStore()
const user = useUserStore()
const schoolStore = useSchoolStore()
const school = schoolStore.getSchool

const {windowSize} = useWindowSize()

// Get window size to set display
const mobileDevice = computed(() => {
  return windowSize.value.width < 768 ? true : false
})

// Display the correct icon for the permission access
function isAdmin() {
  return `fa-1x ${staffStore.getStaff.permissions.some(p => p.type === 'Administrator') ? "fa-solid fa-circle-check" : "fa-regular fa-circle-xmark"}`;
}

function getTip(access, permission){
    return permission.endsWith("R") ? access.toolTip : ''
}

</script>

<style lang="scss" scoped>
th, td {
    text-align: center;
    border: 1px solid $ah-grey;
    &:first-of-type {
        text-align: left;
    }
}
.fa-circle-check {
  color: $ah-green;
}
.fa-circle-xmark {
  color: $ah-red;
}
.disabled {
    background-color: rgb(232, 232, 232);
    opacity: 0.5;
    cursor: not-allowed;
}

</style>