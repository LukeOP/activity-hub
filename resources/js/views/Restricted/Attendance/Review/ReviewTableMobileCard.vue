<template>
  <section id="single-attendance-review" :class="{active: active}" @click="active = !active">
    <div class="flex-spread">
      <p>{{ lesson.student.full_name }}</p>
      <p>{{ lesson.instrument }}</p>
    </div>
    <div class="flex-spread">
      <p>{{formatDate(lesson.date)}}, {{ formatTime(lesson.time) }}</p>
      <p class="attendance" :class="lesson.attendance">{{lesson.attendance}}</p>
    </div>
    <div v-if="active" class="flex-spread">
      <div>
        <div>Tutor: {{ lesson.tutor.full_name }}</div>
        <div>School: {{lesson.school.name}}</div>
      </div>
      <i class="fa-solid fa-magnifying-glass" @click="LessonDetails"></i>
    </div>
  </section>
</template>

<script setup>
import moment from "moment"
import { useLessonsStore } from "/resources/js/stores/lessons"
import { ref } from "vue"
import { useRouter } from "vue-router"
const props = defineProps({lesson:Object})

const router = useRouter()
const lessonStore = useLessonsStore()

const active = ref(false)

function formatTime(time){
  return moment(time, 'HH:mm:ss').format('h:mma')
}
function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

function LessonDetails(){
  lessonStore.setLesson(props.lesson.lesson_id)
  router.push({
    name: 'LessonAttendanceSingle'
  })
}

</script>

<style lang="scss" scoped>
.flex-spread{
  display: flex; 
  justify-content: space-between;
}
#single-attendance-review {
  padding: 10px;
}
.attendance {
  padding: 2px 10px;
  min-width: 100px;
  text-align: center;
  color: white;
}
.present {
  background-color: $ah-primary;
}
.late {
  background-color: $ah-secondary-dark;
}
.absent {
  background-color: $ah-red;
}
.custom {
  background-color: $ah-green;
}
.fa-magnifying-glass {
  color: $ah-primary;
  padding: 5px;
  border: 1px solid $ah-primary;
  border-radius: 6px;
  width: fit-content;
  height: fit-content;
  margin: auto 10px;
}
.active {
  background-color: $ah-primary-light;
  color: lighten($ah-primary-light, 50%);
  border-bottom: 1px solid $ah-grey;
  .fa-magnifying-glass {
    border-color: lighten($ah-primary-light, 50%);
    color: lighten($ah-primary-light, 50%);
  }
}
p {
  margin: 0;
}


</style>