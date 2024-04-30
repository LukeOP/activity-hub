<template>
  <div>
    <HeaderLine heading="Edit Attendance" center="true" /> 
    <form style="padding:1rem" @submit.prevent="updateAttendance">
      <div class="row">
        <div class="col-12 col-md-4">
          <label for="date">Lesson date:</label>
          <input type="date" id="date" class="form-control" required :max="today" v-model="formData.date">
        </div>
        <div class="col-12 col-md-4">
          <label for="time">Lesson start time:</label>
          <input type="time" id="time" class="form-control" required v-model="formData.time">
        </div>
        <div class="col-12 col-md-4">
          <label for="attendance">Attendance:</label>
          <select id="attendance" v-model="formData.attendance" class="form-control">
            <option value="present">Present</option>
            <option value="late">Late</option>
            <option value="absent">Absent</option>
            <option value="cancelled">No Lesson</option>
            <!-- <option value="custom">Alternative date/time</option> -->
          </select>
        </div>
      </div>
      <div class="content-align:center; mt-4">
        <input type="submit" id="submit" class="btn btn-primary form-control" value="Update Attendance">
      </div>
    </form>    

  </div>
</template>

<script setup>
import { useLessonsStore } from '/resources/js/stores/lessons';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import axiosClient from '/resources/js/axios';
import { useModalStore } from '/resources/js/stores/modal';
import moment from 'moment';
import { useToastStore } from '/resources/js/stores/toast';
import { useUserStore } from '../../../../../stores/user';
import useApi from '../../../../../composables/useApi';

const lessonStore = useLessonsStore()
const currentAttendance = lessonStore.getAttendance
const modal = useModalStore()
const toast = useToastStore()
const user = useUserStore()

const today = moment().format('YYYY-MM-DD')

const formData = ref({
  id: currentAttendance.id,
  date: currentAttendance.date,
  time: currentAttendance.time,
  attendance: currentAttendance.attendance
})

function updateAttendance(){
  const {data, fetchData} = useApi('/lesson-attendance/' + formData.value.id, formData.value, 'PATCH', true)
  fetchData().then(()=>{
    lessonStore.updateLessonRecord(data.value.data)
    modal.close()
  })


  // axiosClient.patch('/lesson-attendance/' + formData.value.id, formData.value).then(res => {
  //   let attendance = lessonStore.getAttendanceArray.find(a => a.id === formData.value.id)
  //   attendance.attendance = formData.value.attendance
  //   attendance.date = formData.value.date
  //   attendance.time = formData.value.time
  //   attendance.user_id = user.attributes.id
  //   toast.open('success', 'Attendance Updated', 'Attendance details have been changed')
  //   modal.close()
  // })
}


</script>

<style lang="scss" scoped>

</style>