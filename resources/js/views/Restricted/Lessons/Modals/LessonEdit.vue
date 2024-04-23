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
        <div class="col col-12 col-md-6" style="display: flex; align-items: center;">
          <label style="display: flex;">
            <input type="checkbox" v-model="lessonData.term_link" :disabled="!user.hasPermission('LESSONS_E', currentLesson.school.id)">
            <span class="custom-checkbox me-2"></span>
            <ToolTip tip="Lesson attendance is only required during school terms.">
              <span style="background-color: white;"> Link to school terms</span>
            </ToolTip>
          </label>
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
          <div class="col col-12 col-md-6" v-if="schoolStore.getSchool.data.funding.length">
            <label for="fundingType">Funding Type:</label>
            <select name="fundingType" class="form-control" v-model="lessonData.funding_type" required>
              <option v-for="option in schoolStore.getSchool.data.funding" :key="option.index" :value="option.value">{{option.value}}</option>
            </select>
          </div>
          <div class="col col-12 col-md-6" v-if="currentLesson.attributes.fee">
            <label for="lessonFees">Lesson Fees $:</label>
            <input type="number" name="lessonFees" class="form-control" v-model="lessonData.fees">
          </div>
        </div>
      </span>
       
      <div class="pb-4 mt-3" style="height:50px">
        <button type="submit" class="btn btn-primary float-end" :disabled="submitting">Save
        <LoadingSpinner :isLoading="submitting" /></button>
        <input type="button" class="btn btn-grey mx-2 float-end" value="Cancel" @click="modal.close()">
      </div>
    </form>
  </div>

</template>

<script setup>
import { computed, ref } from 'vue'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import { useLessonsStore } from '../../../../stores/lessons'
import { useModalStore } from '@/stores/modal'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'
import { useSchoolStore } from '../../../../stores/schools'
import useApi from '../../../../composables/useApi'
import ToolTip from '../../../../components/Layouts/MainLayout/Elements/ToolTip.vue'

const user = useUserStore()
const schoolStore = useSchoolStore()
const lessonStore = useLessonsStore()
const modal = useModalStore()

const currentLesson = lessonStore.getLessonData
  
const attributes = currentLesson.attributes
const submitting = ref(false)

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
  term_link: attributes.term_link == 1
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

const durations = []
for (let index = 10; index <= 60; index += 5) {
  durations.push({value: index, label: `${index} mins`})  
}

function updateValues(){
  submitting.value = true
  const { data, fetchData} = useApi('lessons/' + currentLesson.id, {
    start: lessonData.value.time, 
    end: getEndTime.value, 
    day: lessonData.value.day,
    start_date: lessonData.value.startDate,
    end_date: lessonData.value.endDate,
    funding_type: lessonData.value.funding_type,
    fee: lessonData.value.fees,
    status: lessonData.value.status,
    term_link: lessonData.value.term_link
    }, 'PATCH', true)
  fetchData().then(() => {
      lessonStore.updateLessonRecord(data.value.data)
      submitting.value = false
      modal.close()
    })
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
/* Hide the default checkbox */
input[type='checkbox'] {
    display: none;
}

/* Style the custom checkbox */
.custom-checkbox {
    width: 20px;
    height: 20px;
    background-color: #ffffff;
    border-radius: 5px;
    border: 1px solid #ccc;
    cursor: pointer;
}

/* Change background color when checked */
input[type='checkbox']:checked + .custom-checkbox {
    background-color: $ah-primary;
}

/* Style the checkmark */
.custom-checkbox::after {
    content: '\2713'; /* Unicode character for checkmark */
    color: white;
    font-size: 16px;
    display: none;
}

/* Show the checkmark when checkbox is checked */
input[type='checkbox']:checked + .custom-checkbox::after {
    display: block;
    text-align: center;
    line-height: 20px;
}

/* Show the checkmark when checkbox is checked */
input[type='checkbox']:disabled + .custom-checkbox {
    background-color: $ah-grey;
    cursor: not-allowed;
}

</style>