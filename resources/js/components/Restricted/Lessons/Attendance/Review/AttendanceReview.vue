<template>
<div>
  <HeaderLine heading="Attendance Review" link1="Attendance Overview" @link1="routerChange" />

<!-- Table component -->
<section v-if="!loading && filteredLessons">
  <component :is="currentComponent" :lessons="filteredLessons" />
</section>
    
</div>
</template>

<script setup>
import { computed } from 'vue'
import useApi from '../../../../../composables/useApi'
import { useFilterStore } from '../../../../../stores/filter'
import ReviewTable from './ReviewTable.vue'
import { useWindowSize } from '/resources/js/composables/useWindowSize'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useRouter } from 'vue-router'
import ReviewTableMobile from './ReviewTableMobile.vue'

const { windowSize } = useWindowSize()
const router = useRouter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? ReviewTable : ReviewTableMobile
})

const filter = useFilterStore()
const { data: attendanceRecords, loading, fetchData } = useApi('lesson-attendance')
fetchData().then(()=>{
  filter.setType('AttendanceReviewForm')
  filter.setData(attendanceRecords.value)
})

const filteredLessons = computed(()=>{
  return Object.keys(filter.getReturned).length > 0 
  ? filter.getReturned 
  : attendanceRecords.value.data
})

function routerChange(){
  router.push({
    name: 'LessonAttendanceOverview'
  })
}


</script>

<style lang="scss" scoped>

</style>