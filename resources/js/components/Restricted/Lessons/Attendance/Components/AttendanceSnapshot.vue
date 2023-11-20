<template>
  <div id="snapshot">
    {{ usingProps }}
    <h4 style="display: flex; justify-content: space-between;"><span>{{getHeading()}}</span> <span id="total">{{ total }}</span></h4>
    <div class="progress" style="height: 10px; padding:0">
      <div class="progress-bar bg-primary" role="progressbar" :style="'width: '+ getPercentage(present) + '%;'" :aria-valuenow="present" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-secondary-dark" role="progressbar" :style="'width: '+ getPercentage(late) + '%;'" :aria-valuenow="late" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-red" role="progressbar" :style="'width: '+ getPercentage(absent) + '%;'" :aria-valuenow="absent" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-green" role="progressbar" :style="'width: '+ getPercentage(custom) + '%;'" :aria-valuenow="custom" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <p v-if="stats" style="display:flex; justify-content:space-between">
      <!-- <span style="font-weight:500">Lessons: {{total}}</span> -->
      <span class="text-primary" :class="{faded: present < 1}">Present: {{present}}</span>
      <span class="text-secondary-dark" :class="{faded: late < 1}">Late: {{late}}</span>
      <span class="text-red" :class="{faded: absent < 1}">Absent: {{absent}}</span>
      <span class="text-green" :class="{faded: custom < 1}">Custom: {{custom}}</span>
    </p>
  </div>
</template>

<script setup>
import { computed } from "vue"
import { useLessonsStore } from "../../../../../stores/lessons"

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

function getPercentage(value) {
  return Math.round(value / props.lesson.attendance.length * 100) || 0
}

</script>

<style lang="scss" scoped>
#snapshot {
  max-width: 300px;
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
.faded {
  opacity: 0;
}
</style>