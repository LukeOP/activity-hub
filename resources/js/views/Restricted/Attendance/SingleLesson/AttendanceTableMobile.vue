<template>
  <section>
    <div style="width: 100%;">
      <AttendanceSnapshot :lesson="lessonStore.getLessonData" heading="Overall Attendance" :stats="true" />
    </div>
    <div>

      <section id="date-range-picker">
        <h3>Attendance Entries</h3>
        <div id="date-range">
          <span>Showing attendance between</span>
          <input type="date" class="form-control" v-model="fromDate" :min="lessonStore.getLessonData.attributes.startDate">
          <span> and </span>
          <input type="date" class="form-control" v-model="toDate" :max="today">
        </div>
      </section>

      <section id="attendance-record-container" class="mt-3">
        <div v-for="(record, index) in filteredAttendanceRecords" :key="index" class="attendance-record">
          <div class="attendance-record-main">
            <div class="attendance-record-dates">
              <div>{{ moment(record.date).format('dddd MMMM Do, YYYY') }}</div>
              <div>{{ formatTime(record.time) }}</div>
            </div>
            <div class="attendance" :class="record.attendance">{{ record.attendance }}</div>
          </div>
          <div class="attendance-record-hidden">
            <div>Recorded by: {{ record.recorded_by.first_name }} {{ record.recorded_by.last_name }}</div>
            <div class="attendance-record-icons">
              <i class="fa-solid fa-edit icon" @click="editRecord(record, 'EditAttendance')"></i>
              <i v-if="permitted(record) || true" class="fa-regular fa-note-sticky icon" :class="{'fa-solid': hasNotes(record)}" @click="editRecord(record, 'LessonNotes')"></i>
            </div>
            <!-- <pre>{{ record }}</pre> -->
          </div>
        </div>
      </section>

    </div>
  </section>
</template>

<script setup>
import moment from 'moment'
import { useModalStore } from '/resources/js/stores/modal'
import { useLessonsStore } from '/resources/js/stores/lessons'
import useSorter from '/resources/js/composables/useSorter'
import { computed, ref } from 'vue'
import { useAppStore } from '../../../../stores/appStore'
import { useUserStore } from '../../../../stores/user'
import AttendanceSnapshot from '../Components/AttendanceSnapshot.vue'


  const lessonStore = useLessonsStore()
  const sorter = useSorter()
  const appStore = useAppStore()
  const user = useUserStore()

  const attendanceRecords = lessonStore.getAttendanceArray
  const modal = useModalStore()

  const filteredAttendanceRecords = computed(()=>{
    let records = lessonStore.getAttendanceArray.filter(r => (r.date >= fromDate.value && r.date <= toDate.value && r.lesson_id == lessonStore.getLessonData.id ))
    sorter.sort(records, 'date', 'desc');
    return records
  })

  const fromDate = ref(lessonStore.getLessonData.attributes.startDate)
  const toDate = ref(moment().format('YYYY-MM-DD'))
  const today = ref(moment().format('YYYY-MM-DD'))

  function formatDate(date){
    return moment(date).format('Do MMM, YYYY')
  }
  function formatModified(dateTime){
    return moment(dateTime).format('Do MMM, YYYY hh:mma')
  }
  function formatTime(time){
    let formatTime = moment(time, 'HH:mm:ss').format('h:mm A')
    return formatTime != 'Invalid date' ? formatTime : '-'
  }

  function capitalizeFirstLetter(string){
    return string.charAt(0).toUpperCase() + string.slice(1)
  }

  function getDay(date){
    return moment(date).format('dddd')
  }

  function editRecord(record, modalLink){
    lessonStore.setAttendance(record.id)
    appStore.setItems({date: record.date})
    modal.open(modalLink)
  }

  function permitted(record){
    if(record.tutor.id == user.attributes.id){
      return true
    } return false
  }

  function hasNotes(record){
    let attendance = lessonStore.getLessonNotesAndAttendance.find(n => n.attendance_id == record.id)
    if(attendance){
      // console.log(Object.values(attendance.comments).every(c => c === null || c === ''));
      return true
    } else return false
  }
</script>

<style lang="scss" scoped>
.attendance-record {
  padding: 10px;
  &:nth-child(odd){
    background-color: $ah-primary-background;
  }
  .attendance-record-main {
      display: flex;
      justify-content: space-between;
    .attendance {
      text-align: center;
      width: 120px;
      height: fit-content;
      padding: 5px;
      color: white;
    }
    .present {
      background-color: $ah-primary;
    }
    .late {
      background-color: $ah-secondary;
    }
    .absent {
      background-color: $ah-red;
    }
    .custom {
      background-color: $ah-green;
    }
    .incomplete {
      background-color: $ah-grey-dark;
    }
    .cancelled {
      background-color: $ah-darkGrey;
    }
  }
  .attendance-record-hidden{
    display: flex;
    justify-content: space-between;
    .attendance-record-icons{
      min-width: 60px;
      display: flex; 
      justify-content: space-between; 
      padding-right: 10px;
      .icon {
        font-size: 1.5rem;
        color: $ah-primary;
        &:hover {
          color: $ah-secondary;
          cursor: pointer;
        }
      }
    }
  }
}

</style>