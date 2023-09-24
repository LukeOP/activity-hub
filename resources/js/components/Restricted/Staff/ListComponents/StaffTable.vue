<template>
  <div v-if="staff">
     <table role="table" id="staff-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
          <th role="columnheader" @click="sortData('first_name')" style="width: 1%">First Name:</th>
          <th role="columnheader" @click="sortData('last_name')" style="width: 1%">Last Name:</th>
          <th role="columnheader" @click="sortData('email')" style="width: 1%" >Email:</th>
          <th role="columnheader" style="width: 1%" >Administrator:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="staff-data">
        <tr role="row" class="staff-row" v-for="member in staff" :key="member.id" @click="handleRowClick(member)">
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
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'
import { useStaffStore } from '../../../../stores/staff'

const props = defineProps({staff: Array})
const staffStore = useStaffStore()
const sorter = useSorter()
const router = useRouter()

function isAdmin(member){
  return member.permissions.find(m => m.type === 'administrator') ? 'Yes' : ''
}

function sortData(field){
  sorter.sort(staff.value, field)
}

function handleRowClick(staff){
  staffStore.setStaff(staff)
  // schoolStore.setSchool({name: staff.permissions[0].name, id: staff.permissions[0].school_id})
  router.push({
    name: 'StaffDetails',
  })
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
  @media (max-width: 768px){
    #staff-table {
      display: none;
    }
  }

</style>