<template>
<modal-template-vue title="Edit Lesson" :push='returnDetails'>
  <div>
    <!-- "params": {id: general.routeData.lesson.id} -->
    <!-- <div class="mt-3" style="text-align:center">Select the weekly date and time for this lesson to occur:</div> -->
    <form class="px-2 mt-3" @submit.prevent="updateValues">
      <div class="subHeading">Day and Time:</div>
      <div class="row">
        <div class="col col-12 col-md-6">
          <label for="lessonDay">Day:</label>
          <select name="lessonDay" class="form-control" v-model="lessonData.day" required>
            <option v-for="day in days" :key="day.index" :value="day.value">{{day.value}}</option>
          </select>
        </div>

        <div class="col col-12 col-md-6">
          <label for="lessonTime">Start Time:</label>
          <input type="time" name="lessonTime" class="form-control mb-3" v-model="lessonData.time" required>
        </div>
        <div class="col col-12 col-md-6">
          <label for="lessonDuration">Duration:</label>
          <select name="lessonDuration" class="form-control" v-model="lessonData.duration" required>
            <option v-for="duration in durations" :key="duration.index" :value="duration.value">{{duration.label}}</option>
          </select>
        </div>
      </div>

      <span v-if="isAdmin">
        <div class="subHeading">Start and End Dates:</div>
        <div class="row">
          <div class="col col-12 col-md-6">
            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" class="form-control" v-model="lessonData.startDate" required>
          </div>
          <div class="col col-12 col-md-6">
            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" class="form-control" v-model="lessonData.endDate">
          </div>
        </div>
      </span>

      <span v-if="isAdmin">
        <div class="subHeading">Financial:</div>
        <div class="row">
          <div class="col col-12 col-md-6">
            <label for="fundingType">Funding Type:</label>
            <select name="fundingType" class="form-control" v-model="lessonData.funding_type" required>
              <option v-for="option in fundingTypes" :key="option.index" :value="option.value">{{option.label}}</option>
            </select>
          </div>
          <div class="col col-12 col-md-6">
            <label for="lessonFees">Lesson Fees $:</label>
            <input type="number" name="lessonFees" class="form-control" v-model="lessonData.fees">
          </div>
        </div>
      </span>
       
      <div class="pb-4 mt-3" style="height:50px">
        <input type="submit" class="btn btn-primary float-end" value="Save">
        <input type="button" class="btn btn-grey mx-2 float-end" value="Cancel" @click="returnToDetails()">
      </div>
    </form>
  </div>
</modal-template-vue>

</template>

<script setup>
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import axiosClient from '../../../../axios'
import ModalTemplateVue from '../../../ModalTemplate.vue'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import { useToast } from 'vue-toast-notification'
import { useLessonsStore } from '../../../../stores/lessons'

const router = useRouter()
const toast = useToast()
const user = useUserStore()
const lessonStore = useLessonsStore()

const currentLesson = lessonStore.getLessonData
  
const attributes = currentLesson.attributes

const currentDuration = computed(()=>{
  var minutes = moment(attributes.end, 'HH:mm:ss').diff(moment(attributes.start, 'HH:mm:ss'), 'minutes')
  return minutes
})

const lessonData = ref({
  status: attributes.status,
  day: attributes.day,
  time: attributes.start,
  startDate: attributes.startDate ? attributes.startDate : new Date(),
  endDate: attributes.endDate ? attributes.endDate : null,
  funding_type: attributes.funding_type,
  fees: attributes.fee,
  duration: currentDuration.value,
})

const getEndTime = computed(() => {
  var time = lessonData.value.time.split(':')
  return moment().hour(time[0]).minute(time[1]).add(lessonData.value.duration, 'minutes').format('HH:mm')
})

const days = [
  {value: "Monday"},
  {value: "Tuesday"},
  {value: "Wednesday"},
  {value: "Thursday"},
  {value: "Friday"},
]

const durations = [
  {value: 15, label: "15 mins"},
  {value: 20, label: "20 mins"},
  {value: 25, label: "25 mins"},
  {value: 30, label: "30 mins"},
]

const fundingTypes = [
  {value: 'Funded', label: 'Funded'},
  {value: 'Private', label: 'Private'},
]

const isAdmin = computed(() => {
  if(user.permissions.find(p => p.school_id === currentLesson.school.id && p.type === 'administrator')) {
    return true
    } 
  // return false
  return true
})

function updateValues(){
  // console.log(lessonData.value)
  axiosClient.patch('lessons/' + currentLesson.id, 
  {
    start: lessonData.value.time, 
    end: getEndTime.value, 
    day: lessonData.value.day,
    start_date: lessonData.value.startDate,
    end_date: lessonData.value.endDate,
    funding_type: lessonData.value.funding_type,
    fee: lessonData.value.fees,
    status: lessonData.value.status
    })
    .then((res) => {
      lessonStore.setLesson(res.data.lesson)
      toast.open({ message: res.data.message, duration: 5000, dismissible: true, type: 'success'})
      returnToDetails()
    })
}

const returnDetails = { name: 'LessonDetails', params: { id: currentLesson.id } }

function returnToDetails(){
    router.push(returnDetails)
}
</script>

<style lang="scss" scoped>
.subHeading {
  background-color: $ah-primary;
  color: white;
  width: 100%;
  padding: 5px 20px;
  margin: 10px 0px;
}
.btn {
  min-width: 100px;
}

</style>