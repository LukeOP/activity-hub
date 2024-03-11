<template>
  <span>
    <div id="lesson-details" class="section row" >
      <h2 class="heading2">Lesson Details:</h2>
      <div class="col col-12 col-sm-6 col-md-3">
        <AttendanceSnapshot :lesson="lessonStore.getLessonData" @click="handleAttendanceClick" />
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <div><h3>Status:</h3>
          <span :class="lessonStore.getLessonData.attributes.status.toLowerCase()">{{lessonStore.getLessonData.attributes.status}}</span>
        </div>
        <div><h3>Tutor:</h3>
        {{lessonStore.getLessonData.tutor.full_name}}</div>
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <div>
          <h3>Lesson Day:</h3>
          <span v-if="lessonStore.getLessonData.attributes.day != 'Not Set'">{{lessonStore.getLessonData.attributes.day}}</span>
        </div>
        <div><h3>Lesson Time:</h3>
          <span v-if="lessonStore.getLessonData.attributes.start != null">
            {{convertTime(lessonStore.getLessonData.attributes.start)}}
            <span v-if="lessonStore.getLessonData.attributes.end"> - {{convertTime(lessonStore.getLessonData.attributes.end)}}</span>
          </span>
        </div>
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <div v-if="lessonStore.getLessonData.attributes.funding_type"><h3>Funding:</h3>
        {{lessonStore.getLessonData.attributes.funding_type}}</div>
        <div><h3>Start Date:</h3>
        {{convertDate(lessonStore.getLessonData.attributes.startDate)}}</div>
        <div v-if="lessonStore.getLessonData.attributes.endDate"><h3>End Date:</h3>
        {{convertDate(lessonStore.getLessonData.attributes.endDate)}}</div>
      </div>
      <div class="col col-12 col-sm-6 col-md-3" v-if="lessonStore.getLessonData.location">
        <span><h3>Location:</h3>
        {{lessonStore.getLessonData.location.room_name}}</span>
      </div>
    </div>

    <div class="checklist" v-if="lessonStore.getLessonData.attributes.status === 'Pending' && closedChecklist != true">
      <div class="heading" >Complete Lesson Setup
          <i @click="closeChecklist" class="close-icon" v-html="icons.xmark"></i></div>
      <div v-for="option in setupOptions" :key="option.text" class="setup-option" @click="modal.open('EditLesson')">
        <span class="icon">
          <StatusIconSVG :status="option.status === 'pending' ? 'pending' : 'complete'" />
        </span>
        {{ option.text }}
      </div>
      <button class="btn btn-green w-100" style="border-radius: 0 0 0.375rem 0.375rem;" @click="markActive()" :disabled="isSetupPending">Mark as Active</button>
    </div>

  </span>

</template>

<script setup>
import moment from 'moment'
import AttendanceSnapshot from '../Attendance/Components/AttendanceSnapshot.vue'
import { useRouter } from 'vue-router';
import StatusIconSVG from '/resources/js/components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import { useModalStore } from '/resources/js/stores/modal';
import axiosClient from '/resources/js/axios';
import { computed, ref } from 'vue';
import { useLessonsStore } from '/resources/js/stores/lessons';
import { useToastStore } from '/resources/js/stores/toast';
import { icons } from '@/images/icons/icons'

const modal = useModalStore()
const toast = useToastStore()
const lessonStore = useLessonsStore()
const router = useRouter()
const closedChecklist = ref(false)

const setupOptions = computed(() => [
  { text: 'Set Lesson Day', status: lessonStore.getLessonData.attributes.day == null ? 'pending' : 'complete' },
  { text: 'Set Lesson Time', status: lessonStore.getLessonData.attributes.start == null ? 'pending' : 'complete' },
  { text: 'Set Start Date', status: lessonStore.getLessonData.attributes.startDate == null ? 'pending' : 'complete' },
]);

const isSetupPending = computed(() => {
  const lessonData = lessonStore.getLessonData.attributes;
  return lessonData.day == null || lessonData.start == null || lessonData.startDate == null;
});


function convertTime(time) {
    return moment(time, 'HH:mm:ss').format('h:mm A');
}
function convertDate(date) {
    return moment(date).format('LL') != 'Invalid date' ? moment(date).format('LL') : ' ';
}
function handleAttendanceClick(){
  router.push({name: 'LessonAttendanceSingle'})
}

function markActive(){
  modal.open('LessonConfirmActive')
}
function closeChecklist(){
  closedChecklist.value = true
}
</script>

<style lang="scss" scoped>
.section {
  padding: 10px;
  border-bottom: 1px dashed $ah-primary;
}
.checklist {
  position: fixed;
  bottom: 50%;
  right: 10px;
  transform: translateY(50%);
  width: 250px;
  box-shadow: 0px 10px 20px $ah-grey;
  background-color: white;
  border-radius: 0.375rem;

  .heading {
    padding: 5px 10px; 
    border-bottom: 1px solid grey;
    font-size: 1.2rem;
  }
}
.setup-option {
  padding: 5px 10px;
  &:hover {
    background-color: $ah-primary-background;
    cursor: pointer;
  }
}
.icon {
  display: inline-block;
  width: 30px;
}
.close-icon {
  float: inline-end;
  width: 20px;
  fill: $ah-grey;
  &:hover {
    fill: $ah-primary;
  }
}

@media (max-width: 768px){
  .checklist {
    bottom: 10px;
    left: 0;
    transform: none;
    width: 100%;
  }
}

</style>