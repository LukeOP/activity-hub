<template>
  <div v-if="invitations && invitations.length > 0">
    <h3 class="mt-5">Invitations Pending:</h3>
    <p>Awaiting user(s) to accept invitation to join {{currentSchool.name}}.</p>
     <table role="table" id="staff-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
          <th role="columnheader" @click="sortData('first_name')" style="width: 1%">Reference:</th>
          <th role="columnheader" @click="sortData('email')" style="width: 1%" >Email:</th>
          <th role="columnheader" style="width: 1%" >Invitation Sent:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="staff-data">
        <tr role="row" class="staff-row" v-for="invitation in invitations.data" :key="invitation.id">
          <td role="cell">{{invitation.reference}}</td>
          <td role="cell">{{invitation.email}}</td>
          <td role="cell">{{formatDate(invitation.created_at)}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import moment from 'moment'
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import useApi from '../../../../composables/useApi'
import useSorter from '../../../../composables/useSorter'
import { useSchoolStore } from '../../../../stores/schools'
import { useStaffStore } from '../../../../stores/staff'

const props = defineProps({school_id: String})
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()
const currentSchool = schoolStore.getSchool
const sorter = useSorter()
const router = useRouter()

const { data: invitations, fetchData: fetchInvites } = useApi('school-invitations/' + props.school_id)
fetchInvites().then(()=>{
  staffStore.setSchoolInvites(invitations.value.data)
})

function sortData(field){
  sorter.sort(staff.value, field)
}

function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}


  
</script>

<style lang="scss" scoped>
#staff-table {
    width:100%;
    // overflow-y: scroll;
    display: block;
    table-layout: fixed;
    border-bottom: 2px solid $ah-secondary;
    .table-heading {
      background-color: $ah-secondary;
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
        // &:hover {
        //   background-color: lighten($ah-primary, 60%);
        //   cursor: pointer;
        //   td {
        //     color: $ah-primary-dark;
        //   }
        // }
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