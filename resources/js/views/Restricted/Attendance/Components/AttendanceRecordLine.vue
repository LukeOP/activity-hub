<template>
    <div id="attendanceRecordLine" style="display: flex; justify-content: space-between;">
      <div>
        <h4 style="margin: auto; width: fit-content; min-width: 200px;">{{getHeading()}}</h4>
        <div>{{ lesson.attributes.instrument }}</div>
      </div>
        <div style="flex-grow: 1; display: flex; flex-wrap: wrap; height: 50px; align-content: center;">
            <div class="progress mx-5" style="height: 10px; width: 100%;">
                <div class="progress-bar bg-primary" role="progressbar" :style="'width: '+ getPercentage(present) + '%;'" :aria-valuenow="present" aria-valuemin="0" aria-valuemax="100"></div>
                <div class="progress-bar bg-secondary-dark" role="progressbar" :style="'width: '+ getPercentage(late) + '%;'" :aria-valuenow="late" aria-valuemin="0" aria-valuemax="100"></div>
                <div class="progress-bar bg-red" role="progressbar" :style="'width: '+ getPercentage(absent) + '%;'" :aria-valuenow="absent" aria-valuemin="0" aria-valuemax="100"></div>
                <div class="progress-bar bg-green" role="progressbar" :style="'width: '+ getPercentage(custom) + '%;'" :aria-valuenow="custom" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <p v-if="stats" class="mx-5" style="display:flex; justify-content:space-between; margin: 0; width: 100%;">
                <div id="stats">
                    <span style="font-weight:500">Lessons: {{total}}</span>
                    <span class="text-primary" >Present: {{present}}</span>
                    <span class="text-secondary-dark" >Late: {{late}}</span>
                    <span class="text-red" >Absent: {{absent}}</span>
                    <span class="text-green" >Custom: {{custom}}</span>
                </div>
                <div>{{ lesson.tutor.full_name }}</div>
            </p>
        </div>
        <div id="recent-stats">
          <p class="text-primary" style="margin: 0;">Latest Entry:</p >
          {{ formatDate(latestAttendance.date) }}
          <span>| {{ latestAttendance.attendance }}</span>
        </div>
        <span id="total" style="margin: auto; min-width: 35px;">{{ total }}</span>
    </div>
  </template>
  
  <script setup>
  import { computed } from "vue"
  import { useLessonsStore } from "../../../../stores/lessons"
import moment from "moment";
  
  const props = defineProps({
    lesson: Object,
    heading: String,
    stats: Boolean
  })
   
  const lessonStore = useLessonsStore()
  
  function getHeading(){
    if(props.heading) return props.heading
    return "Attendance"
  }
  const usingProps = computed(()=>{
    return Object.keys(props.lesson).length > 0
  })
  
  const present = computed(() => {
    if(usingProps.value) return props.lesson.attendance.filter(l => l.attendance == 'present').length
    return lessonStore.getLessonData.attendance.filter(l => l.attendance == 'present').length
  })
  const late = computed(() => {
    if(usingProps.value) return props.lesson.attendance.filter(l => l.attendance == 'late').length
    return lessonStore.getLessonData.attendance.filter(l => l.attendance == 'late').length
  })
  const absent = computed(() => {
    if(usingProps.value) return props.lesson.attendance.filter(l => l.attendance == 'absent').length
    return lessonStore.getLessonData.attendance.filter(l => l.attendance == 'absent').length
  })
  const custom = computed(() => {
    if(usingProps.value) return props.lesson.attendance.filter(l => l.attendance == 'custom').length
    return lessonStore.getLessonData.attendance.filter(l => l.attendance == 'custom').length
  })
  
  const total = computed(()=> {
    return present.value + late.value + absent.value + custom.value
    // if(lessonStore.getLessonData.id == props.lesson.id) return lessonStore.getLessonData.attendance.length
    // return props.lesson.attendance.length
  })

  const latestAttendance = computed(()=>{
    let sortedAttendance = props.lesson.attendance.filter(a => (a.attendance != 'pending' && a.attendance != 'cancelled')).sort((a, b) => new Date(b.date) - new Date(a.date))
    return sortedAttendance[0]
  })
  
  function getPercentage(value) {
    return Math.round(value / props.lesson.attendance.filter(a => (a.attendance != 'pending' && a.attendance != 'cancelled')).length * 100) || 0
  }

  function formatDate(date){
    return moment(date).format('Do MMM, YYYY')
  }
  
  </script>
  
  <style lang="scss" scoped>
  #attendanceRecordLine {
    max-width: 100%;
  }
  #total {
    color: white;
    display: inline-block;
    height: 35px;
    width: 35px;
    background-color: $ah-primary;
    padding: 5px;
    border-radius: 50%;
    text-align: center;
    cursor: pointer;
    &:hover {
      background-color: $ah-primary-dark;
    }
  }
  #stats {
    span {
        margin-right: 1rem;
    }
  }
  #recent-stats {
    width: 200px;
  }

  </style>