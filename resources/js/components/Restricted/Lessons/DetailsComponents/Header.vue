<template>
<div>
  <HeaderLine :heading="heading" :school="lesson.school.name" :link1="links.link1" :link2="links.link2"
    @link1="handleClick" @link2="handleClick" />
    <!-- <attendance-snapshot :lesson="lesson" /> -->
</div>
  
</template>

<script>
import { useRouter } from 'vue-router'
import AttendanceSnapshot from '../Attendance/AttendanceSnapshot.vue'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useStudentStore } from '/resources/js/stores/students'
import { useUserStore } from '/resources/js/stores/user'
export default {
  components: {
    AttendanceSnapshot,
    HeaderLine,
  },
  props: {
    lesson: Object
  },
  setup(props){

    const router = useRouter()
    const studentStore = useStudentStore()
    const user = useUserStore()

    const heading = `${props.lesson.student.first_name} ${props.lesson.student.last_name}${getSIfNeeded()} ${props.lesson.attributes.instrument} Lessons`

    const links = {link1: 'View Notes', link2: 'View Attendance'}


    function getSIfNeeded(){
      return props.lesson.student.last_name.slice(-1) != "s" ? "'s" : "'"
    }

    function viewStudent(){
      studentStore.setStudent(props.lesson.student)
      router.push({ name: 'StudentDetails'})
    }

    function handleClick(value){
      let route = []
      if(value === 'link1') route = 'LessonNotes'
      if(value === 'link2') route = 'LessonAttendanceSingle'
      router.push({name: route})
    }

    return {
      getSIfNeeded,
      viewStudent,
      handleClick,
      links,
      user,
      heading
    }
  }

}
</script>

<style lang="scss" scoped>
.pending {
  color: $ah-secondary-dark;
}
.active {
  color: $ah-green;
}
.waiting {
  color: $ah-grey;
}
</style>