<template>
<modal-template-vue title="Set Lesson Date and Time" :push='returnDetails'>
  <span>
    <div class="mt-3" style="text-align:center">Select the weekly date and time for this lesson to occur:</div>
    <form class="px-2 mt-3 row" @submit.prevent="">
      <div class="col col-12 col-md-6">
        <label for="lessonDay">Day:</label>
        <select name="lessonDay" class="form-control" v-model="lessonTime.day" required>
          <option v-for="day in days" :key="day.index" :value="day.value">{{day.value}}</option>
        </select>
      </div>
      <div class="col col-12 col-md-6">
        <label for="lessonTime">Start Time:</label>
        <input type="time" name="lessonTime" class="form-control mb-3" v-model="lessonTime.time" required>
      </div>
      <div class="col col-12 col-md-6">
        <label for="lessonDuration">Duration:</label>
        <select name="lessonDuration" class="form-control" v-model="lessonTime.duration" required>
          <option v-for="duration in durations" :key="duration.index" :value="duration.value">{{duration.label}}</option>
        </select>
      </div>
      <div class="col col-12 col-md-6 pt-4">
        <input type="submit" class="btn btn-grey mx-2 float-end" value="Cancel" @click="returnToDetails()">
        <input type="submit" class="btn btn-primary float-end" value="Save" @click="updateValues()">
      </div>
    </form>
  </span>
</modal-template-vue>

</template>

<script>
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import axiosClient from '../../../../axios'
import ModalTemplateVue from '../../../../components/Layouts/MainLayout/Elements/ComposableElements/Modal.vue'
import moment from 'moment'

export default {
  components: {
    ModalTemplateVue
  },
  setup(){
    const router = useRouter()
     

    const lessonTime = ref({
      day: general.routeData.lesson.attributes.day,
      time: general.routeData.lesson.attributes.start,
      duration: 30,
    })
    
    const getEndTime = computed(() => {
      var time = lessonTime.value.time.split(':')
      return moment().hour(time[0]).minute(time[1]).add(lessonTime.value.duration, 'minutes').format('HH:mm')
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

    

    function updateValues(){
      // console.log(lessonTime.value, getEndTime.value)
      axiosClient.patch('lessons/' + general.routeData.lesson.id, {start: lessonTime.value.time, end: getEndTime.value, day: lessonTime.value.day})
        .then((res) => {
          // console.log(res.data)
          returnToDetails()
        })
    }

    const returnDetails = { name: 'LessonDetails', params: { id: general.routeData.lesson.id } }

    function returnToDetails(){
        router.push(returnDetails)

    }

    return {
      lessonTime,
      days,
      durations,
      updateValues,
      returnToDetails,
      returnDetails
    }
  }

}
</script>

<style scoped>
input[type="button"] {
  width: 100px;
}

</style>