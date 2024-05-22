<template>  
  <section id="lesson-table">
  <div class="grid" :style="gridTemplateStyle">

    <!-- Table Header -->
      <div @click="sortData('attributes.funding_type')" class="header-element text-center"><strong>:::</strong></div>
      <div @click="sortData('student.last_name')" class="header-element"><strong>Student</strong></div>
      <div @click="sortData('attributes.instrument')" class="header-element"><strong>Instrument</strong></div>
      <div @click="sortData('attributes.day')" class="header-element"><strong>Lesson Day</strong></div>
      <div @click="sortData('attributes.start')" class="header-element"><strong>Time</strong></div>
      <div @click="sortData('tutor.last_name')" class="header-element"><strong>Tutor</strong></div>
      <div @click="sortData('attributes.status')" class="header-element"><strong>Status</strong></div>
      <div @click="sortData('school.name')" class="header-element" v-if="isMultiSchoolUser"><strong>School</strong></div>

    <!-- Table Body -->
    <template v-for="lesson in lessons" :key="lesson.id" >
      <div @click="handleLessonClick(lesson)" class="cell"><span class="funding-icon">{{ getLessonFunding(lesson.attributes.funding_type) }}</span></div>
      <div @click="handleLessonClick(lesson)" class="cell student-name"><span>{{ lesson.student.full_name }}</span><span>({{ lesson.student.tutor_group }})</span></div>
      <div @click="handleLessonClick(lesson)" class="cell"><span>{{ lesson.attributes.instrument }}</span></div>
      <div @click="handleLessonClick(lesson)" class="cell"><span>{{ lesson.attributes.day || '-' }}</span></div>
      <div @click="handleLessonClick(lesson)" class="cell"><span>{{ formatTime(lesson.attributes.start) || '-' }}</span></div>
      <div @click="handleLessonClick(lesson)" class="cell"><span><AvatarName :user="{ attributes: lesson.tutor }" /></span></div>
      <div @click="handleLessonClick(lesson)" class="cell"><span class="status" :class="`${lesson.attributes.status}-td`">{{ lesson.attributes.status }}</span></div>
      <div @click="handleLessonClick(lesson)" class="cell" v-if="isMultiSchoolUser"><span>{{ lesson.school.name }}</span></div>
    </template>
  </div>

  <div class="col-12 col-md-4 totals">
    <span>Total: {{getNum('total')}}</span>
    <span>Active: {{getNum('Active')}}</span>
    <span>Pending: {{getNum('Pending')}}</span>
    <span>Waiting List: {{getNum('Waiting')}}</span>
  </div>

</section>
  
</template>
<script setup>
import { useRouter } from 'vue-router'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import { useLessonsStore } from '../../../../stores/lessons'
import useSorter from '../../../../composables/useSorter'
import AvatarName from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarName.vue'
import useAbbreviator from '../../../../composables/useAbbreviator'
import { computed, ref } from 'vue';

const props = defineProps({lessons: Array})

const router = useRouter()
const sorter = useSorter()
const lessonStore = useLessonsStore()
const user = useUserStore()
const { abbreviate } = useAbbreviator()

const abbreviatedFundingArray = ref([])

function handleLessonClick(lesson){
  lessonStore.setLesson(lesson.id)
  router.push({ name: 'LessonDetails'})
}

function formatTime(time){
  let formatTime = moment(time, 'HH:mm:ss').format('h:mm A')
  return formatTime != 'Invalid date' ? formatTime : '-'
}

function getNum(type){
  if(type != 'total'){
    return props.lessons.filter(l => l.attributes.status == type).length
  }
  return props.lessons.length
}

function sortData(field){
  sorter.sort(props.lessons, field)
}

function getLessonFunding(funding){
  let abbreviatedValue = funding ? abbreviate(funding) : null
  return abbreviatedValue
}

const isMultiSchoolUser = computed(()=>{
  return user.attributes.schools.length > 1
})

const gridTemplateStyle = computed(()=>{
  const baseTemplate = "minmax(10px, 45px) minmax(210px, 250px) repeat(3, 1fr) minmax(210px, 250px) 1fr"
  const multiSchoolTemplate = "minmax(10px, 45px) minmax(210px, 250px) repeat(3, 1fr) minmax(210px, 250px) 1fr 1fr"
  return {
    gridTemplateColumns: isMultiSchoolUser.value ? multiSchoolTemplate : baseTemplate
  }
})

</script>

<style lang="scss" scoped>
  .grid {
    display: grid;
    max-height: calc(100vh - 300px);
    overflow: auto;
    overflow-x: hidden;
    border-bottom: 2px solid $ah-primary;
    .cell {
      min-height: 50px;
      position: relative;
      padding: 5px;
      align-content: center;
      border-bottom: 1px solid $ah-grey;
      cursor: pointer;
      span {
        position: relative;
        z-index: 1;
      }

      &::before {
          content: '';
          position: absolute;
          top: 0;
          bottom: 0;
          right: -1000%;
          left: -1000%;
      }

      &:hover::before {
          background-color: $ah-primary-background;
          cursor: pointer;
      }
    }
    .header-element {
      color: white;
      background-color: $ah-primary;
      padding: 10px 5px;
      position: sticky;
      top: 0px;
      z-index: 2;
      strong:hover {
        cursor: pointer;
      }
    }
    .student-name {
      display: flex;
      justify-content: space-between;
      align-items: center;
      span {
        border: none;
      }
    }
  }
.funding-icon {
  display: flex;
  width: 25px;
  height: 25px;
  background-color: $ah-primary;
  color: white;
  border-radius: 50%;
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid $ah-grey;
}
  .status {
    display: inline-block;
    text-align: center;
    border-radius: 0.365rem;
    width: 150px;
    padding: 5px;
    border: 1px solid black;
  }
  .Active-td {
    color: $ah-green;
    background-color: lighten($ah-green-light, 70%);
    border-color: $ah-green;
  }
  .Pending-td {
    color: $ah-purple;
    background-color: lighten($ah-purple-light, 64%);
    border-color: $ah-purple;
  }
  .Waiting-td {
    color: $ah-grey-dark;
    background-color: $ah-grey-background;
    border-color: $ah-grey-dark;
  }

.heading {
    background: black;
    color: #fff;
    font-size: 150%;
}
</style>