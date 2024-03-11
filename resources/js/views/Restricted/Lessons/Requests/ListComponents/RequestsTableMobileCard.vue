<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-6">
      <p>{{request.student.name}}</p>
      <p>{{ request.status }}</p>
    </div>
    <div class="col col-4">
      <p>{{request.requested_instrument}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="RequestDetails"></i>
    </div>
    <div class="col col-6" v-if="active">
      <p>Received: {{ moment(request.created_at).format('DD-MM-YYYY') }}</p>
      <!-- <p>{{ request }}</p> -->
    </div>
    <div class="col col-6" v-if="active">
    </div>
  </div>
</template>

<script setup>
import moment from "moment"
import { useLessonsStore } from "/resources/js/stores/lessons"
import { ref } from "vue"
import { useRouter } from "vue-router"

const props = defineProps({request:Object})
const lessonStore = useLessonsStore()

const router = useRouter()

const active = ref(false)

function RequestDetails(){
  lessonStore.setLesson(props.request)
  router.push({
    name: 'LessonRequestReview'
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