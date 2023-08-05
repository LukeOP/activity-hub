<template>
<ModalTemplate :modalActive="true">

</ModalTemplate>
<!-- <modal-template-vue title="Record Lesson Attendance" :push='returnDetails' v-if="lesson != null">
  <span style="height:fit-content; background:blue">
    <form style="padding:1rem" @submit.prevent="handleClick('custom')">
      <div class="row">
        <div class="heading">{{lesson.student.first_name}} {{lesson.student.last_name}}</div>
        <div style="text-align:center" :class="{lineThrough: advancedOptions}">{{formatDatetime(currentCalendar.dateTime)}}</div>
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-green form-control mb-2" value="Present" :disabled="advancedOptions == true" @click="handleClick('present')">
        </div>
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-grey form-control mb-2" value="Late" :disabled="advancedOptions == true" @click="handleClick('late')">
        </div>
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-primary form-control" value="Absent" :disabled="advancedOptions == true" @click="handleClick('absent')">
        </div>
        <span class="my-2" @click="advancedOptions = !advancedOptions" style="cursor:pointer; width:fit-content">Advanced options...</span>
      </div>
      <div v-if="advancedOptions" class="row">
        <div class="col-12 col-md-4">
          <label for="date">Lesson date:</label>
          <input type="date" id="date" class="form-control" required :max="today" v-model="customData.date">
        </div>
        <div class="col-12 col-md-4">
          <label for="time">Lesson start time:</label>
          <input type="time" id="time" class="form-control" required v-model="customData.time">
        </div>
        <div class="col-12 col-md-4">
          <label for="submit">Confirm:</label>
          <input type="submit" id="submit" class="btn btn-primary form-control" value="Record Attendance">
        </div>
      </div>
    </form>
  </span>
</modal-template-vue> -->

</template>

<script setup>
import { onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import ModalTemplate from '../../../Modal.vue'
import useApi from '../../../../composables/useApi'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import axiosClient from '../../../../axios'
import { useCalendarStore } from '../../../../stores/calendar'
import { useLessonsStore } from '../../../../stores/lessons'


const router = useRouter()
  
const user = useUserStore()
const calendar = useCalendarStore()
const lessonStore = useLessonsStore()
const currentCalendar = calendar.getEventData
const lesson = ref(null)
const advancedOptions = ref(false)
const today = moment().format('YYYY-MM-DD')

const attendanceData = ref({
  lesson_id: currentCalendar.lesson_id,
  attendance: "",
  date: moment(currentCalendar.dateTime).format('YYYY-MM-DD'),
  time: moment(currentCalendar.dateTime).format('hh:mm'),
  tutor_id: user.attributes.id
})

const customData = ref({
  date: null,
  time: null
})

const returnDetails = { name: 'YourDay' }

function handleClick(result){
  attendanceData.value.attendance = result
  if(result == "custom") {
    attendanceData.value.date = customData.value.date
    attendanceData.value.time = customData.value.time
  }
  submitRecord()
}

function submitRecord(){
  axiosClient.post('/lessonAttendance', attendanceData.value).then(res => {
    calendar.addAttendanceRecord(res.data.data)
    router.push({ name: 'YourDay'})
  })
}

function formatDatetime(dateTime){
  return moment(dateTime).format('dddd, MMM DD YYYY, hh:mma')
}

onMounted(() => {
  const {data:lessonResponse, fetchData: fetchLesson} = useApi('lessons/' + currentCalendar.lesson_id)
  fetchLesson().then(()=>{
    lessonStore.setLesson(lessonResponse.value.data)
    lesson.value = lessonResponse.value.data
  })
})

</script>

<style lang="scss" scoped>
.heading {
  font-size: 1.5rem;
  text-align:center; 
}
.lineThrough {
  text-decoration: line-through;
}
</style>