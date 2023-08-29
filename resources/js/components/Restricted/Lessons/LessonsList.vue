<template>
<div>
  <!-- Header -->
  <section class="row">
    <div class="col-12 col-md-8">
      <h1>Lessons:</h1>
    </div>
    <div class="col-12 col-md-4">
    </div>
  </section>

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

import LessonsTable from './ListComponents/LessonsTable.vue'
import LessonsTableMobile from './ListComponents/LessonsTableMobile.vue'
import { useActionsStore } from '../../../stores/actions'
import { useLessonsStore } from '../../../stores/lessons'

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()

// Initiate Composables
const windowSize = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? LessonsTable : LessonsTableMobile
})

// fetch lessons data from the database and add to store
const filteredLessons = ref([])
const {data:lessons, fetchData} = useApi('lessons')

fetchData().then(() => {
  filteredLessons.value = lessons.value
  filter.setData(lessons.value)
  filter.setType('LessonsForm')
  lessonStore.setLessons(lessons.value)
})


// Set side actions available on this page
const actionArray = [
  { header: 'Lesson Requests', to: { name: 'LessonRequests' }, showSubItems: false, icon: 'fa-solid fa-square-plus'},
  { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
  { header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
]
actions.setItems(actionArray)

// Check for update to filtered lessons and display to user
watch(() => filter.getReturned, (newValue) => {
  filteredLessons.value = newValue
})

</script>