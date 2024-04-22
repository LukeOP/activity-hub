<template>
  <div v-if="lesson.student">
    <HeaderLine :heading="lesson.student.full_name + `'s Attendance:`" :school="lesson.attributes.funding_type + ' ' +lesson.attributes.instrument + ' lessons with ' + lesson.tutor.full_name"
      :link1="link1" @link1="routeChange({name: 'LessonAttendanceOverview'})"
      :link2="link2" @link2="routeChange({name: 'LessonDetails'})"/>
    
    <div class="row mb-4">
      <div class="col col-12 col-sm-4">
        <AttendanceSnapshot :lesson="lesson" heading="Overall Attendance" :stats="true" />
      </div>
    </div>

    <div class="row">
      <AttendanceTable :lesson="lesson"/>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import AttendanceSnapshot from '../Components/AttendanceSnapshot.vue'
import AttendanceTable from './AttendanceTable.vue'
import { useRouter } from 'vue-router'
import { useLessonsStore } from '../../../../stores/lessons'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useUserStore } from '/resources/js/stores/user'

const lessonStore = useLessonsStore()
const user = useUserStore()
const router = useRouter()

const lesson = lessonStore.getLessonData
// lessonStore.setAttendanceArray(lesson.attendance)

// Set User Permissions in Header
const link1 = computed(()=>{
  if(user.hasPermissionAny('ATTENDANCE_V') || user.hasPermissionAny('ATTENDANCE_R'))
  return 'Attendance Data'
})
const link2 = computed(()=>{
  if(user.hasPermissionAny('LESSONS_V') || user.hasPermissionAny('LESSONS_R'))
  return 'Lesson Details'
})

function routeChange(path){
  router.push(path)
}
</script>

<style lang="scss" scoped>
#lesson-heading {
  border-bottom: 2px solid $ah-primary;
}
#detailsBtn {
  max-width: fit-content;
}

</style>