<template>
  <div>
    <table>
      <thead>
        <tr>
          <th style="width: 45px;"></th>
          <th style="width:10%">Date:</th>
          <th style="width:10%">Time:</th>
          <th style="width:15%">Student:</th>
          <th style="width:10%">Instrument:</th>
          <th style="width:15%; text-align:center">Attendance:</th>
          <th style="width:15%">Tutor:</th>
          <th style="width:20%">School</th>
        </tr>
      </thead>

      <tbody style="overflow-y:auto" v-if="lessons.length > 0">
        <tr v-for="record in lessons" :key="record" @click="handleClick(record)">
          <td style="width: 45px;"><span class="funding-icon" v-if="record.funding_type">{{getLessonFunding(record.funding_type)}}</span></td>
          <td style="width:10%">{{record.date}}</td>
          <td style="width:10%">{{ formatTime(record.time) }}</td>
          <td style="width:15%">{{record.student.full_name}}</td>
          <td style="width:10%">{{record.instrument}}</td>
          <td style="width:15%; text-align:center; padding-left:10px; padding-right:10px"><span class="attendance" :class="record.attendance">{{capitalizeFirstLetter(record.attendance)}}</span></td>
          <td style="width:15%">{{record.tutor.full_name}}</td>
          <td style="width:20%">{{record.school.name}}</td>
        </tr>
      </tbody>
      <tbody v-else>
        <tr><td id="no-records" colspan="8">No records for this time period</td></tr>
      </tbody>
    </table>

  <div class="col-12 col-md-4 totals">
    <span>Total: {{lessons.length}}</span>
  </div>
  </div>
</template>

<script setup>
import { useModalStore } from '/resources/js/stores/modal'
import { useLessonsStore } from '/resources/js/stores/lessons'
import useApi from '../../../../composables/useApi';
import { useRouter } from 'vue-router';
import { useFilterStore } from '../../../../stores/filter';
import moment from 'moment';
import useAbbreviator from '../../../../composables/useAbbreviator';

const props = defineProps({lessons:Array})
const lessonStore = useLessonsStore()
const modal = useModalStore()
const router = useRouter()
const filter = useFilterStore()
const { abbreviate } = useAbbreviator()

function capitalizeFirstLetter(string){
  return string.charAt(0).toUpperCase() + string.slice(1)
}
function getLessonFunding(funding){
  let abbreviatedValue = funding ? abbreviate(funding) : null
  return abbreviatedValue
}

function editAttendance(record){
    lessonStore.setAttendance(record.attendance.id)
    modal.open('EditAttendance')
  }

  function formatTime(time){
    return moment(time, 'HH:mm:ss').format('h:mma')
  }

function handleClick(lesson){
  filter.close()
  lessonStore.setLesson(lesson.lesson_id)
  router.push({
    name: 'LessonAttendanceSingle'
  })
}

</script>

<style lang="scss" scoped>
#no-records {
  width: 100%;
  text-align: center;
  padding-top: 20px;
  padding-bottom: 20px;
  font-size: 1.25rem;
  color: $ah-primary;
  border-bottom: 2px solid $ah-primary;
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
.funding-icon {
  display: flex;
  width: 25px;
  height: 25px;
  background-color: $ah-primary;
  color: white;
  border-radius: 50%;
  align-items: center;
  justify-content: center;
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
.cancelled {
  background-color: $ah-darkGrey;
}

</style>