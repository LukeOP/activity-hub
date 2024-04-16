<template>
  <div v-if="staff">
    <table>
      <thead>
        <tr>
          <th style="width: 60px;"></th>
          <th @click="sortData('first_name')" >First Name:</th>
          <th @click="sortData('last_name')" >Last Name:</th>
          <th @click="sortData('email')"  >Email:</th>
          <th @click="sortData('email')"  >Position:</th>
          <th>Administrator:</th>
        </tr>
      </thead>
      <tbody>
        <tr class="staff-row" v-for="member in staff" :key="member.id" @click="handleRowClick(member)">
          <td style="width: 60px;"><Avatar :user="{attributes: member}" /></td>
          <td>{{member.first_name}}</td>
          <td>{{member.last_name}}</td>
          <td>{{member.email}}</td>
          <td>{{member.position.title}}</td>
          <td>{{isAdmin(member)}}</td>
        </tr>
      </tbody>
    </table>

  <div class="col-12 col-md-4 totals">
    <span>Total Staff: {{ staff.length }}</span>
  </div>

  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'
import { useStaffStore } from '../../../../stores/staff'
import Avatar from '../../../../components/Layouts/MainLayout/Elements/Avatars/Avatar.vue';

const props = defineProps({staff: Array})
const staffStore = useStaffStore()
const sorter = useSorter()
const router = useRouter()

function isAdmin(member){
  return member.permissions.find(p => p.type === 'Administrator') ? 'Yes' : ''
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