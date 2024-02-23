<template>
  <div>
    <section v-if="staff && !loading">
      <component :is="StaffTableComponent" :staff="staff" />
    </section>
    <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />
  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useStaffStore } from '/resources/js/stores/staff';
import { computed, ref } from 'vue';
import StaffTable from './StaffTable.vue';
import StaffTableMobile from './StaffTableMobile.vue';
import useApi from '/resources/js/composables/useApi';
import { useSchoolStore } from '/resources/js/stores/schools';
import LoadingSpinner from '../../../Layouts/MainLayout/Elements/LoadingSpinner.vue';


// Initiate Stores
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const StaffTableComponent = computed(() => {
  return windowSize.value.width > 1030 ? StaffTable : StaffTableMobile
})

// Fetch school staff from database and add to store
const { data: staff, loading, fetchData: fetchStaff } = useApi('school-users/' + schoolStore.getSchool.id)
fetchStaff().then(() => {
  staffStore.setStaffList(staff.value)
})


</script>

<style lang="scss" scoped>

</style>