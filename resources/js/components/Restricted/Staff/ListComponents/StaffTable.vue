<template>
  <div v-if="staff">
     <table role="table" id="staff-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
          <th role="columnheader" @click="sortData('student.first_name')" style="width: 1%">First Name:</th>
          <th role="columnheader" @click="sortData('student.last_name')" style="width: 1%">Last Name:</th>
          <th role="columnheader" @click="sortData('tutor.last_name')" style="width: 1%" >Email:</th>
          <!-- <th role="columnheader" @click="sortData('tutor.last_name')" style="width: 1%" >Lessons Assigned:</th> -->
          <th role="columnheader" @click="sortData('tutor.last_name')" style="width: 1%" >Administrator:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="staff-data">
        <tr role="row" class="staff-row" v-for="member in staff" :key="member.id">
          <td role="cell">{{member.first_name}}</td>
          <td role="cell">{{member.last_name}}</td>
          <td role="cell">{{member.email}}</td>
          <td role="cell">{{isAdmin(member)}}</td>
        </tr>
      </tbody>
    </table>
    <div>
      <span class="tally">Total Staff: {{staff.length}}</span>
    </div>
  </div>
</template>

<script setup>
import { computed, watchEffect } from 'vue'
import useApi from '../../../../composables/useApi'
import { useStaffStore } from '../../../../stores/staff'

const props = defineProps({school_id: String})
const staffStore = useStaffStore()

const { data: staff, fetchData: fetchStaff } = useApi('school-users/' + props.school_id)
fetchStaff().then(()=>{
  staffStore.setStaffList(staff.value)
})

function isAdmin(member){
  return member.permissions.find(m => m.type === 'administrator') ? 'Yes' : ''
}


  
</script>

<style lang="scss" scoped>
#staff-table {
    width:100%;
    // overflow-y: scroll;
    display: block;
    table-layout: fixed;
    border-bottom: 2px solid $ah-primary;
    .table-heading {
      background-color: $ah-primary;
      color: white;
      border-radius: 10px 10px 0 0;
      th {
        padding: 10px;
        width: auto;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
    }
    #staff-data{
      .staff-row {
        border-bottom: thin solid rgb(209, 209, 209);
        td {
          padding: 10px;
          width: auto;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          .special {
            display: table;
            padding: 10px 10px;
            border-radius: 15px;
            width: 73px;
            text-align: center;
          }
        }
        &:hover {
          background-color: lighten($ah-primary, 60%);
          cursor: pointer;
          td {
            color: $ah-primary-dark;
          }
        }
      }
    }
  }
  .tally {
    margin-right: 2rem;
  }
  thead, tbody, tfoot, tr, td, th {
    width: 100%;
  }

</style>