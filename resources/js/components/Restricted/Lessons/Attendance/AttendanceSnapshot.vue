<template>
  <div id="snapshot">
    <h4 style="display: flex; justify-content: space-between;"><span>{{getHeading()}}</span> <span id="total">{{ total }}</span></h4>
    <div class="progress" style="height: 10px; padding:0">
      <div class="progress-bar bg-primary" role="progressbar" aria-label="Example 20px high" :style="'width: '+ getPercentage(present) + '%;'" :aria-valuenow="present" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-secondary-dark" role="progressbar" aria-label="Example 20px high" :style="'width: '+ getPercentage(late) + '%;'" :aria-valuenow="late" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-red" role="progressbar" aria-label="Example 20px high" :style="'width: '+ getPercentage(absent) + '%;'" :aria-valuenow="absent" aria-valuemin="0" aria-valuemax="100"></div>
      <div class="progress-bar bg-green" role="progressbar" aria-label="Example 20px high" :style="'width: '+ getPercentage(custom) + '%;'" :aria-valuenow="custom" aria-valuemin="0" aria-valuemax="100"></div>
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
import { useLessonsStore } from "../../../../stores/lessons"

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

const present = props.lesson.attendance.filter(l => l.attendance == 'present').length
const late = props.lesson.attendance.filter(l => l.attendance == 'late').length
const absent = props.lesson.attendance.filter(l => l.attendance == 'absent').length
const custom = props.lesson.attendance.filter(l => l.attendance == 'custom').length

const total = computed(()=> {
  return present + late + absent + custom
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
}
.faded {
  opacity: 0;
}
</style>