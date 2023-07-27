<template>
<modal-template-vue title="Review Lesson Attendance" :push='returnDetails' v-if="lesson != null">
  <span style="height:fit-content; background:blue">
    <form style="padding:1rem" @submit.prevent="submitRecord">
      <div class="row">
        <div class="heading">{{lesson.student.first_name}} {{lesson.student.last_name}}</div>
        <div class="col-12 col-md-4">
          <label for="date">Lesson date:</label>
          <input type="date" id="date" class="form-control" required :max="today" v-model="attendanceData.date">
        </div>
        <div class="col-12 col-md-4">
          <label for="time">Lesson start time:</label>
          <input type="time" id="time" class="form-control" required v-model="attendanceData.time">
        </div>
        <div class="col-12 col-md-4">
          <label for="attendance">Attendance:</label>
          <select id="attendance" v-model="attendanceData.attendance" class="form-control" :class="attendanceData.attendance">
            <option value="present">Present</option>
            <option value="late">Late</option>
            <option value="absent">Absent</option>
            <option value="custom">Alternative date/time</option>
          </select>
        </div>
        <div class="col-12 col-md-4">
          <label for="submit">Confirm:</label>
          <input type="submit" id="submit" class="btn btn-primary form-control" value="Confirm Attendance">
        </div>
      </div>
    </form>
  </span>
</modal-template-vue>

</template>

<script setup>
import { useRouter } from 'vue-router'
import ModalTemplateVue from '../../../ModalTemplate.vue'
import moment from 'moment'
import axiosClient from '../../../../axios'
import { ref } from 'vue'
import { useCalendarStore } from '../../../../stores/calendar'

const router = useRouter()
const calendar = useCalendarStore()
const currentCalendar = calendar.getEventData
  
const lesson = currentCalendar.lesson
const today = moment().format('YYYY-MM-DD')
const attendance = lesson.attendance.find(l => l.date == moment(currentCalendar.dateTime).format('YYYY-MM-DD'))

const attendanceData = ref({
  attendance: attendance.attendance,
  date: attendance.date,
  time: attendance.time,
})

const returnDetails = { name: 'YourDay' }

function submitRecord(){
  axiosClient.patch('/lessonAttendance/' + attendance.id, attendanceData.value).then(res => {
    calendar.updateAttendanceRecord(res.data.lesson)
    router.push(returnDetails)
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