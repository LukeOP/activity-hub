<template>
<div>
  <section class="row">
      <h1>Lessons:</h1>
      
  </section>

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

 
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()
const windowSize = useWindowSize()

const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? LessonsTable : LessonsTableMobile
})

const filteredLessons = ref([])
const {data:lessons, fetchData} = useApi('lessons')

fetchData().then(() => {
  filteredLessons.value = lessons.value.data
  filter.setType('LessonsForm')
  filter.setData(lessons.value.data)
  lessonStore.setLessons(lessons.value.data)
})

const actionArray = [
  { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
  { header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
]
actions.setItems(actionArray)

watch(() => filter.getReturned, (newValue) => {
  filteredLessons.value = newValue
})

</script>