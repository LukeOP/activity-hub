<template>
<div>
  <!-- Header -->
  <HeaderLine heading="Lessons" :link1="link1" :link2="link2" :link3="link3" 
    @link1="changeRoute" @link2="changeRoute" @link3="changeRoute"/>
  <div class="col col-12 col-md-6">
    <!-- Search input -->
    <input type="text" class="form-control mb-2" placeholder="Lesson search..." v-model="search">
  </div>

  <!-- Table component -->
  <section v-if="filteredLessons">
    <component :is="currentComponent" :lessons="filteredLessons" />
  </section>
  <LoadingSpinner :isLoading="filteredLessons.length < 1 && loading" :loadingText="true" color="primary" />
</div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue'
 
import { useFilterStore } from '../../../stores/filter'
import useApi from '../../../composables/useApi'
import { useWindowSize } from '../../../composables/useWindowSize'

import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import LessonsTable from './ListComponents/LessonsTable.vue'
import LessonsTableMobile from './ListComponents/LessonsTableMobile.vue'
import { useActionsStore } from '../../../stores/actions'
import { useLessonsStore } from '../../../stores/lessons'
import { useUserStore } from '@/stores/user'
import { useRouter } from 'vue-router'
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'

//  Initiate Stores
const filter = useFilterStore()
const lessonStore = useLessonsStore()
const actions = useActionsStore()
const user = useUserStore()

// Initiate Composables
const router = useRouter()
const { windowSize } = useWindowSize()

const loading = ref(false)

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? LessonsTable : LessonsTableMobile
})

// fetch lessons data from the database and add to store
// const filteredLessons = ref([])
const {data:lessons, fetchData} = useApi('lessons')

// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('LESSONS_C')){
  actionArray.push({ header: 'Create New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'})
}
actions.setItems(actionArray)

// Set User Permissions in Header
const link1 = computed(()=>{
  return 'Lesson Planner'
})
const link2 = computed(()=>{
  if(user.hasPermissionAny('ATTENDANCE_V') || user.hasPermissionAny('ATTENDANCE_R'))
  return 'Attendance Data'
})
const link3 = computed(()=>{
  if(user.hasPermissionAny('LESSON_REQ_V'))
  return 'Lesson Requests'
})

// Initiate search variable
const search = ref('')

// Returns array of students based on search term, stores array in student Store
const filteredLessons = computed(() => {
  let searchTerm = search.value.toLowerCase();
  const filterFunction = l => {
    const attributes = l.attributes || {}; // Handle null attributes
    const fundingType = attributes.funding_type || ''; // Handle null funding_type
    const day = attributes.day || ''; // Handle null day
    const start = attributes.start || ''; // Handle null day

    return (
      l.student.full_name.toLowerCase().includes(searchTerm) ||
      (day && day.toLowerCase().includes(searchTerm)) ||
      (start && start.includes(searchTerm)) ||
      l.attributes.instrument.toLowerCase().includes(searchTerm) ||
      (fundingType && fundingType.toLowerCase().includes(searchTerm)) || 
      l.attributes.status.toLowerCase().includes(searchTerm) ||
      l.school.name.toLowerCase().includes(searchTerm) ||
      l.school.room.toLowerCase().includes(searchTerm) ||
      l.tutor.full_name.toLowerCase().includes(searchTerm)
    );
  };

  const filtered = searchTerm.length > 0
    ? filter.getReturned.filter(filterFunction)
    : filter.getReturned;

  lessonStore.setFilteredLessons(filtered);
  return filtered;
});

// Check for update to filtered lessons and display to user
// watch(() => filter.getReturned, (newValue) => {
//   if(newValue.length != 0){
//     filteredLessons.value = newValue
//   }
// })

function changeRoute(value){
  let newRoute = {}
  if(value === 'link1') newRoute = 'LessonPlanner'
  if(value === 'link2') newRoute = 'LessonAttendanceOverview'
  if(value === 'link3') newRoute = 'RequestsList'
  router.push({name: newRoute})
}

onMounted(() => {  
  loading.value = true
  filter.open('LessonsForm', lessonStore.getLessonsData)
  fetchData().then(() => {
    if(lessons.value.data != lessonStore.getLessonsData){
      filter.setData(lessonStore.getLessonsData)
      lessonStore.setLessons(lessons.value.data)
    }
    loading.value = false
  })
})

</script>