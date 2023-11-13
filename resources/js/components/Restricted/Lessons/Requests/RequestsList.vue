<template>
<div>
  <!-- Header -->
  <section class="row">
    <HeaderLine heading="Lesson Requests:" 
      link1="Current Lessons" @link1="routeChange('LessonsList')" 
      link2="Requests Form" @link2="routeChange('RequestFormsList')" />
  </section>

  <!-- Table component -->
  <section v-if="filteredRequests">
    <component :is="currentComponent" :requests="filteredRequests" :key="key" />
  </section>
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

const key = ref(0)

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()

// Initiate Composables
const { windowSize } = useWindowSize()
const router = useRouter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? RequestsTable : RequestsTableMobile
})

// fetch lessons data from the database and add to store
const filteredRequests = ref([])
const {data:lessons, fetchData} = useApi('lesson-requests')


// Set side actions available on this page
const actionArray = [
  { header: 'Current Lessons', to: { name: 'LessonsList' }, showSubItems: false, icon: 'fa-solid fa-list'},
  { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
  { header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
]
actions.setItems(actionArray)

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
    filteredRequests.value = lessons.value
    lessonStore.setLessons(lessons.value)
    key.value++
  })
})

</script>