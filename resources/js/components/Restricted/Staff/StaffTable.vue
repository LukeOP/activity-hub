<template>
  <h1 style="display:inline">{{currentSchool.name}} Staff:</h1>
  <!-- <i class="fa-solid fa-arrows-rotate" placement="right" v-b-tooltip.hover title="Switch Schools" style="cursor:pointer"></i> -->
  <div v-if="staff">
    <!-- <pre>
      {{user.attributes}}
    </pre> -->
    <table role="table" id="staff-table">
      <thead role="rowgroup" id="table-head">
        <tr role="row" class="table-heading">
          <th role="columnheader" style="width: 20%">First:</th>
          <th role="columnheader" style="width: 20%">Last:</th>
          <th role="columnheader" style="width: 60%">Roles:</th>
        </tr>
      </thead>
      <tbody role="rowgroup" id="staff-data">
        <tr role="row" class="staff-row" v-for="individual in staff" :key="individual.id" @click="handleLessonClick(individual)">
          <td role="cell">{{individual.first_name}}</td>
          <td role="cell">{{individual.last_name}}</td>
          <td role="cell">
            <i class="fa-solid fa-star icon"></i>
            <i class="fa-solid fa-graduation-cap icon"></i>
            <!-- <i class="fa-solid fa-calendar-days icon"></i> -->
            <i class="fa-solid fa-gear icon"></i></td>
        </tr>
      </tbody>
    </table>
  </div>
  
</template>
<script>
import { onMounted, ref } from 'vue'
import axiosClient from '../../../axios'
import { useRouter } from 'vue-router'
 
import moment from 'moment'
import { useUserStore } from '../../../stores/user'

export default {
  setup(){
    const router = useRouter()
     
    const staff = ref()
    const user = useUserStore()
    const currentSchool = ref(user.attributes.schoolAdmin[0])

    function handleLessonClick(lesson){
      general.setRouteData({lesson: lesson})
      router.push({
        name: 'LessonDetails',
        params: {
          id: lesson.id
        }
      })
    }


    onMounted(() => {
      // currentSchool.value = user.attributes.schoolAdmin[0]
      // axiosClient.get('school-users/' + currentSchool.value.id).then(res => {
      //   staff.value = res.data.data
      // })
    })

    return {
      user,
      staff,
      currentSchool,
      handleLessonClick,
      // formatTime,
    }
  }

}
</script>

<style lang="scss" scoped>
@media (min-width: 768px){
  #staff-table {
    width:100%;
    // overflow-y: scroll;
    // display: block;
    table-layout: fixed;
    border-bottom: 2px solid $ah-primary;
    
    thead {
      width: 100%;
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
    }
    #staff-data{
      .staff-row {
        border-bottom: thin solid rgb(209, 209, 209);
        td {
          padding: 10px;
          width: auto;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          .icon{
            margin-right: 1rem;
            &:hover {
              color: $ah-secondary;
            }
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
		td:nth-of-type(1):before { content: "First Name"; }
		td:nth-of-type(2):before { content: "Last Name"; }
		td:nth-of-type(3):before { content: "Roles"; }
		// td:nth-of-type(4):before { content: "Lesson Day"; }
		// td:nth-of-type(5):before { content: "Time"; }
		// td:nth-of-type(6):before { content: "Tutor"; }
		// td:nth-of-type(7):before { content: "Funding"; }
		// td:nth-of-type(8):before { content: "Status"; }
	}

</style>