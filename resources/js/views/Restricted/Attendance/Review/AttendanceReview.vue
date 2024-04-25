<template>
<div>
  <HeaderLine heading="Attendance Review" link1="Attendance Overview" @link1="routerChange" />

<!-- Table component -->
<section v-if="filter.getReturned">
  <component :is="currentComponent" :lessons="filter.getReturned" v-if="!loading" :key="key" />
</section>
<LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />
    
</div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import useApi from '../../../../composables/useApi'
import { useFilterStore } from '../../../../stores/filter'
import { useLessonsStore } from '../../../../stores/lessons'
import ReviewTable from './ReviewTable.vue'
import { useWindowSize } from '/resources/js/composables/useWindowSize'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useRouter } from 'vue-router'
import ReviewTableMobile from './ReviewTableMobile.vue'
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'
import useSorter from '../../../../composables/useSorter'

const { windowSize } = useWindowSize()
const router = useRouter()
const key = ref(0)
const lessonStore = useLessonsStore()
const filter = useFilterStore()
const sorter = useSorter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? ReviewTable : ReviewTableMobile
})

const { data: attendanceRecords, loading, fetchData } = useApi('lesson-attendance')
fetchData().then(()=>{
  sorter.sort(attendanceRecords.value, 'time')
  lessonStore.setAttendanceArray(attendanceRecords.value)
  filter.setType('AttendanceReviewForm')
  filter.setData(lessonStore.getAttendanceArray)
  key.value++
})


watch(() => lessonStore.getAttendanceArray, () => {

})

function routerChange(){
  router.push({
    name: 'LessonAttendanceOverview'
  })
}


</script>

<style lang="scss" scoped>

</style>