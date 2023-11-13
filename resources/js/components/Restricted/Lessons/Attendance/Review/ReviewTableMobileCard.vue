<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-6">
      <p>{{ lesson.student.full_name }}</p>
      <p>{{ lesson.lesson.instrument }}</p>
      <!-- <p>{{lesson}}</p> -->
    </div>
    <div class="col col-6">
      <p>{{formatDate(lesson.date)}}</p>
      <p>{{lesson.lesson.attendance}}</p>
    </div>
    <!-- <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}"></i>
    </div> -->
    <div class="col col-6" v-if="active">
      <p>Time: {{ formatTime(lesson.lesson.time) }}</p>
      <p>Tutor: {{ lesson.tutor.full_name }}</p>
    </div>
    <div class="col col-6" v-if="active">
      <p>School: {{lesson.school.name}}</p>
    </div>
  </div>
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
  lessonStore.setLesson(props.lesson)
  router.push({
    name: 'LessonDetails'
  })
}

</script>

<style lang="scss" scoped>

.fa-magnifying-glass {
  color: $ah-primary;
  padding: 5px;
  border: 1px solid $ah-primary;
  border-radius: 6px;
  margin-top: 7px;
}
.row {
  padding: 10px;
}
.active {
  background-color: $ah-primary-light;
  color: lighten($ah-primary-light, 50%);
  border-bottom: 1px solid $ah-grey;
  .fa-magnifying-glass {
    border-color: lighten($ah-primary-light, 50%);
  }
}
p {
  margin: 0;
}


</style>