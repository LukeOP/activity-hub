<template>
<div>
  <!-- Header -->
  <HeaderLine heading="Lessons" link1="Attendance Data" link2="Lesson Requests" 
    @link1="changeRoute" @link2="changeRoute"/>

  <!-- Table component -->
  <section v-if="filteredLessons">
    <component :is="currentComponent" :lessons="filteredLessons" />
  </section>
</div>
</template>

<script setup>
import { computed, ref, shallowRef, watch } from 'vue'
 
import { useFilterStore } from '../../../stores/filter'
import useApi from '../../../composables/useApi'
import { useWindowSize } from '../../../composables/useWindowSize'

import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue'
import LessonsTable from './ListComponents/LessonsTable.vue'
import LessonsTableMobile from './ListComponents/LessonsTableMobile.vue'
import { useActionsStore } from '../../../stores/actions'
import { useLessonsStore } from '../../../stores/lessons'
import { useUserStore } from '@/stores/user'
import { useRouter } from 'vue-router'

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()
const user = useUserStore()

// Initiate Composables
const router = useRouter()
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? LessonsTable : LessonsTableMobile
})

// fetch lessons data from the database and add to store
const filteredLessons = ref([])
const {data:lessons, fetchData} = useApi('lessons')

fetchData().then(() => {
  filteredLessons.value = lessons.value
  lessonStore.setLessons(lessons.value)
  setTimeout(()=>{
    filter.setData(lessons.value)
    filter.setType('LessonsForm')
  },300)
})

// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('LESSONS_C')){
  actionArray.push({ header: 'Create New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'})
}
actions.setItems(actionArray)

// if(user.hasPermissionAny('ATTENDANCE_R') || user.hasPermission('ATTENDANCE_V')){
//   actionArray.push({ header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, icon: 'fa-solid fa-user-check', additional: true})
// }
// if(user.hasPermissionAny('LESSONS_REQ_R') || user.hasPermission('LESSONS_REQ_V')){
//   actionArray.push({ header: 'Lesson Requests', to: { name: 'LessonRequests' }, showSubItems: false, icon: 'fa-solid fa-square-plus'})
// }

// Check for update to filtered lessons and display to user
watch(() => filter.getReturned, (newValue) => {
  filteredLessons.value = newValue
})

function changeRoute(value){
  let newRoute = {}
  if(value === 'link1') newRoute = 'LessonAttendanceOverview'
  if(value === 'link2') newRoute = 'RequestsList'
  router.push({name: newRoute})
}

</script>