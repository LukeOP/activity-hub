<template>
<div class="row">
  <HeaderLine :heading="heading" :school="lesson.school.name" />
  <!-- <div class="col-12 col-md-9">
    <button class="btn btn-outline-primary" style="width: 150px;" @click="viewStudent">View Student</button>
  </div>
  <div class="d-none d-xl-block col-12 col-md-3"> -->
    <attendance-snapshot :lesson="lesson" />
  <!-- </div> -->
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

    function getSIfNeeded(){
      return props.lesson.student.last_name.slice(-1) != "s" ? "'s" : "'"
    }

    function viewStudent(){
      studentStore.setStudent(props.lesson.student)
      router.push({ name: 'StudentDetails'})
    }

    return {
      getSIfNeeded,
      viewStudent,
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