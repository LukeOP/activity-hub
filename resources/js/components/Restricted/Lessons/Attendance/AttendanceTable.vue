<template>
<div>
  <h3>Attendance Entries</h3>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th>Day:</th>
          <th>Date:</th>
          <th>Time:</th>
          <th>Attendance:</th>
          <th class="hide">Recorded By:</th>
          <th class="hide">Last Modified:</th>
          <th></th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y: auto;">
    <table>
      <tbody>
        <tr v-for="record in attendanceRecords" :key="record">
          <td>{{getDay(record.date)}}</td>
          <td>{{record.date}}</td>
          <td>{{record.time}}</td>
          <td><span class="attendance" :class="record.attendance">{{capitalizeFirstLetter(record.attendance)}}</span></td>
          <td class="hide">{{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</td>
          <td class="hide">{{formatModified(record.updated_at)}}</td>
          <td><i class="fa-solid fa-edit"></i></td>
        </tr>
      </tbody>
    </table>
  </section>
</div>
</template>

<script>
import moment from 'moment'
export default {
  props: {
    lesson: Object
  },
  setup(props){
    const attendanceRecords = props.lesson.attendance

    function capitalizeFirstLetter(string){
      return string.charAt(0).toUpperCase() + string.slice(1)
    }

    function getDay(date){
      return moment(date).format('dddd')
    }
    function formatModified(dateTime){
      return moment(dateTime).format('DD-MM-YYYY hh:mma')
    }

    return {
      attendanceRecords,
      capitalizeFirstLetter,
      getDay,
      formatModified,
    }
  }

}
</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
}
.attendance {
  display: block;
  text-align: center;
  width: 150px;
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  color: white;
}
.present {
  background-color: $ah-primary;
}
.late {
  background-color: $ah-secondary;
}
.absent {
  background-color: $ah-red-light;
}
.custom {
  background-color: $ah-green;
}

/* Styles for mobile */
@media (max-width: 768px) {
  .attendance {
    width: 100px;
  }
  .hide {
    display: none;
  }
}

</style>