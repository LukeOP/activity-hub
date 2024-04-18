<template>
  <div v-if="Object.keys(studentList).length > 0">
  <section id="table-header-section">
     <table>
      <thead>
        <tr>
          <th role="columnheader" @click="sortData('first_name')" style="width: 1%">First Name:</th>
          <th role="columnheader" @click="sortData('last_name')" style="width: 1%">Last Name:</th>
          <th role="columnheader" @click="sortData('tutor_group')" style="width: 1%">Year Level:</th>
          <th role="columnheader" @click="sortData('year_level')" style="width: 1%">Tutor Group:</th>
          <th role="columnheader" @click="sortData('school.name')" style="width: 1%" v-if="user.getSchools.length > 1">School:</th>
        </tr>
      </thead>
     </table>
  </section>
  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="member in studentList" :key="member.id" @click="handleRowClick(member)">
          <td role="cell">{{member.first_name}}</td>
          <td role="cell">{{member.last_name}}</td>
          <td role="cell">{{member.year_level}}</td>
          <td role="cell">{{member.tutor_group}}</td>
          <td role="cell" v-if="user.getSchools.length > 1">{{member.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>

  <div class="col-12 col-md-4 totals">
    <span>Displaying: {{getNum('filtered')}}/{{getNum('total')}}</span>
  </div>

  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import useSorter from '/resources/js/composables/useSorter';
import { useStudentStore } from '/resources/js/stores/students';
import { computed } from 'vue';
import { useUserStore } from '../../../../stores/user';
const sorter = useSorter()
const router = useRouter()
const studentStore = useStudentStore()
const user = useUserStore()

const studentList = computed(()=>{
  return studentStore.getFilteredStudents
})

function getNum(type){
  if(type === 'filtered'){
    return studentStore.getFilteredStudents.length
  }
  if(type === 'total'){
    return studentStore.getStudents.length
  }
  return studentStore.getStudents.length
}

function sortData(field){
  sorter.sort(studentList.value, field)
}

function handleRowClick(member){
  studentStore.setStudent(member.id)
  router.push({ name: 'StudentDetails'})
}


</script>

<style lang="scss" scoped>
</style>