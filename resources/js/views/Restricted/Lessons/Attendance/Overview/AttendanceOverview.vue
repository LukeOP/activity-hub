<template>
<div>
  <HeaderLine heading="Attendance Overview" link1="Lesson List" @link1="routeChange('LessonsList')" link2="Attendance Review" @link2="routeChange('LessonAttendanceReview')" />
  <div id="menuBar">
    <div id="subject-group">
      <div v-for="subject in subjectArray" :key="subject">
        <span v-if="filteredLessons(subject).length > 0" class="menuItem"
          :class="{active: selectedSubject === subject}"
          @click="selectedSubject = subject">
          {{ subject }}
        </span>
      </div>
    </div>
    <div id="options-group" style="display: flex;">
      <div id="funding" v-if="fundingArray.length">
        <select class="form-control" v-model="selectedFunding">
          <option v-for="funding in fundingArray" :key="funding" :value="funding">{{ funding }}</option>
        </select>
      </div>
      <div id="tutors" v-if="tutorArray.length">
        <select class="form-control" v-model="selectedTutor">
          <option v-for="tutor in tutorArray" :key="tutor.id" :value="tutor.id">{{ tutor.full_name }}</option>
        </select>
      </div>
    </div>
    </div>
  <div class="row mb-2 mt-4 lesson-group">
    <!-- <h2 class="subjectHeading">{{selectedSubject}}</h2> -->
    <div v-for="lesson in filteredLessons(selectedSubject)" :key="lesson">
      <AttendanceRecordLine class="snapShot" :lesson="lesson" :heading="lesson.student.full_name" :stats="true" @click="handleClick(lesson)"/>
      <hr />
    </div>
  </div>

</div>
  
</template>

<script setup>
// Imports
import { computed, ref } from 'vue'
import useApi from '../../../../../composables/useApi'
import { useRouter } from 'vue-router'
import useSorter from '../../../../../composables/useSorter'
import { useLessonsStore } from '../../../../../stores/lessons'

// Components
import AttendanceRecordLine from './../Components/AttendanceRecordLine.vue'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useSchoolStore } from '../../../../../stores/schools'

// Variables
const router = useRouter()
const lessonStore = useLessonsStore()
const schoolStore = useSchoolStore()
const sorter = useSorter()
const subjectArray = ref(Array.from(new Set(lessonStore.getLessonsData.map(l => l.attributes.instrument ))))
const selectedSubject = ref(subjectArray.value[0])
const selectedTutor = ref(0)
const selectedFunding = ref(`All Funding Options`)

const tutorArray = computed(() => {
  // Create a Map to store unique tutors
  const tutorMap = new Map();

  // Iterate through lessons and add tutors to the map
  lessonStore.getLessonsData
    .filter(lesson => lesson.attributes.instrument === selectedSubject.value && lesson.attendance.length > 0)
    .forEach(lesson => {
      const tutorId = lesson.tutor.id;
      const tutorName = lesson.tutor.full_name;
      const tutorInstrument = lesson.attributes.instrument;
      const tutorKey = `${tutorId}_${tutorInstrument}`;

      // If tutor doesn't exist in the map, add it
      if (!tutorMap.has(tutorKey)) {
        tutorMap.set(tutorKey, { id: tutorId, full_name: tutorName, instrument: tutorInstrument });
      }
    });

  // Convert the Map values to an array
  let tutorsArray = Array.from(tutorMap.values());

  // Add 'all tutors' option if more than one tutor exists for selected instrument
  if (tutorsArray.length > 1) {
    tutorsArray.unshift({ id: 0, full_name: `All ${selectedSubject.value} Tutors`, instrument: selectedSubject.value });
  }
  if(tutorsArray.length > 0){
    selectedTutor.value = tutorsArray[0].id
  }

  // Return array of instrument tutors
  return tutorsArray;
});


const fundingArray = computed(() => {
  // creates a set of tutors for the selected instrument
  var fundingSet = new Set();
  lessonStore.getLessonsData.filter(l => l.attributes.instrument == selectedSubject.value && l.attendance.length > 0)
  .forEach(function(lesson) {
      fundingSet.add(lesson.attributes.funding_type)
    })
  // converts set to array
  let fundingTypeArray = Array.from(fundingSet)
  
  // adds 'all funding' option if more than one funding option exists for selected instrument
  if(fundingTypeArray.length > 1){
    fundingTypeArray.unshift(`All Funding Options`)
  }

  if(fundingTypeArray.length > 0) {
    selectedFunding.value = fundingTypeArray[0]
  }

  // returns array of instrument tutors
  return fundingTypeArray
})

// Filters displayed lessons based on instrument and tutor selection.
function filteredLessons(type){
  let filtLessons = lessonStore.getLessonsData.filter(l => l.attributes.instrument == type && l.attendance.length > 0)
  if(selectedTutor.value != 0){
    filtLessons = filtLessons.filter(l => l.tutor.id == selectedTutor.value)
  }
  if(selectedFunding.value != `All Funding Options`){
    filtLessons = filtLessons.filter(l => l.attributes.funding_type == selectedFunding.value)
  }
  filtLessons = filtLessons.filter(l => l.attendance.some(a => a.attendance != 'pending'))
  sorter.sort(filtLessons, 'student.last_name')
  return filtLessons
}

function handleClick(lesson){
    lessonStore.setLesson(lesson.id)
    router.push({
      name: 'LessonAttendanceSingle'
    })
}

function routeChange(route){
  router.push({
    name: route
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
      // box-shadow: 0 0 10px $ah-grey;
      // border-radius: 0.375rem;
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
#funding {
  margin-right: 1rem;
}
select {
  border-color: $ah-grey;
}

</style>