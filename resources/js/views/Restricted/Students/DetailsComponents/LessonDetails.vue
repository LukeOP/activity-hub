<template>
  <div id="lesson-details" class="section">
    <h2>Lesson Details:</h2>
    <span v-if="combinedLessons > 0">
      <h3>
        <span class="tab" :class="{active: showActiveLessons}" @click="showActiveLessons = true">Active Lessons</span>
        <span class="tab" :class="{active: !showActiveLessons}" @click="showActiveLessons = false">Concluded Lessons</span>
      </h3>
      <div id="lesson-list" class="row" v-if="showActiveLessons">
        <div class="col col-12 col-md-6" v-for="lesson in lessons" :key="lesson">
          <SingleLessonTile  :lesson="lesson" />
        </div>
      </div>
      <div id="lesson-list" class="row" v-if="!showActiveLessons">
        <div class="col col-12 col-md-6" v-for="lesson in pastLessons" :key="lesson">
          <SingleLessonTile  :lesson="lesson" />
        </div>
      </div>
    </span>
    <span v-else>
      <p style="margin: auto;" class="text-grey-dark">No lesson data</p>
    </span>
  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import SingleLessonTile from './SingleLessonTile.vue'
import { ref } from 'vue'

const props = defineProps({student:Object})
const showActiveLessons = ref(true)
const combinedLessons = ref(0)

const { data: lessons, fetchData: fetchLessons } = useApi('student-lessons/' + props.student.id)
fetchLessons().then(()=> combinedLessons.value += lessons.value.length)

const { data: pastLessons, fetchData: fetchPastLessons } = useApi('student-lessons/past/' + props.student.id)
fetchPastLessons().then(()=> combinedLessons.value += pastLessons.value.length)

</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
.tab {
  font-size: 1rem;
  display: inline-block;
  color: $ah-grey;
  font-weight: bold;
  margin-right: 0.3rem;
  &:hover {
    cursor: pointer;
  }
}
.section {
  padding: 10px 10px 2rem;
  border-bottom: 1px dashed $ah-primary;
}
.active {
  color: $ah-primary-dark;
}

</style>