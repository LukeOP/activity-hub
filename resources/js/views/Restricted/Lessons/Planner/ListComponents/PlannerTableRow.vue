<template>
    <tr v-for="lesson in dayLessons" :key="lesson" @click="lessonClick(lesson)" :class="{redText: getLessonAttendance(lesson.attendance) === 'incomplete'}">
        <td id="category" style="width: 80px;">
            <i class="fa-solid fa-circle" :class="{own: lesson.tutor.id == user.attributes.id, school: lesson.tutor.id != user.attributes.id}"></i>
        </td>
        <td>{{ formatTime(lesson.attributes.start) }} - {{ formatTime(lesson.attributes.end) }}</td>
        <td>{{ lesson.student.full_name }}</td>
        <td>{{ lesson.attributes.instrument }}</td>
        <!-- <td>{{ lesson.school.room }}</td> -->
        <td>{{ lesson.tutor.full_name }}</td>
        <td class="icons" style="width: 50px; height: 50px;"><StatusIconSVG :status="getLessonAttendance(lesson.attendance)" />
        </td>
    </tr>
</template>

<script setup>
import moment from 'moment';
import { useUserStore } from '../../../../../stores/user';
import StatusIconSVG from '../../../../../components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import { useLessonsStore } from '../../../../../stores/lessons';
import { useModalStore } from '../../../../../stores/modal';
import { useAppStore } from '../../../../../stores/appStore';

const lessonStore = useLessonsStore()
const appStore = useAppStore()
const props = defineProps({dayLessons: Array, date: Object})
const user = useUserStore()
const modal = useModalStore()

function getLessonAttendance(attendanceArray){
  let response = 'pending'
  let currentDate = moment(props.date).format('YYYY-MM-DD')
  if(attendanceArray.length > 0){
    attendanceArray.find(a => a.date === currentDate) 
    ? response = attendanceArray.find(a => a.date === currentDate).attendance 
    : response = 'pending'
  }
  if(currentDate > moment().format('YYYY-MM-DD')) response = 'pending'
  return response
}

function formatTime(date){
  return moment(date, 'hh:mm:ss').format('hh:mma')
}

function lessonClick(lesson){
  appStore.setItems({date: props.date})
  lessonStore.setLesson(lesson.id)
  modal.open('LessonPlannerClick')
}

</script>

<style lang="scss" scoped>
.own {
    color: $ah-primary;
  }
.school {
    color: $ah-grey;
  }
.icons {
  justify-content: center;
}
.redText {
  background-color: #fdefef;
  color: #C50023;
  &:hover {
  background-color: #fde0e0;
  }
}
</style>