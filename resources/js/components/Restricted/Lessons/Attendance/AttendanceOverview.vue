<template>
<div>
  <!-- <div id="heading">
    <h1 style="position:inline-block">Attendance Overview
    <i style="position:inline-block" class="fa-solid fa-calendar-days float-end" @click="router.push({name: 'LessonAttendanceReview'})"></i></h1>
  </div> -->
  
  <div v-for="subject in subjectArray" :key="subject">
    <div class="row mb-5 lesson-group" v-if="lessons">
      <h2 class="subjectHeading">{{subject}}</h2>
      <div class="col-12 col-md-4 col-sm-6" v-for="lesson in filteredLessons(subject)" :key="lesson">
        <AttendanceSnapshot class="snapShot"  :lesson="lesson" :heading="lesson.student.first_name + ' ' + lesson.student.last_name" @click="handleClick(lesson)"/>
      </div>
    </div>
  </div>

</div>
  
</template>

<script setup>
// Imports
import { onMounted, ref } from 'vue'
import useApi from '../../../../composables/useApi'
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'

// Components
import AttendanceSnapshot from './AttendanceSnapshot.vue'
import { useLessonsStore } from '../../../../stores/lessons'

// Variables
const router = useRouter()
const lessonStore = useLessonsStore()
const sorter = useSorter()
const {data: lessons, loading, fetchData} = useApi('lessons')
const subjectArray = ref([])

// Functions
function filteredLessons(type){
  let filtLessons = lessons.value.data.filter(l => l.attributes.instrument == type && l.attendance.length > 0)
  sorter.sort(filtLessons, 'student.last_name')
  return filtLessons
}

function handleClick(lesson){
  const { data: lessonData, fetchData} = useApi('lessons/' + lesson.id)
  fetchData().then(()=>{
    lessonStore.setLesson(lessonData.value.data)
    router.push({
      name: 'LessonAttendanceSingle',
      params: {
        id: lesson.id
      }
    })
  })
}

onMounted( async ()=>{
  await fetchData()
  subjectArray.value = Array.from(new Set(lessons.value.data.map(l => l.attributes.instrument)))
})

</script>

<style lang="scss" scoped>
.lesson-group {
  padding: 10px;
  // border: 2px solid $ah-grey;
  border-radius: 0.25rem;
  box-shadow: 0px 0px 5px $ah-grey;
  .subjectHeading {
    color: $ah-primary;
    border-bottom: 2px solid $ah-grey;
  }
  .snapShot {
    cursor: pointer;
  }
}

</style>