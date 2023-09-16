<template>
<div class="row">
  <div class="col-12 col-md-9">
    <h1>{{lesson.student.first_name}} {{lesson.student.last_name}}'{{getSIfNeeded()}} {{lesson.attributes.instrument}} Lessons - 
      <span v-if="user.hasPermission('STUDENT_V', lesson.school.id)" :class="lesson.attributes.status.toLowerCase()">{{lesson.attributes.status}}</span>
    </h1>
    <button class="btn btn-outline-primary" style="width: 150px;" @click="viewStudent">View Student</button>
  </div>
  <div class="d-none d-xl-block col-12 col-md-3">
    <attendance-snapshot :lesson="lesson" />
  </div>
</div>
  
</template>

<script>
import { useRouter } from 'vue-router'
import AttendanceSnapshot from '../Attendance/AttendanceSnapshot.vue'
import { useStudentStore } from '/resources/js/stores/students'
import { useUserStore } from '/resources/js/stores/user'
export default {
  components: {
    AttendanceSnapshot
  },
  props: {
    lesson: Object
  },
  setup(props){

    const router = useRouter()
    const studentStore = useStudentStore()
    const user = useUserStore()

    function getSIfNeeded(){
      if(props.lesson.student.last_name.slice(-1) != 's') return 's'
    }

    function viewStudent(){
      studentStore.setStudent(props.lesson.student)
      router.push({ name: 'StudentDetails'})
    }

    return {
      getSIfNeeded,
      viewStudent,
      user
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