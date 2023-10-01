<template>
  <div v-if="Object.keys(studentList).length > 0">
  <section id="table-header-section">
     <table>
      <thead>
        <tr>
          <th role="columnheader" @click="sortData('first_name')" style="width: 1%">First Name:</th>
          <th role="columnheader" @click="sortData('last_name')" style="width: 1%">Last Name:</th>
          <th role="columnheader" @click="sortData('school.name')" style="width: 1%">School:</th>
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
          <td role="cell">{{member.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>
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
</style>