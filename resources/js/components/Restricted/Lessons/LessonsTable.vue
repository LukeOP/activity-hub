<template>
  <h1>Lessons:</h1>
  <div v-if="lessons">
    <!-- <pre>
      {{user.attributes}}
    </pre> -->
    <table role="table" id="lesson-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
        <th role="columnheader" @click="sortData('student.last_name')" style="width: 1%">Student Name:</th>
        <th role="columnheader" @click="sortData('student.year_level')">Year:</th>
        <th role="columnheader" @click="sortData('attributes.instrument')">Instrument:</th>
        <th role="columnheader" @click="sortData('attributes.day')">Lesson Day:</th>
        <th role="columnheader" @click="sortData('attributes.start')">Time:</th>
        <th role="columnheader" @click="sortData('tutor.last_name')" class="d-none d-md-table-cell">Tutor:</th>
        <th role="columnheader" @click="sortData('attributes.funding_type')" class="d-none d-md-table-cell">Funding:</th>
        <th role="columnheader" @click="sortData('attributes.status')" class="d-none d-md-table-cell">Status:</th>
        <th role="columnheader" @click="sortData('school.name')" class="d-none d-md-table-cell" v-if="user.attributes.schools">School:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="lesson-data">
        <tr role="row" class="lesson-row" v-for="lesson in lessons" :key="lesson.id" @click="handleLessonClick(lesson)">
          <td role="cell">{{lesson.student.first_name}} {{lesson.student.last_name}}</td>
          <td role="cell"><span v-if="lesson.student.year_level">{{lesson.student.year_level}}</span></td>
          <td role="cell">{{lesson.attributes.instrument}}</td>
          <td role="cell"><span v-if="lesson.attributes.day != 'Not Set'">{{lesson.attributes.day}}</span></td>
          <td role="cell"><span v-if="lesson.attributes.start != null">{{formatTime(lesson.attributes.start)}}</span></td>
          <td role="cell" class="d-none d-md-table-cell">{{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</td>
          <td role="cell" class="d-none d-md-table-cell"><span class="special"
          :class="{
            secondary: lesson.attributes.funding_type === 'Funded', 
            primary: lesson.attributes.funding_type === 'Private'}"
            >{{lesson.attributes.funding_type}}</span></td>
          <td role="cell" class="d-none d-md-table-cell"><span class="special" 
          :class="{
            green: lesson.attributes.status === 'Active', 
            primary: lesson.attributes.status === 'Waiting', 
            secondary: lesson.attributes.status === 'Pending'}"
            >{{lesson.attributes.status}}</span></td>
          <td role="cell" class="d-none d-md-table-cell" v-if="user.attributes.schools">{{lesson.school.name}}</td>
        </tr>
      </tbody>
    </table>
    <div>
      <span class="tally">Total: {{getNum('total')}}</span>
      <span class="tally">Active: {{getNum('Active')}}</span>
      <span class="tally">New/Pending: {{getNum('Pending')}}</span>
      <span class="tally">Waiting List: {{getNum('Waiting')}}</span>
    </div>
  </div>
  
</template>
<script>
import { onMounted, ref } from 'vue'
import axiosClient from '../../../axios'
import { useRouter } from 'vue-router'
 
import moment from 'moment'
import { useUserStore } from '../../../stores/user'
import useSorter from '../../../composables/useSorter'

export default {
  setup(){
    const router = useRouter()
    const sorter = useSorter()
     
    const lessons = ref()
    const user = useUserStore()

    function handleLessonClick(lesson){
      general.setRouteData({lesson: lesson})
      router.push({
        name: 'LessonDetails',
        params: {
          id: lesson.id
        }
      })
    }

    function setActions(){
      const actions = [
        { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
        { header: 'Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
      ]
      actions.setItems(actions)
    }

    function formatTime(time){
      return moment(time, 'HH:mm:ss').format('h:mm A')
    }

    function getNum(type){
      if(type != 'total'){
        return lessons.value.filter(l => l.attributes.status == type).length
      }
      return lessons.value.length
    }

    function sortData(field){
      sorter.sort(lessons.value, field)
    }

    onMounted(() => {
      axiosClient.get('lessons').then(res => {
        lessons.value = res.data.data
        setActions()
      })
    })

    return {
      user,
      lessons,
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
  #lesson-table {
    width:100%;
    // overflow-y: scroll;
    display: block;
    table-layout: fixed;
    border-bottom: 2px solid $ah-primary;
    .table-heading {
      background-color: $ah-primary;
      color: white;
      border-radius: 10px 10px 0 0;
      th {
        padding: 10px;
        width: auto;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
    }
    #lesson-data{
      .lesson-row {
        border-bottom: thin solid rgb(209, 209, 209);
        td {
          padding: 10px;
          width: auto;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          .special {
            display: table;
            padding: 10px 10px;
            border-radius: 15px;
            width: 73px;
            text-align: center;
          }
        }
        &:hover {
          background-color: lighten($ah-primary, 60%);
          cursor: pointer;
          td {
            color: $ah-primary-dark;
          }
        }
      }
    }
  }
  .tally {
    margin-right: 2rem;
  }
  thead, tbody, tfoot, tr, td, th {
    width: 100%;
  }
  .green {
    background-color: $ah-green-light;
    color: white;
  }
  .secondary {
    background-color: $ah-secondary-light;
    color: darken($ah-secondary-dark, 40%);
  }
  .primary {
    background-color: $ah-primary-light;
    color: white;
  }
  tr:nth-child(even) {
    background-color: lighten($ah-primary, 60%);
  }
}

	@media
	  only screen 
    and (max-width: 760px), (min-device-width: 768px) 
    and (max-device-width: 1024px)  {

		/* Force table to not be like tables anymore */
		table, thead, tbody, th, td, tr {
			display: block;
		}

		/* Hide table headers (but not display: none;, for accessibility) */
		thead tr {
			position: absolute;
			top: -9999px;
			left: -9999px;
		}

    tr {
      margin: 0 0 1rem 0;
    }
      
    tr:nth-child(odd) {
      background-color: lighten($ah-primary, 60%);
      padding-top: 5px;
      padding-bottom: 5px;
    }
    
		td {
			/* Behave  like a "row" */
			border: none;
			/* border-bottom: 1px solid #eee; */
			position: relative;
			padding-left: 50%;
		}

		td:before {
			/* Now like a table header */
			position: absolute;
			/* Top/left values mimic padding */
			top: 0;
			left: 6px;
			width: 45%;
			padding-right: 10px;
			white-space: nowrap;
      font-weight: bold;
		}

		/*
		Label the data
    You could also use a data-* attribute and content for this. That way "bloats" the HTML, this way means you need to keep HTML and CSS in sync. Lea Verou has a clever way to handle with text-shadow.
		*/
		td:nth-of-type(1):before { content: "Student Name"; }
		// td:nth-of-type(2):before { content: "Year"; }
		td:nth-of-type(3):before { content: "Instrument"; }
		td:nth-of-type(4):before { content: "Lesson Day"; }
		td:nth-of-type(5):before { content: "Time"; }
		td:nth-of-type(6):before { content: "Tutor"; }
		td:nth-of-type(7):before { content: "Funding"; }
		td:nth-of-type(8):before { content: "Status"; }
	}

</style>