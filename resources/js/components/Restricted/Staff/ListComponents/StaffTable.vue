<template>
  <div v-if="staff">
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('first_name')" style="width: 1%">First Name:</th>
          <th @click="sortData('last_name')" style="width: 1%">Last Name:</th>
          <th @click="sortData('email')" style="width: 1%" >Email:</th>
          <th style="width: 1%" >Administrator:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr role="row" class="staff-row" v-for="member in staff" :key="member.id" @click="handleRowClick(member)">
          <td role="cell">{{member.first_name}}</td>
          <td role="cell">{{member.last_name}}</td>
          <td role="cell">{{member.email}}</td>
          <td role="cell">{{isAdmin(member)}}</td>
        </tr>
      </tbody>
    </table>
  </section>

  <div class="col-12 col-md-4 totals">
    <span>Total Staff: {{ staff.length }}</span>
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
  router.push({
    name: 'StaffDetails',
  })
}

</script>

<style lang="scss" scoped>

</style>