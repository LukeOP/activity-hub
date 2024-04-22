<template>
<div>
  <!-- Header -->
  <section class="row">
    <HeaderLine heading="Lesson Requests:" 
      link1="Current Lessons" @link1="routeChange('LessonsList')" 
      :link2="link2" @link2="routeChange('RequestFormsList')" />
  </section>

  <!-- Table component -->
  <section v-if="lessonStore.getRequests">
    <component :is="currentComponent" :requests="lessonStore.getRequests" :key="key" />
  </section>
  <LoadingSpinner :isLoading="lessonStore.getRequests.length < 1 && loading" :loadingText="true" color="primary" />
</div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue'
 
import { useFilterStore } from '../../../../stores/filter'
import useApi from '../../../../composables/useApi'
import { useWindowSize } from '../../../../composables/useWindowSize'

import RequestsTable from './ListComponents/RequestsTable.vue'
import RequestsTableMobile from './ListComponents/RequestsTableMobile.vue'
import { useActionsStore } from '../../../../stores/actions'
import { useLessonsStore } from '../../../../stores/lessons'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '/resources/js/stores/user'
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'
import { useSchoolStore } from '../../../../stores/schools'

const key = ref(0)

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()
const user = useUserStore()
const schoolStore = useSchoolStore()

// Initiate Composables
const { windowSize } = useWindowSize()
const router = useRouter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? RequestsTable : RequestsTableMobile
})

// fetch lessons data from the database and add to store
const filteredRequests = ref([])
const {data:lessons, loading, fetchData} = useApi('lesson-requests')


// Set side actions available on this page
const actionArray = [
  { header: 'Current Lessons', to: { name: 'LessonsList' }, showSubItems: false, icon: 'fa-solid fa-list'},
  { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
  { header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
]
actions.setItems(actionArray)

// Set User Permissions in Header
const link2 = computed(()=>{
  if(user.hasPermissionAny('LESSON_FRM_V'))
  return 'Requests Form'
})

// Check for update to filtered lessons and display to user
watch(() => filter.getReturned, (newValue) => {
  filteredRequests.value = newValue
})

// Handle Route Change
function routeChange(route){
  router.push({
    name: route
  })
}

onMounted(()=>{
  fetchData().then(() => {
    filteredRequests.value == lessons.value
    lessonStore.setRequests(lessons.value.data)
    key.value++
  })
})

</script>