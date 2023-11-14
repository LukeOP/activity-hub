<template>
  <div v-if="!loading">
    <div id="date-banner">
      <div id="date" v-if="!mobileFormat">{{ moment(selectedDate).format('dddd - MMMM DD') }}</div>
      <div id="date" v-else>{{ moment(selectedDate).format('ddd - MMM Do') }}</div>
      <div id="btn-container">
        <button class="btn btn-primary me-2" id="btn2" @click="subtractDay">&lt;</button>
        <button class="btn btn-primary me-2" id="btn1" @click="getToday">Today</button>
        <button class="btn btn-primary" id="btn3" @click="addDay">></button>
      </div>
    </div>
    <table v-if="dayLessons.length > 0">
      <tr v-for="lesson in dayLessons" :key="lesson" @click="handleRowClick(lesson)">
        <td id="category"><i class="fa-solid fa-circle" :class="{own: lesson.tutor.id = user.attributes.id, school: lesson.tutor.id != user.attributes.id}"></i></td>
        <td>{{ formatTime(lesson.attributes.start) }} - {{ formatTime(lesson.attributes.end) }}</td>
        <td>{{ lesson.student.full_name }}</td>
        <td>{{ lesson.attributes.instrument }}</td>
        <td id="state"><StatusIconSVG :status="getLessonAttendance(lesson.attendance)" /></td>
      </tr>
    </table>
    <div class="text-center" v-else>No Lessons Today</div>

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { computed, ref, watch } from 'vue';
import moment from 'moment';
import { useUserStore } from '/resources/js/stores/user';
import { useModalStore } from '/resources/js/stores/modal';
import { useCalendarStore } from '/resources/js/stores/calendar';
import { useLessonsStore } from '/resources/js/stores/lessons';
import { icons } from '@/images/icons/icons'
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import StatusIconSVG from '../../Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';

const house = icons.question

// Initiate Stores
const user = useUserStore()
const modal = useModalStore()
const calendar = useCalendarStore()
const lessonStore = useLessonsStore()

// Initiate Composables
const { mobileFormat } = useWindowSize()

// Initiate Variables
const selectedDate = ref(moment())
const key = ref(0)

// Fetch Lesson Data
const { data: lessons, loading, fetchData: fetchLessons } = useApi('lessons')
fetchLessons().then(()=> {
  lessonStore.setLessons(lessons.value)
})

// Manipulate Selected Day
function addDay(){
  selectedDate.value = moment(selectedDate.value).add(1, 'days')
}
function getToday(){
  selectedDate.value = moment()
}
function subtractDay(){
  selectedDate.value = moment(selectedDate.value).subtract(1, 'days')
}

// Format Date
function formatTime(date){
  return moment(date, 'hh:mm:ss').format('hh:mma')
}

const dayLessons = computed(() => {
  return lessonStore.getLessonsData.filter(l => 
    l.attributes.day === moment(selectedDate.value).format('dddd') 
    && l.attributes.startDate <= moment(selectedDate.value).format('YYYY-MM-DD')
    && (l.attributes.endDate == null || l.attributes.endDate > moment(selectedDate.value).format('YYYY-MM-DD'))
  )
})

function getLessonAttendance(attendanceArray){
  let response = 'incomplete'
  let currentDate = moment(selectedDate.value).format('YYYY-MM-DD')
  if(currentDate > moment().format('YYYY-MM-DD')) response = 'pending'
  if(attendanceArray.length > 0){
    attendanceArray.filter(a => a.date === currentDate).length > 0 ? response = 'complete' : response = 'incomplete'
  }
  return response
}

function handleRowClick(lesson){
  calendar.setEventData({
    lesson_id: lesson.id, 
    dateTime: selectedDate.value,
    lesson: lesson})
  lessonStore.setLesson(lesson)
  modal.open('LessonCalendarClick')
}


</script>

<style lang="scss" scoped>
#date-banner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 5px;
  border-bottom: 3px solid $ah-primary;

  #date {
    font-size: 1.5rem;
  }

  #btn-container {
    button {
      border-radius: 0.375rem;
      min-width: 37px;
    }
  }
}
table {
  width: 100%;
  #category {
    width: 25px;
    padding:5px
  }
  #state {
    width: 30px;
  }
  tr {
    border-bottom: 1px solid $ah-grey;
    &:hover {
      background-color: $ah-primary-background;
      cursor: pointer;
    }
    td {
      padding: 10px 0;
    }
  }
}
.icon {
  display: inline-flex;
  height: 1.25rem;
  width: 25px;
}
.own {
  color: $ah-primary;
}
.school {
  color: $ah-grey;
}
@media (max-width: 768){
  
}


</style>