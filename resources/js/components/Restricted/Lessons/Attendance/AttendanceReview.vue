<template>
<div v-if="!loading">
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th style="width:10%">Date:</th>
          <th style="width:10%">Time:</th>
          <th style="width:15%">Student:</th>
          <th style="width:10%">Instrument:</th>
          <th style="width:15%; text-align:center">Attendance:</th>
          <th style="width:15%">Tutor:</th>
          <th style="width:20%">School</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto" v-if="lessons.length > 0">
    <table>
      <tbody>
        <tr v-for="record in lessons" :key="record">
          <td style="width:10%">{{record.lesson.date}}</td>
          <td style="width:10%">{{record.lesson.time}}</td>
          <td style="width:15%">{{record.student.first_name}} {{record.student.last_name}}</td>
          <td style="width:10%">{{record.lesson.instrument}}</td>
          <td style="width:15%; text-align:center; padding-left:10px; padding-right:10px"><span class="attendance" :class="record.lesson.attendance">{{capitalizeFirstLetter(record.lesson.attendance)}}</span></td>
          <td style="width:15%">{{record.tutor.first_name}} {{record.tutor.last_name}}</td>
          <td style="width:20%">{{record.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>
  <section v-else>
    <p id="no-records">No records for this time period</p>
  </section>
    
</div>
</template>

<script setup>
import moment from 'moment'
import { computed, onMounted } from 'vue'
import useApi from '../../../../composables/useApi'
import { useFilterStore } from '../../../../stores/filter'

const filter = useFilterStore()
const { data: attendanceRecords, loading, fetchData } = useApi('lesson-attendance')
fetchData().then(()=>{
  filter.setType('AttendanceReviewForm')
  filter.setData(attendanceRecords.value.data)
})

const lessons = computed(()=>{
  return Object.keys(filter.getReturned).length > 0 
  ? filter.getReturned 
  : attendanceRecords.value.data
})

function capitalizeFirstLetter(string){
  return string.charAt(0).toUpperCase() + string.slice(1)
}


</script>

<style lang="scss" scoped>
table {
  width: 100%;
  thead {
    background-color: $ah-primary;
    color: white;
    tr th:first-child {
        padding-left: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
      }
  }
  tbody {
    tr {
      border-bottom: 1px solid $ah-grey;
      &:hover {
        background-color: $ah-primary-background;
      }
      td:first-child {
        padding: 10px;
      }
    }
  }
}
#table-body-section {
  max-height: calc(100vh - 200px);
  border-bottom: 5px solid $ah-primary;
}
#no-records {
  width: 100%;
  text-align: center;
  padding-top: 20px;
  padding-bottom: 20px;
  font-size: 1.25rem;
  color: $ah-primary;
  border-bottom: 5px solid $ah-primary;
}
.attendance {
  display: block;
  text-align: center;
  width: 100%;
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

</style>