<template>
  <div>
    <section v-if="staffStore.getStaffList">
      <component :is="StaffTableComponent" :staff="staffStore.getStaffList" />
    </section>
    <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />
  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useStaffStore } from '/resources/js/stores/staff';
import { computed, ref, watch } from 'vue';
import StaffTable from './StaffTable.vue';
import StaffTableMobile from './StaffTableMobile.vue';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useApi from '../../../../composables/useApi';
import { useSchoolStore } from '../../../../stores/schools';


// Initiate Stores
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const StaffTableComponent = computed(() => {
  return windowSize.value.width > 1030 ? StaffTable : StaffTableMobile
})

// Fetch school staff Invitations from database and add to store
const { data, loading, fetchData } = useApi('school-users/' + schoolStore.getSchool.id)
fetchData().then(()=>{
  staffStore.setStaffList(data.value.data)
})

// watch(()=> schoolStore.getSchool, () => {
//   fetchData().then(()=>{
//     staffStore.setStaffList(data.value)
//   })
// }, {deep: true})

</script>

<style lang="scss" scoped>

</style>