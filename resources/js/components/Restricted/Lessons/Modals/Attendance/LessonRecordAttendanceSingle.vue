<template>
  <HeaderLine heading="Record Lesson Attendance" center="true"/>
  <span style="height:fit-content" v-if="lesson">
    <form style="padding:1rem" @submit.prevent="handleClick('custom')">
      <div class="row">
        <div class="heading">{{lesson.student.full_name}}</div>
        <div style="text-align:center" :class="{lineThrough: advancedOptions}">{{formatDatetime(currentCalendar.dateTime)}}</div>

        <!-- Attendance Button Section -->
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-green form-control mb-2" value="Present" :disabled="advancedOptions == true" @click="handleClick('present')">
        </div>
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-grey form-control mb-2" value="Late" :disabled="advancedOptions == true" @click="handleClick('late')">
        </div>
        <div class="col-12 col-md-4">
          <input type="button" class="btn btn-primary form-control" value="Absent" :disabled="advancedOptions == true" @click="handleClick('absent')">
        </div>

        <!-- Advanced Option Selection -->
        <span class="my-2" @click="advancedOptions = !advancedOptions" style="cursor:pointer; width:100%; text-align:center">Advanced options...</span>
      </div>

      <!-- Advanced Option Inputs -->
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

</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import moment from 'moment'
import { useUserStore } from '../../../../../stores/user'
import axiosClient from '../../../../../axios'
import { useCalendarStore } from '../../../../../stores/calendar'
import { useLessonsStore } from '../../../../../stores/lessons'
import { useModalStore } from '@/stores/modal'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useToastStore } from '/resources/js/stores/toast'


const router = useRouter()
  
const user = useUserStore()
const calendar = useCalendarStore()
const lessonStore = useLessonsStore()
const toast = useToastStore()
const currentCalendar = calendar.getEventData
const lesson = lessonStore.getLessonData
const modal = useModalStore()
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

function handleClick(result){
  attendanceData.value.attendance = result
  if(result == "custom") {
    attendanceData.value.date = customData.value.date
    attendanceData.value.time = customData.value.time
  }
  submitRecord(result)
}

function submitRecord(result){
  // console.log(attendanceData.value)
  axiosClient.post('/lesson-attendance', attendanceData.value).then(res => {
    console.log(res.data.lesson)
    lessonStore.updateLessonRecord(res.data.lesson)
    lessonStore.setLesson(res.data.lesson)
    toast.open('success', 'Record Saved', 'Lesson attendance set as ' + result)
    modal.close()
  })
}

function formatDatetime(dateTime){
  return moment(dateTime).format('dddd, MMM DD YYYY, hh:mma')
}

</script>

<style lang="scss" scoped>
h2 {
  text-align: center;
}
.heading {
  font-size: 1.5rem;
  text-align:center; 
}
.lineThrough {
  text-decoration: line-through;
}
</style>