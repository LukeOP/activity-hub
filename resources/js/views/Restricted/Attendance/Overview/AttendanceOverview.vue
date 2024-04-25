<template>
<div>
  <HeaderLine heading="Attendance Overview" :link1="link1" @link1="routeChange('LessonsList')" link2="Attendance Review" @link2="routeChange('LessonAttendanceReview')" />
    <!-- Table component -->
  <section v-if="filteredLessons(selectedSubject)">
    <component :is="currentComponent" :attendance="filteredLessons(selectedSubject)" :selectedSubject="selectedSubject" :subjectArray="subjectArray" @selectedSubject="setSelectedSubject" />
  </section>
  <!-- <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" /> -->
</div>
  
</template>

<script setup>
// Imports
import { computed, ref } from 'vue'
import useApi from '../../../../composables/useApi'
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'
import { useLessonsStore } from '../../../../stores/lessons'

// Components
import AttendanceRecordLine from '../Components/AttendanceRecordLine.vue'
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import OverviewTable from './OverviewTable.vue'
import { useSchoolStore } from '../../../../stores/schools'
import { useUserStore } from '../../../../stores/user'
import { useWindowSize } from '../../../../composables/useWindowSize'
import OverviewTableMobile from './OverviewTableMobile.vue'

const { windowSize } = useWindowSize()

// Variables
const router = useRouter()
const user = useUserStore()
const lessonStore = useLessonsStore()
const schoolStore = useSchoolStore()
const sorter = useSorter()
const subjectArray = ref(Array.from(new Set(lessonStore.getLessonsData.map(l => l.attributes.instrument ))))
const selectedSubject = ref('all')
const selectedTutor = ref(0)
const selectedFunding = ref(`All Funding Options`)

const link1 = ref('')
if(user.hasPermissionAny('LESSONS_R')){
  link1.value = 'Lesson List'
}

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? OverviewTable : OverviewTableMobile
})

function setSelectedSubject(subject){
  selectedSubject.value = subject
}

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
  let filtLessons = lessonStore.getLessonsData.filter(l => (l.attributes.instrument == type || type == 'all') && l.attendance.length > 0)
  filtLessons = filtLessons.filter(l => l.attendance.some(a => (a.attendance != 'pending' && a.attendance != 'cancelled')))
  sorter.sort(filtLessons, 'student.last_name')
  return filtLessons
}



function routeChange(route){
  router.push({
    name: route
  })
}


</script>

<style lang="scss" scoped>

#funding {
  margin-right: 1rem;
}
select {
  border-color: $ah-grey;
}

</style>