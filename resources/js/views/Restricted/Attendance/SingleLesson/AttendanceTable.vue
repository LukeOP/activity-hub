<template>
<div>
  <div style="display: flex; justify-content: space-between; padding-bottom: 0.5rem;">
    <h3 style="height: fit-content; margin: auto 0;">Attendance Entries</h3>
    <div id="date-range">
      <span>Showing attendance between </span>
      <input type="date" class="form-control" v-model="fromDate" :min="lesson.attributes.startDate">
      <span> and </span>
      <input type="date" class="form-control" v-model="toDate" :max="today">
    </div>
  </div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th>Day:</th>
          <th>Student:</th>
          <th>Date:</th>
          <th>Time:</th>
          <th>Attendance:</th>
          <th class="hide">Recorded By:</th>
          <!-- <th class="hide">Last Modified:</th> -->
          <th style="width: 80px;"></th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y: auto;" v-if="filteredAttendanceRecords.length > 0">
    <table>
      <tbody>
        <tr v-for="record in filteredAttendanceRecords" :key="record">
          <td>{{getDay(record.date)}}</td>
          <td>{{record.student.full_name}}</td>
          <td>{{formatDate(record.date)}}</td>
          <td>{{formatTime(record.time)}}</td>
          <td style="display:flex; justify-content: center; align-items: center;">
            <div class="attendance" :class="record.attendance">{{capitalizeFirstLetter(record.attendance)}}</div>
          </td>
          <td class="hide">{{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</td>
          <td style="width: 80px;">
            <div style="display: flex; justify-content: space-between; padding-right: 10px;">
              <i class="fa-solid fa-edit icon" @click="editRecord(record, 'EditAttendance')"></i>
              <i v-if="permitted(record)" class="fa-regular fa-note-sticky icon" :class="{'fa-solid': hasNotes(record)}" @click="editRecord(record, 'LessonNotes')"></i>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
  <section v-else>
    <div style="text-align: center; margin-top: 1rem;">No Attendance Records in this date range</div>
  </section>
</div>
</template>

<script>
import moment from 'moment'
import { useModalStore } from '/resources/js/stores/modal'
import { useLessonsStore } from '/resources/js/stores/lessons'
import useSorter from '/resources/js/composables/useSorter'
import { computed, ref } from 'vue'
import { useAppStore } from '../../../../stores/appStore'
import { useUserStore } from '../../../../stores/user'
export default {
  props: {
    lesson: Object
  },
  setup(props){
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

    const fromDate = ref(props.lesson.attributes.startDate)
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

    return {
      fromDate,
      toDate,
      today,
      attendanceRecords,
      filteredAttendanceRecords,
      formatTime,
      capitalizeFirstLetter,
      getDay,
      formatModified,
      editRecord,
      formatDate,
      hasNotes,
      permitted
    }
  }

}
</script>

<style lang="scss" scoped>
#date-range {
  display: flex;
  height: fit-content;
  margin: auto 0;
  span, input {
    width: fit-content;
    margin: auto;
    margin-left: 1rem;
  }
}
#table-body-section {
  max-height: calc(100vh - 200px);
  border-bottom: 5px solid $ah-primary;
}
.attendance {
  // display: block;
  text-align: center;
  width: 80%;
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  color: white;
}
.present {
  background-color: $ah-primary;
}
.late {
  background-color: $ah-secondary;
}
.absent {
  background-color: $ah-red-light;
}
.custom {
  background-color: $ah-green;
}
.incomplete {
  background-color: $ah-grey;
}
.icon {
  font-size: 1.75rem;
  color: $ah-primary;
  &:hover {
    color: $ah-secondary;
    cursor: pointer;
  }
}
tr:hover {
  cursor: default;
}
td, th {
  height: 44px;
  text-align: center;
  justify-content: center; 
  align-items: center;
  &:first-of-type {
    text-align: start;
  }
}

/* Styles for mobile */
@media (max-width: 768px) {
  .attendance {
    width: 100px;
  }
  .hide {
    display: none;
  }
}

</style>