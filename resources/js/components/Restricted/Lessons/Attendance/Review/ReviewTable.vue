<template>
  <div>
    <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th style="width:10%">Date:</th>
          <th style="width:10%">Time:</th>
          <th style="width:15%">Student:</th>
          <th style="width:10%">Instrument:</th>
          <th style="width:15%; text-align:center">Attendance:</th>
          <th style="width:15%">Tutor:</th>
          <th style="width:20%">School</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto" v-if="lessons.length > 0">
    <table>
      <tbody>
        <tr v-for="record in lessons" :key="record">
          <td style="width:10%">{{record.lesson.date}}</td>
          <td style="width:10%">{{record.lesson.time}}</td>
          <td style="width:15%">{{record.student.full_name}}</td>
          <td style="width:10%">{{record.lesson.instrument}}</td>
          <td style="width:15%; text-align:center; padding-left:10px; padding-right:10px"><span class="attendance" :class="record.lesson.attendance">{{capitalizeFirstLetter(record.lesson.attendance)}}</span></td>
          <td style="width:15%">{{record.tutor.full_name}}</td>
          <td style="width:20%">{{record.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>
  <section v-else>
    <p id="no-records">No records for this time period</p>
  </section>
  </div>
</template>

<script setup>
const props = defineProps({lessons:Array})

function capitalizeFirstLetter(string){
  return string.charAt(0).toUpperCase() + string.slice(1)
}

</script>

<style lang="scss" scoped>
#no-records {
  width: 100%;
  text-align: center;
  padding-top: 20px;
  padding-bottom: 20px;
  font-size: 1.25rem;
  color: $ah-primary;
  border-bottom: 2px solid $ah-primary;
}
.attendance {
  display: block;
  text-align: center;
  width: 100%;
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

</style>