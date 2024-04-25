<template>
    <div>
        <div id="menuBar">
            <div id="subject-group">
            <span class="menuItem" :class="{active: selectedSubject === 'all'}" @click="setSelectedSubject('all')">All</span>
            <template v-for="subject in subjectArray" :key="subject">
                <span v-if="attendance.length > 0" class="menuItem"
                :class="{active: selectedSubject === subject}"
                @click="setSelectedSubject(subject)">
                {{ subject }}
                </span>
            </template>
            </div>
            <div id="options-group" style="display: flex;">
            <!-- <div id="funding" v-if="fundingArray.length">
                <select class="form-control" v-model="selectedFunding">
                <option v-for="funding in fundingArray" :key="funding" :value="funding">{{ funding }}</option>
                </select>
            </div> -->
            <!-- <div id="tutors" v-if="tutorArray.length">
                <select class="form-control" v-model="selectedTutor">
                <option v-for="tutor in tutorArray" :key="tutor.id" :value="tutor.id">{{ tutor.full_name }}</option>
                </select>
            </div> -->
            </div>
        </div>
        <div class="row mb-2 mt-4 lesson-group">
            <div v-for="lesson in attendance" :key="lesson">
            <AttendanceRecordLine class="snapShot" :lesson="lesson" :heading="lesson.student.full_name" :stats="true" @click="handleClick(lesson)"/>
            <hr />
            </div>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '../../../../stores/lessons';
import AttendanceRecordLine from '../Components/AttendanceRecordLine.vue';

const props = defineProps({attendance: Array, selectedSubject: String, subjectArray: Array})
const emit = defineEmits(['selectedSubject'])

const lessonStore = useLessonsStore()
const router = useRouter()

function setSelectedSubject(subject){
    emit('selectedSubject', subject)
}
function handleClick(lesson){
    lessonStore.setLesson(lesson.id)
    router.push({
      name: 'LessonAttendanceSingle'
    })
}

</script>

<style lang="scss" scoped>
.lesson-group {
  padding: 10px;
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