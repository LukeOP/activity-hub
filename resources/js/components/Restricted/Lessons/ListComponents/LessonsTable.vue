<template>  
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('student.last_name')">Student:</th>
          <th @click="sortData('student.year_level')">Year:</th>
          <th @click="sortData('attributes.instrument')">Instrument:</th>
          <th @click="sortData('attributes.day')">Lesson Day:</th>
          <th @click="sortData('attributes.start')">Time:</th>
          <th @click="sortData('tutor.last_name')">Tutor:</th>
          <th @click="sortData('attributes.funding_type')">Funding:</th>
          <th @click="sortData('attributes.status')">Status:</th>
          <th @click="sortData('school.name')" v-if="user.attributes.schools">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="lesson in lessons" :key="lesson.id" @click="handleLessonClick(lesson)" :class="lesson.attributes.status">
          <td>{{lesson.student.full_name}}</td>
          <td>{{lesson.student.year_level || '-'}}</td>
          <td>{{lesson.attributes.instrument}}</td>
          <td>{{lesson.attributes.day || '-'}}</td>
          <td>{{formatTime(lesson.attributes.start) || '-'}}</td>
          <td>{{lesson.tutor.full_name}}</td>
          <td><span :class="lesson.attributes.funding_type">{{lesson.attributes.funding_type || '-'}}</span></td>
          <td><span class="status btn" :class="lesson.attributes.status + '-td'">{{lesson.attributes.status}}</span></td>
          <td v-if="user.attributes.schools">{{lesson.school.name}}</td>
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
  
</template>
<script>
import { useRouter } from 'vue-router'
import moment from 'moment'
import { useUserStore } from '../../../../stores/user'
import { useLessonsStore } from '../../../../stores/lessons'
import useSorter from '../../../../composables/useSorter'

export default {
  props: {
    lessons: Array
  },
  setup(props){
    const router = useRouter()
    const sorter = useSorter()
    const lessonStore = useLessonsStore()
    const user = useUserStore()

    function handleLessonClick(lesson){
      lessonStore.setLesson(lesson)
      router.push({
        name: 'LessonDetails'
      })
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

    return {
      user,
      handleLessonClick,
      formatTime,
      getNum,
      sortData
    }
  }
}
</script>

<style lang="scss" scoped>
@media (min-width: 768px){
  .status {
    width: 90px;
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
}

</style>