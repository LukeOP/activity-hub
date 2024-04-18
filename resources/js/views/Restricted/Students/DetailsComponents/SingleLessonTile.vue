<template>
    <div class="lesson-card" :class="{deleted: lesson.attributes.deleted_at != null, pending:lesson.attributes.status == 'Pending'}" @click="goToLesson">
      <!-- <div class="row"> -->
        <!-- <div class="col col-6"> -->
        <div>
          <div style="display: flex; justify-content: space-between;">
            <div id="instrument-name">{{ lesson.attributes.instrument }}</div>
            <div>{{ lesson.attributes.status }}</div>
          </div>
          <div style="display: flex; justify-content: space-between;">
            <div>Tutor: {{ lesson.tutor.full_name }}</div>
            <div v-if="lesson.attributes.startDate">Started: {{ formatDate(lesson.attributes.startDate) }}</div>
          </div>
        </div>
        <!-- <div class="col col-6 text-end">
          <span v-if="lesson.attributes.deleted_at === null">
            <div>{{ lesson.attributes.day }} {{ lesson.attributes.start }}</div>
          </span>
          <span v-if="lesson.attributes.deleted_at != null">
            <div>Started: {{ formatDate(lesson.attributes.startDate) }}</div>
            <div>Ended: {{ formatDate(lesson.attributes.deleted_at) }}</div>
          </span>
        </div> -->
      <!-- </div> -->
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '/resources/js/stores/lessons';
import moment from 'moment';

const props = defineProps({lesson:Object})
const router = useRouter()
const lessonStore = useLessonsStore()

function formatDate(date){
  return moment(date).format('DD MMM YYYY')
}

function goToLesson(){
  lessonStore.setLesson(props.lesson.id)
  router.push({
    name: 'LessonDetails'
  })
}

</script>

<style lang="scss" scoped>
.lesson-card {
  min-height: 50px;
  padding: 10px;
  border: 1px solid $ah-grey;
  border-left: 5px solid $ah-primary;
  border-radius: 0.25rem;
  margin-bottom: 0.5rem;
  &:hover {
    cursor: pointer;
    border-color: $ah-primary-light;
    box-shadow: 5px 5px 10px $ah-primary-background;
  }
}
#instrument-name {
  font-size: 1.25rem;
  color: $ah-primary-dark;
}
.deleted {
  background-color: lighten($ah-grey-background, 2%);
  border: 1px solid $ah-red;
  border-left: 5px solid $ah-red;
  &:hover {
    box-shadow: 5px 5px 10px $ah-primary-background;
    border-color: $ah-grey-light;
  }
}
.pending {
  background-color: #FCF9FE;
  border-left-color: $ah-purple;
}

</style>