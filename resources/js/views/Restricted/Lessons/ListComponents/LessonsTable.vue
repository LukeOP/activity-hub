<template>  
<span>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('attributes.funding_type')"style="width: 45px; text-align: center; padding: 5px 10px;">:::</th>
          <th @click="sortData('student.last_name')">Student:</th>
          <!-- <th @click="sortData('student.year_level')">Year:</th> -->
          <th @click="sortData('attributes.instrument')" style="width: 150px;">Instrument:</th>
          <th @click="sortData('attributes.day')" style="width: 150px;">Lesson Day:</th>
          <th @click="sortData('attributes.start')" style="width: 100px;">Time:</th>
          <th @click="sortData('tutor.last_name')">Tutor:</th>
          <th @click="sortData('attributes.status')">Status:</th>
          <th @click="sortData('school.name')" v-if="user.attributes.schools.length > 1">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="lesson in lessons" :key="lesson.id" @click="handleLessonClick(lesson)" :class="lesson.attributes.status">
          <td style="width: 45px;"><span class="funding-icon" v-if="lesson.attributes.funding_type">{{getLessonFunding(lesson.attributes.funding_type)}}</span></td>
          <td style="padding-right: 10px;"><span>{{lesson.student.full_name}}</span><span v-if="lesson.student.tutor_group" style="float: inline-end;">({{ lesson.student.tutor_group }})</span></td>
          <td style="width: 150px;">{{lesson.attributes.instrument}}</td>
          <td style="width: 150px;">{{lesson.attributes.day || '-'}}</td>
          <td style="width: 100px;">{{formatTime(lesson.attributes.start) || '-'}}</td>
          <td>
            <AvatarName :user="{attributes: lesson.tutor}" />
          </td>
          <td><span class="status" :class="lesson.attributes.status + '-td'">{{lesson.attributes.status}}</span></td>
          <td v-if="user.attributes.schools.length > 1">{{lesson.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>

  <div class="col-12 col-md-4 totals">
    <span>Total: {{getNum('total')}}</span>
    <span>Active: {{getNum('Active')}}</span>
    <span>Pending: {{getNum('Pending')}}</span>
    <span>Waiting List: {{getNum('Waiting')}}</span>
  </div>
</span>
  
</template>
<script setup>
import { useRouter } from 'vue-router'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import { useLessonsStore } from '../../../../stores/lessons'
import useSorter from '../../../../composables/useSorter'
import AvatarName from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarName.vue'
import useAbbreviator from '../../../../composables/useAbbreviator'
import { ref } from 'vue';

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

</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
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
}
th {
  cursor: pointer;
}
@media (min-width: 768px){
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
}

</style>