<template>
  <div id="lesson-details" class="section row">
    <h2 class="heading2">Lesson Details:</h2>
    <div class="col col-12 col-sm-6 col-md-3">
      <AttendanceSnapshot :lesson="lesson" @click="handleAttendanceClick" />
    </div>
    <div class="col col-12 col-sm-6 col-md-3">
      <div><h3>Status:</h3>
        <span :class="lesson.attributes.status.toLowerCase()">{{lesson.attributes.status}}</span>
      </div>
      <div><h3>Tutor:</h3>
      {{lesson.tutor.full_name}}</div>
    </div>
    <div class="col col-12 col-sm-6 col-md-3">
      <div>
        <h3>Lesson Day:</h3>
        <span v-if="lesson.attributes.day != 'Not Set'">{{lesson.attributes.day}}</span>
      </div>
      <div><h3>Lesson Time:</h3>
        <span v-if="lesson.attributes.start != null">
          {{convertTime(lesson.attributes.start)}}
          <span v-if="lesson.attributes.end"> - {{convertTime(lesson.attributes.end)}}</span>
        </span>
      </div>
    </div>
    <div class="col col-12 col-sm-6 col-md-3">
      <div><h3>Funding:</h3>
      {{lesson.attributes.funding_type}}</div>
      <div><h3>Start Date:</h3>
      {{convertDate(lesson.attributes.startDate)}}</div>
      <div v-if="lesson.attributes.endDate"><h3>End Date:</h3>
      {{convertDate(lesson.attributes.endDate)}}</div>
    </div>
    <div class="col col-12 col-sm-6 col-md-3" v-if="lesson.location">
      <span><h3>Location:</h3>
      {{lesson.location.room_name}}</span>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import AttendanceSnapshot from '../Attendance/AttendanceSnapshot.vue'
import { useRouter } from 'vue-router';

export default {
    props: {
        lesson: Object
    },
    setup() {
      const router = useRouter()
        function convertTime(time) {
            return moment(time, 'HH:mm:ss').format('h:mm A');
        }
        function convertDate(date) {
            return moment(date).format('LL') != 'Invalid date' ? moment(date).format('LL') : 'Not set';
        }
        function handleAttendanceClick(){
          router.push({name: 'LessonAttendanceSingle'})
        }
        return {
            convertTime,
            convertDate,
            handleAttendanceClick,
        };
    },
    components: { AttendanceSnapshot }
}
</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
h3 {
  font-size: 1rem;
  display: inline-block;
  color: $ah-primary-dark;
  font-weight: bold;
  margin-right: 0.3rem;
}
.section {
  padding: 10px;
  border-bottom: 1px dashed $ah-primary;
}

</style>