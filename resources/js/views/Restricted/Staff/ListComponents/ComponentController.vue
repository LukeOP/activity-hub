<template>
  <div>
    <section v-if="staffStore.getStaffList && !staffStore.loading">
      <component :is="StaffTableComponent" :staff="staffStore.getStaffList" />
    </section>
    <LoadingSpinner :isLoading="staffStore.loading" :loadingText="true" color="primary" />
  </div>
</template>

<script setup>
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useStaffStore } from '/resources/js/stores/staff';
import { computed, ref } from 'vue';
import StaffTable from './StaffTable.vue';
import StaffTableMobile from './StaffTableMobile.vue';
import { useSchoolStore } from '/resources/js/stores/schools';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';


// Initiate Stores
const staffStore = useStaffStore()
const schoolStore = useSchoolStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const StaffTableComponent = computed(() => {
  return windowSize.value.width > 1030 ? StaffTable : StaffTableMobile
})


</script>

<style lang="scss" scoped>

</style>