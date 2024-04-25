<template>
  <div>
    <div id="menuBar">
      <label style="width: 100%;">
        <select class="form-control" v-model="selectSubject">
          <option value="all">All Lessons</option>
          <option v-for="subject in subjectArray" :value="subject">{{ subject }}</option>
        </select>
      </label>
    </div>
    <div class="mb-2 mt-4 lesson-group">
        <div v-for="lesson in attendance" :key="lesson">
          <AttendanceRecordLineMobile class="snapShot" :lesson="lesson" :heading="lesson.student.full_name" :stats="true" @click="handleClick(lesson)"/>
          <hr />
        </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import { useLessonsStore } from '../../../../stores/lessons';
import AttendanceRecordLineMobile from '../Components/AttendanceRecordLineMobile.vue';

const props = defineProps({attendance: Array, selectedSubject: String, subjectArray: Array})
const emit = defineEmits(['selectedSubject'])

const lessonStore = useLessonsStore()
const router = useRouter()

const selectSubject = ref(props.selectedSubject)

watch(()=> selectSubject.value, (subject)=> {
  emit('selectedSubject', subject)
})

function handleClick(lesson){
    lessonStore.setLesson(lesson.id)
    router.push({
      name: 'LessonAttendanceSingle'
    })
}

</script>

<style lang="scss" scoped>
.lesson-group {
  border-radius: 0.25rem;
  .subjectHeading {
    color: $ah-primary;
  }
  .snapShot {
    cursor: pointer;
    padding: 10px;
      border-left: 5px solid transparent;
    &:hover {
      border-color: $ah-primary;
    }
  }
}
#menuBar {
  display: flex;
  justify-content: space-between;
  #subject-group {
    display: flex;
    flex-wrap: wrap;
    row-gap: 10px;
    column-gap: 10px;
    .menuItem {
      text-align: center;
      width: fit-content;
      min-width: 100px;
      background-color: transparent;
      border: 1px solid $ah-grey;
      border-radius: 20px;
      // margin-right: 1rem;
      padding: 10px 20px;
      &:hover {
        cursor: pointer;
        border-color: $ah-primary;
        color: $ah-primary-dark;
      }
    }
    .active {
      background-color: $ah-primary;
      color: white;
      border-color: $ah-primary;
      &:hover {
        cursor: default;
        border-color: $ah-primary;
        color: white;
      }
    }
  }
  #options-group {
    min-width: 300px;
    justify-content: end;
  }
}
</style>