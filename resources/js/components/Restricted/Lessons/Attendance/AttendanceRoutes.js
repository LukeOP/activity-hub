import { useLessonsStore } from '/resources/js/stores/lessons'
import LessonAttendanceOverview from './Overview/AttendanceOverview.vue'
import LessonAttendanceReview from './Review/AttendanceReview.vue'
import { useUserStore } from '/resources/js/stores/user'


const attendanceRoutes = [
  { path: 'attendance', meta: { title: 'Lesson Attendance', breadcrumb: 'Attendance'},
    children: [
      { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, meta: { title: 'Attendance Overview', breadcrumb: ' / Attendance Overview', section: "Lessons", depth: 2}, 
      beforeEnter: () => checkLessonObject('LessonsList')},
      { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, meta: { title: 'Attendance Review', breadcrumb: ' / Attendance Review', section: "Lessons", depth: 3} },
    ],
    beforeEnter: () => checkPermission('ATTENDANCE_V', 'Dashboard')
  }
] 

function checkPermission(permission, redirect){
  const user = useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkLessonObject(redirect){
  const lessonStore = useLessonsStore()
  if(Object.keys(lessonStore.getLessonsData) == 0) return { name: redirect}
  else return true
}
export default attendanceRoutes;
