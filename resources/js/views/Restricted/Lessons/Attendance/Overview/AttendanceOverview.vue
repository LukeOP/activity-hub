<template>
<div>
  <HeaderLine heading="Attendance Overview" link1="Lesson List" @link1="routeChange('LessonsList')" link2="Attendance Review" @link2="routeChange('LessonAttendanceReview')" />
  
  <div v-for="subject in subjectArray" :key="subject">
    <div class="row mb-2 lesson-group">
      <h2 class="subjectHeading">{{subject}}</h2>
      <div class="col-12 col-md-4 col-sm-6" v-for="lesson in filteredLessons(subject)" :key="lesson">
        <!-- {{ lesson }} -->
        <AttendanceSnapshot class="snapShot" :lesson="lesson" :heading="lesson.student.full_name" :stats="true" @click="handleClick(lesson)"/>
      </div>
    </div>
  </div>

</div>
  
</template>

<script setup>
// Imports
import { ref } from 'vue'
import useApi from '../../../../../composables/useApi'
import { useRouter } from 'vue-router'
import useSorter from '../../../../../composables/useSorter'
import { useLessonsStore } from '../../../../../stores/lessons'

// Components
import AttendanceSnapshot from './../Components/AttendanceSnapshot.vue'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'

// Variables
const router = useRouter()
const lessonStore = useLessonsStore()
const sorter = useSorter()
const subjectArray = ref(Array.from(new Set(lessonStore.getLessonsData.map(l => l.attributes.instrument))))

// Functions
function filteredLessons(type){
  let filtLessons = lessonStore.getLessonsData.filter(l => l.attributes.instrument == type && l.attendance.length > 0)
  sorter.sort(filtLessons, 'student.last_name')
  return filtLessons
}

function handleClick(lesson){
  const { data: lessonData, loading, fetchData} = useApi('lessons/' + lesson.id)
  fetchData().then(()=>{
    lessonStore.setLesson(lessonData.value)
    router.push({
      name: 'LessonAttendanceSingle'
    })
  })
}

function routeChange(route){
  router.push({
    name: route
  })
}


</script>

<style lang="scss" scoped>
.lesson-group {
  padding: 10px;
  border-radius: 0.25rem;
  .subjectHeading {
    color: $ah-primary;
    border-top: 1px dashed $ah-primary;
    padding-top: 10px;
  }
  .snapShot {
    cursor: pointer;
    padding: 10px;
    &:hover {
      box-shadow: 0 0 10px $ah-grey;
      border-radius: 0.375rem;
    }
  }
}

</style>