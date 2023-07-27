<template>
<modal-template-vue title="What would you like to do?" :push='returnDetails'>
  <span style="text-align:center; height:fit-content; background:blue">
    <form class="mt-3 row" style="padding:1rem">
      <div class="col-12 col-md-6 icon" @click="handleClick('Attendance')" v-if="!futureEvent && !attendanceRecorded()">
        <i class="fa-solid fa-user-check fa-8x mb-3"></i>
        <input type="button" value="Mark Attendance" class="btn btn-primary form-control">
      </div>

      <div class="col-12 col-md-6 icon" @click="handleClick('Review')" v-else-if="!futureEvent && attendanceRecorded()">
        <i class="fa-solid fa-user-check fa-8x mb-3"></i>
        <input type="button" value="Review Attendance" class="btn btn-primary form-control">
      </div>

      <div class="col-12 col-md-6 icon" @click="handleClick('Details')">
        <i class="fa-solid fa-graduation-cap fa-8x mb-3"></i>
        <input type="button" value="View Lesson Details" class="btn btn-primary form-control">
      </div>
    </form>
  </span>
</modal-template-vue>

</template>

<script>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import ModalTemplateVue from '../../../ModalTemplate.vue'
import moment from 'moment'
import { useCalendarStore } from '../../../../stores/calendar'

export default {
  components: {
    ModalTemplateVue
  },
  setup(){
    const router = useRouter()
    const calendar = useCalendarStore()
    const calendarData = calendar.getEventData

    // Checks click value and assigns route 'name' to direct user.
    function handleClick(click){
      if(click === 'Attendance') changeRoute({name: 'LessonRecordAttendanceSingle',})
      if(click === 'Review') changeRoute({name: 'LessonRecordReviewAttendanceSingle'})
      if(click === 'Details') changeRoute({name: 'LessonDetails', params: {id: calendarData.lesson_id}})
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
    const returnDetails = { name: 'YourDay' }

    // function to change route
    function changeRoute(route){
        router.push(route)
    }

    return {
      handleClick, returnDetails, futureEvent, 
      attendanceRecorded
    }
  }

}
</script>

<style lang="scss" scoped>
.icon {
  cursor: pointer;
  margin: auto;

  &:hover {
    color: $ah-primary;
  }
}
</style>