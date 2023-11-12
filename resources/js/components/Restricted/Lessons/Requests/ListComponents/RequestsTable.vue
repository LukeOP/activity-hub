<template>  
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('student_name')">Student Name:</th>
          <th @click="sortData('student_year')">Year:</th>
          <th @click="sortData('requested_instrument')">Instrument:</th>
          <th @click="sortData('funding_type')">Funding:</th>
          <th @click="sortData('status')">Status:</th>
          <th @click="sortData('school_id')">School:</th>
          <th @click="sortData('created_at')">Received:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="lesson in requests" :key="lesson.id" @click="handleLessonClick(lesson)" :class="lesson.status">
          <td>{{lesson.student.name}}</td>
          <td>{{lesson.student.year || '-'}}</td>
          <td>{{lesson.requested_instrument}}</td>
          <td><span>{{lesson.funding_type || '-'}}</span></td>
          <td><span>{{lesson.status}}</span></td>
          <td>{{lesson.school.name}}</td>
          <td>{{formatDate(lesson.created_at)}}</td>
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
import { useUserStore } from '../../../../../stores/user'
import { useLessonsStore } from '../../../../../stores/lessons'
import useSorter from '../../../../../composables/useSorter'
import { ref } from 'vue'

export default {
  props: {
    requests: Array
  },
  setup(props){
    const router = useRouter()
    const sorter = useSorter()
    const lessonStore = useLessonsStore()
    const user = useUserStore()

    function handleLessonClick(lesson){
      lessonStore.setLesson(lesson)
      router.push({
        name: 'LessonRequestReview'
      })
    }

    function formatDate(date){
      let formatDate = moment(date).format('MMM Do YYYY')
      return formatDate != 'Invalid date' ? formatDate : '-'
    }

    function getNum(type){
      if(type != 'total'){
        return props.requests.filter(l => l.status == type).length
      }
      return props.requests.length
    }

    const sortingDirection = ref('asc');
    const currentField = ref('');

    function sortData(field) {
        sortingDirection.value = currentField.value === field ? (sortingDirection.value === 'asc' ? 'desc' : 'asc') : 'asc';
        currentField.value = field;
        sorter.sort(props.requests, currentField.value, sortingDirection.value);
    }



    return {
      user,
      handleLessonClick,
      formatDate,
      getNum,
      sortData
    }
  }
}
</script>

<style lang="scss" scoped>
@media (min-width: 768px){
  table {
    table-layout: fixed;
    width: 100%;
    thead {
      background-color: $ah-primary;
      color: white;
      tr {
        th {
          &:first-child {
            padding-left: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
          }
        }
      }
    }
    tbody {
      tr {
        border-bottom: 1px solid $ah-grey;
        &:hover {
          background-color: $ah-primary-background;
          cursor: pointer;
        }
        td {
          &:first-child {
            padding: 10px;
          }
        }
      }
    }
  }
  #table-body-section {
    max-height: calc(100vh - 200px);
    border-bottom: 5px solid $ah-primary;
  }
  .totals {
    display: inline-flex;
    align-items: flex-end;
    justify-content: space-between;
  }
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