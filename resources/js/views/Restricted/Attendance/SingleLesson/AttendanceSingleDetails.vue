<template>
  <div v-if="lesson.student">
    <HeaderLine :heading="lesson.student.full_name + `'s Attendance:`" :school="lesson.attributes.funding_type + ' ' +lesson.attributes.instrument + ' lessons with ' + lesson.tutor.full_name"
      :link1="link1" @link1="routeChange({name: 'LessonAttendanceOverview'})"
      :link2="link2" @link2="routeChange({name: 'LessonDetails'})"/>

    <!-- <div class="row">
      <AttendanceTable :lesson="lesson"/>
    </div> -->
    <!-- Table component -->
    <section>
      <component :is="currentComponent" />
    </section>
  </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import AttendanceSnapshot from '../Components/AttendanceSnapshot.vue'
import AttendanceTable from './AttendanceTable.vue'
import AttendanceTableMobile from './AttendanceTableMobile.vue'
import { useRouter } from 'vue-router'
import { useLessonsStore } from '../../../../stores/lessons'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useUserStore } from '/resources/js/stores/user'
import { useWindowSize } from '../../../../composables/useWindowSize'

const { windowSize } = useWindowSize()
const lessonStore = useLessonsStore()
const user = useUserStore()
const router = useRouter()

const lesson = lessonStore.getLessonData

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? AttendanceTable : AttendanceTableMobile
})

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