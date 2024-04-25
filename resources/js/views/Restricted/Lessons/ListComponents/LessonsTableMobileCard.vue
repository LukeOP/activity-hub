<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-6">
      <p>{{lesson.student.full_name}}</p>
      <p>{{lesson.attributes.instrument}}</p>
    </div>
    <div class="col col-4">
      <p>{{lesson.attributes.day}}</p>
      <p>{{formatTime(lesson.attributes.start)}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="LessonDetails"></i>
    </div>
    <div class="col col-6" v-if="active">
      <p>Status: {{lesson.attributes.status}}</p>
      <p v-if="lesson.school.room">Location: {{lesson.school.room}}</p>
    </div>
    <div class="col col-6" v-if="active">
      <p>Tutor: {{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</p>
      <p v-if="lesson.attributes.funding_type">Funding: {{lesson.attributes.funding_type}}</p>
    </div>
    <p v-if="active && user.getSchools.length > 1">School: {{lesson.school.name}}</p>
  </div>
</template>

<script setup>
import moment from "moment"
import { useLessonsStore } from "/resources/js/stores/lessons"
import { ref } from "vue"
import { useRouter } from "vue-router"
import { useUserStore } from "/resources/js/stores/user";
const props = defineProps({lesson:Object})

const router = useRouter()
const lessonStore = useLessonsStore()
const user = useUserStore()

const active = ref(false)

function formatTime(time){
  let date = moment(time, 'HH:mm:ss').format('h:mma')
  return date != 'Invalid date' ? date : ''
}
function LessonDetails(){
  lessonStore.setLesson(props.lesson.id)
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