<template>
  <h2 class="text-items:center">Editing Attendance</h2>
  <form style="padding:1rem" @submit.prevent="submitRecord">
    <div class="row">
      <div class="heading">{{lesson.student.full_name}}</div>
      <div class="col-12 col-md-4">
        <label for="date">Lesson date:</label>
        <input type="date" id="date" class="form-control" required :max="today" v-model="attendanceData.attendance.date">
      </div>
      <div class="col-12 col-md-4">
        <label for="time">Lesson start time:</label>
        <input type="time" id="time" class="form-control" required v-model="attendanceData.attendance.time">
      </div>
      <div class="col-12 col-md-4">
        <label for="attendance">Attendance:</label>
        <select id="attendance" v-model="attendanceData.attendance.attendance" class="form-control" :class="attendanceData.attendance">
          <option value="present">Present</option>
          <option value="late">Late</option>
          <option value="absent">Absent</option>
          <option value="custom">Alternative date/time</option>
        </select>
      </div>
    </div>
    <div class="content-align:center; mt-4">
      <input type="submit" id="submit" class="btn btn-primary form-control" value="Confirm Attendance">
    </div>
  </form>

</template>

<script setup>
import moment from 'moment'
import axiosClient from '../../../../../axios'
import { ref } from 'vue'
import { useCalendarStore } from '../../../../../stores/calendar'
import { useModalStore } from '/resources/js/stores/modal'
import { useToastStore } from '/resources/js/stores/toast'

const modal = useModalStore()
const calendar = useCalendarStore()
const currentCalendar = calendar.getEventData
const toast = useToastStore()
  
const lesson = currentCalendar.lesson
const today = moment().format('YYYY-MM-DD')
const attendance = lesson.attendance.find(l => l.date == moment(currentCalendar.dateTime).format('YYYY-MM-DD'))

const attendanceData = ref({
  attendance: attendance,
})

function submitRecord(){
  axiosClient.patch('/lesson-attendance/' + attendance.id, attendanceData.value.attendance).then(res => {
    calendar.updateAttendanceRecord(res.data.lesson)
    toast.open('success', 'Record Changed', 'Lesson record has been updated')
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
.heading {
  font-size: 1.5rem;
  text-align:center; 
}
.lineThrough {
  text-decoration: line-through;
}
.present {
  background-color: $ah-green;
  color: white;
}
.late {
  background-color: darken($ah-grey, 10%);
  color: white;
}
.absent {
  background-color: $ah-primary;
  color: white;
}
</style>