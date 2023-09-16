<template>
  <div v-if="Object.keys(studentList).length > 0">
     <table role="table" id="student-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
          <th role="columnheader" @click="sortData('first_name')" style="width: 1%">First Name:</th>
          <th role="columnheader" @click="sortData('last_name')" style="width: 1%">Last Name:</th>
          <th role="columnheader" @click="sortData('school.name')" style="width: 1%">School:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="student-data">
        <tr role="row" class="student-row" v-for="member in studentList" :key="member.id" @click="handleRowClick(member)">
          <td role="cell">{{member.first_name}}</td>
          <td role="cell">{{member.last_name}}</td>
          <td role="cell">{{member.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import useSorter from '/resources/js/composables/useSorter';
import { useStudentStore } from '/resources/js/stores/students';
import { computed } from 'vue';
const sorter = useSorter()
const router = useRouter()
const studentStore = useStudentStore()

const studentList = computed(()=>{
  return studentStore.getFilteredStudents
})

function sortData(field){
  sorter.sort(studentList.value, field)
}

function handleRowClick(member){
  studentStore.setStudent(member)
  router.push({ name: 'StudentDetails'})
}


</script>

<style lang="scss" scoped>
#student-table {
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
        cursor: pointer;
      }
    }
    #student-data{
      .student-row {
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
    #student-table {
      display: none;
    }
  }

</style>