<template>
<div>
  <!-- Header -->
  <section class="row">
    <div class="col-12 col-md-8">
      <h1>Lesson Requests:</h1>
    </div>
    <div class="col-12 col-md-4">
    </div>
  </section>

  <!-- Table component -->
  <section v-if="filteredRequests">
    <component :is="currentComponent" :requests="filteredRequests" />
  </section>
</div>
</template>

<script setup>
import { computed, onMounted, ref, shallowRef, watch } from 'vue'
 
import { useFilterStore } from '../../../../stores/filter'
import useApi from '../../../../composables/useApi'
import { useWindowSize } from '../../../../composables/useWindowSize'

import RequestsTable from './RequestsTable.vue'
import RequestsTableMobile from './RequestsTableMobile.vue'
import { useActionsStore } from '../../../../stores/actions'
import { useLessonsStore } from '../../../../stores/lessons'

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()

// Initiate Composables
const windowSize = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? RequestsTable : RequestsTableMobile
})

// fetch lessons data from the database and add to store
const filteredRequests = ref([])
const {data:lessons, fetchData} = useApi('lesson-requests')

onMounted(()=>{
  fetchData().then(() => {
    filteredRequests.value = lessons.value.data
    lessonStore.setLessons(lessons.value.data)
  })
})



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

</script>