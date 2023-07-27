<template>  
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('student.last_name')">Student Name:</th>
          <th @click="sortData('student.year_level')">Year:</th>
          <th @click="sortData('attributes.instrument')">Instrument:</th>
          <th @click="sortData('attributes.day')">Lesson Day:</th>
          <th @click="sortData('attributes.start')">Time:</th>
          <th @click="sortData('tutor.last_name')">Tutor:</th>
          <th @click="sortData('attributes.funding_type')">Funding:</th>
          <th @click="sortData('attributes.status')">Status:</th>
          <th @click="sortData('school.name')" v-if="user.user.schools">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="lesson in lessons" :key="lesson.id" @click="handleLessonClick(lesson)" :class="lesson.attributes.status">
          <td>{{lesson.student.first_name}} {{lesson.student.last_name}}</td>
          <td>{{lesson.student.year_level || '-'}}</td>
          <td>{{lesson.attributes.instrument}}</td>
          <td>{{lesson.attributes.day || '-'}}</td>
          <td>{{formatTime(lesson.attributes.start) || '-'}}</td>
          <td>{{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</td>
          <td><span :class="lesson.attributes.funding_type">{{lesson.attributes.funding_type || '-'}}</span></td>
          <td><span class="status" :class="lesson.attributes.status + '-td'">{{lesson.attributes.status}}</span></td>
          <td v-if="user.user.schools">{{lesson.school.name}}</td>
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
      lessonStore.setLesson({lesson: lesson})
      router.push({
        name: 'LessonDetails',
        params: {
          id: lesson.id
        }
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
    text-align: center;
    display: block;
    border-radius: 1rem;
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

// @media only screen 
//   and (max-width: 760px), (min-device-width: 768px) 
//   and (max-device-width: 1024px)  {

//   /* Force table to not be like tables anymore */
//   table, thead, tbody, th, td, tr {
//     display: block;
//   }

//   /* Hide table headers (but not display: none;, for accessibility) */
//   thead tr {
//     position: absolute;
//     top: -9999px;
//     left: -9999px;
//   }

//   tr {
//     margin: 0 0 1rem 0;
//   }
    
//   tr:nth-child(odd) {
//     background-color: lighten($ah-primary, 60%);
//     padding-top: 5px;
//     padding-bottom: 5px;
//   }
  
//   td {
//     /* Behave  like a "row" */
//     border: none;
//     /* border-bottom: 1px solid #eee; */
//     position: relative;
//     padding-left: 50%;
//   }

//   td:before {
//     /* Now like a table header */
//     position: absolute;
//     /* Top/left values mimic padding */
//     top: 0;
//     left: 6px;
//     width: 45%;
//     padding-right: 10px;
//     white-space: nowrap;
//     font-weight: bold;
//   }

//   /*
//   Label the data
//   You could also use a data-* attribute and content for this. That way "bloats" the HTML, this way means you need to keep HTML and CSS in sync. Lea Verou has a clever way to handle with text-shadow.
//   */
//   td:nth-of-type(1):before { content: "Student Name"; }
//   td:nth-of-type(2):before { content: "Year"; }
//   td:nth-of-type(3):before { content: "Instrument"; }
//   td:nth-of-type(4):before { content: "Lesson Day"; }
//   td:nth-of-type(5):before { content: "Time"; }
//   td:nth-of-type(6):before { content: "Tutor"; }
//   td:nth-of-type(7):before { content: "Funding"; }
//   td:nth-of-type(8):before { content: "Status"; }
//   td:nth-of-type(9):before { content: "School"; }
// }

</style>