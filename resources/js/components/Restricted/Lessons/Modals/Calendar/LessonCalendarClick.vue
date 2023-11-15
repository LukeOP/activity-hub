<template>
  <HeaderLine heading="What would you like to do?" center="true" />
  <div class="options">

    <!-- Mark Attendance -->
    <div class="col-12 col-md-6 icon" @click="handleClick('LessonRecordAttendanceSingle')" v-if="!futureEvent && !attendanceRecorded()">
      <i class="fa-solid fa-user-check fa-8x mb-3"></i>
      <input type="button" value="Mark Attendance" class="btn btn-primary form-control">
    </div>

    <!-- Review Attendance -->
    <div class="col-12 col-md-6 icon" @click="handleClick('LessonRecordReviewAttendanceSingle')" v-else-if="!futureEvent && attendanceRecorded()">
      <i class="fa-solid fa-user-check fa-8x mb-3"></i>
      <input type="button" value="Review Attendance" class="btn btn-primary form-control">
    </div>

    <!-- View Lesson Details -->
    <div class="col-12 col-md-6 icon" @click="changeRoute({name: 'LessonDetails', params: {id: calendarData.lesson_id}})">
      <i class="fa-solid fa-graduation-cap fa-8x mb-3"></i>
      <input type="button" value="View Lesson Details" class="btn btn-primary form-control">
    </div>

    <!-- Write Lesson Notes -->
    <div class="col-12 col-md-6 icon" @click="handleClick('LessonCreateNote')" v-if="!futureEvent && attendanceRecorded()">
      <i class="fa-solid fa-pen-to-square fa-8x mb-3"></i>
      <input type="button" value="Write Lesson Notes" class="btn btn-primary form-control">
    </div>
  </div>
  

</template>

<script>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import ModalTemplate from '../../../../Layouts/MainLayout/Elements/Modal.vue'
import moment from 'moment'
import { useCalendarStore } from '../../../../../stores/calendar'
import { useModalStore } from '../../../../../stores/modal'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'

export default {
  components: {
    ModalTemplate,
    HeaderLine
},
  setup(){
    const router = useRouter()
    const calendar = useCalendarStore()
    const modal = useModalStore()
    const calendarData = calendar.getEventData

    // Checks click value and assigns route 'name' to direct user.
    function handleClick(click){
      modal.open(click)
    }

    // Check if clicked event is in the future.
    // return true if future event
    const futureEvent = computed(() => {
      let today = moment().format('YYYY MM DD')
      let event = moment(calendarData.dateTime).format('YYYY MM DD')
      if(event > today) return true
      return false
    })

    // Check if any attendance data has been recorded against this lesson on the clicked calendar date. 
    // Return true is attendance has not been recorded
    function attendanceRecorded() {
      if(calendarData.lesson.attendance.find(l => l.date == moment(calendarData.dateTime).format('YYYY-MM-DD'))){
        return true
      } else return false
    }

    // Set return route for 'close' click on modal
    const returnDetails = { name: 'Dashboard' }

    // function to change route
    function changeRoute(route){
      modal.close()
      router.push(route)
    }

    return {
      handleClick, returnDetails, futureEvent, 
      attendanceRecorded, changeRoute, calendarData
    }
  }

}
</script>

<style lang="scss" scoped>
h2 {
  text-align: center;
}
.options {
  display: flex;
  justify-content: space-around;
}
.icon {
  max-width: 150px;
  display: flex;
  align-items: center;
  flex-direction: column;
  &:hover{
    color: $ah-primary;
    cursor: pointer;
  }
}
</style>