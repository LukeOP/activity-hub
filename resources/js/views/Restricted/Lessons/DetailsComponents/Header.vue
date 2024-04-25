<template>
<div>
  <HeaderLine :heading="heading" :school="lesson.school.name" 
  :link1="links.link1" @link1="handleClick"
  :link2="links.link2" @link2="handleClick"
  :link3="links.link3" @link3="handleClick" />
    <!-- <attendance-snapshot :lesson="lesson" /> -->
</div>
  
</template>

<script>
import { useRouter } from 'vue-router'
import { ref } from 'vue';
import AttendanceSnapshot from '../../Attendance/Components/AttendanceSnapshot.vue'
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
    studentStore.setStudent(props.lesson.student.id)
    const user = useUserStore()

    const heading = `${props.lesson.student.first_name} ${props.lesson.student.last_name}${getSIfNeeded()} ${props.lesson.attributes.instrument} Lessons`

    const links = ref({link1: '', link2: '', link3: ''})
    
    if(props.lesson.tutor.id == user.attributes.id){
      links.value.link1 = 'View Notes'
    }
    if(user.hasPermission('ATTENDANCE_R', props.lesson.school.id) || user.hasPermission('ATTENDANCE_V', props.lesson.school.id)){
      links.value.link2 = 'View Attendance'
    }
    if(user.hasPermission('STUDENTS_R', props.lesson.school.id) || user.hasPermission('STUDENTS_V', props.lesson.school.id)){
      links.value.link3 = 'View Student'
    }


    function getSIfNeeded(){
      return props.lesson.student.last_name.slice(-1) != "s" ? "'s" : "'"
    }

    function viewStudent(){
      studentStore.setStudent(props.lesson.student.id)
      router.push({ name: 'StudentDetails'})
    }

    function handleClick(value){
      let route = []
      if(value === 'link1') route = 'LessonNotes'
      if(value === 'link2') route = 'LessonAttendanceSingle'
      if(value === 'link3') route = 'StudentDetails'
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