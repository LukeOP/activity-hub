<template>
<div class="row">
  <div class="col-12 col-md-9">
    <h1>{{lesson.student.first_name}} {{lesson.student.last_name}}'{{getSIfNeeded()}} {{lesson.attributes.instrument}} Lessons - 
      <span :class="lesson.attributes.status.toLowerCase()">{{lesson.attributes.status}}</span>
    </h1>
  </div>
  <div class="d-none d-xl-block col-12 col-md-3">
    <attendance-snapshot :lesson="lesson" />
  </div>
</div>
  
</template>

<script>
import AttendanceSnapshot from '../Attendance/AttendanceSnapshot.vue'
export default {
  components: {
    AttendanceSnapshot
  },
  props: {
    lesson: Object
  },
  setup(props){

    function getSIfNeeded(){
      if(props.lesson.student.last_name.slice(-1) != 's') return 's'
    }

    return {
      getSIfNeeded,
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