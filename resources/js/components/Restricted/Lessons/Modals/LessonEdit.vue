<template>
  <div>
    <HeaderLine heading="Edit Lesson Details" center="true" />
    <form class="px-2 mt-3" @submit.prevent="updateValues">
      <div class="subHeading">Day and Time:</div>
      <div class="row">
        <div class="col col-12 col-md-6">
          <label for="lessonDay">Day:</label>
          <select name="lessonDay" class="form-control" v-model="lessonData.day">
            <option v-for="day in days" :key="day.index" :value="day.value">{{day.value}}</option>
          </select>
        </div>

        <div class="col col-12 col-md-6">
          <label for="lessonTime">Start Time:</label>
          <input type="time" name="lessonTime" class="form-control mb-3" v-model="lessonData.time">
        </div>
        <div class="col col-12 col-md-6">
          <label for="lessonDuration">Duration:</label>
          <select name="lessonDuration" class="form-control" v-model="lessonData.duration" :required="lessonData.time != null">
            <option v-for="duration in durations" :key="duration.index" :value="duration.value">{{duration.label}}</option>
          </select>
        </div>
      </div>

      <span >
        <div class="subHeading">Lesson Dates:</div>
        <div class="row">
          <div class="col col-12 col-md-6">
            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" class="form-control" v-model="lessonData.startDate">
          </div>
          <div class="col col-12 col-md-6" v-if="user.hasPermission('LESSONS_E', currentLesson.school.id)">
            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" class="form-control" v-model="lessonData.endDate">
          </div>
        </div>
      </span>

      <span v-if="user.hasPermission('LESSONS_E', currentLesson.school.id)">
        <div class="subHeading">Financial:</div>
        <div class="row">
          <div class="col col-12 col-md-6">
            <label for="fundingType">Lesson Type:</label>
            <select name="fundingType" class="form-control" v-model="lessonData.funding_type" required>
              <option v-for="option in fundingTypes" :key="option.index" :value="option.value">{{option.label}}</option>
            </select>
          </div>
          <div class="col col-12 col-md-6" v-if="currentLesson.attributes.fee">
            <label for="lessonFees">Lesson Fees $:</label>
            <input type="number" name="lessonFees" class="form-control" v-model="lessonData.fees">
          </div>
        </div>
      </span>
       
      <div class="pb-4 mt-3" style="height:50px">
        <input type="submit" class="btn btn-primary float-end" value="Save">
        <input type="button" class="btn btn-grey mx-2 float-end" value="Cancel" @click="modal.close()">
      </div>
    </form>
  </div>

</template>

<script setup>
import { computed, ref } from 'vue'
import axiosClient from '../../../../axios'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
// import { useToast } from 'vue-toast-notification'
import { useLessonsStore } from '../../../../stores/lessons'
import { useModalStore } from '@/stores/modal'
import { useToastStore } from '/resources/js/stores/toast'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'

// const toast = useToast()
const toast = useToastStore()
const user = useUserStore()
const lessonStore = useLessonsStore()
const modal = useModalStore()

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
  startDate: attributes.startDate ? attributes.startDate : new Date().toISOString().split('T')[0],
  endDate: attributes.endDate ? attributes.endDate : null,
  funding_type: attributes.funding_type,
  fees: attributes.fee,
  duration: currentDuration.value,
})

const getEndTime = computed(() => {
  if(lessonData.value.time != null){
    var time = lessonData.value.time.split(':')
    return moment().hour(time[0]).minute(time[1]).add(lessonData.value.duration, 'minutes').format('HH:mm')
  }
  return null
})

const days = [
  {value: "Monday"},
  {value: "Tuesday"},
  {value: "Wednesday"},
  {value: "Thursday"},
  {value: "Friday"},
]

const durations = [
  {value: 10, label: "10 mins"},
  {value: 15, label: "15 mins"},
  {value: 20, label: "20 mins"},
  {value: 25, label: "25 mins"},
  {value: 30, label: "30 mins"},
  {value: 35, label: "35 mins"},
  {value: 40, label: "40 mins"},
  {value: 45, label: "45 mins"},
  {value: 50, label: "50 mins"},
  {value: 55, label: "55 mins"},
  {value: 60, label: "60 mins"},
]

const fundingTypes = [
  {value: 'Funded', label: 'Funded'},
  {value: 'Private', label: 'Private'},
]

const isAdmin = computed(() => {
  if(user.permissions.find(p => p.school_id === currentLesson.school.id && p.type === 'Administrator')) {
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
      toast.open('success', 'Lesson Updated Successfully!', 'The lesson details have been updated')
      modal.close()
    })
}

const returnDetails = { name: 'LessonDetails', params: { id: currentLesson.id } }

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