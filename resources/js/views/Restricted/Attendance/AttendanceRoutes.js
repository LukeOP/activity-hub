import { useLessonsStore } from '/resources/js/stores/lessons'
import LessonAttendanceOverview from './Overview/AttendanceOverview.vue'
import LessonAttendanceReview from './Review/AttendanceReview.vue'
import LessonAttendanceSingle from './SingleLesson/AttendanceSingleDetails.vue'
import { useUserStore } from '/resources/js/stores/user'
import { usePermissions } from '../../../composables/usePermissions'


const attendanceRoutes = [
  { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, meta: { title: 'Attendance Overview', breadcrumb: ' / Attendance Overview', section: "Attendance", depth: 2}, 
  beforeEnter: [
    () => checkLessonObject('LessonsList'),
    () => {
    const { checkPermissions } = usePermissions()
    checkPermissions(['ATTENDANCE_R', 'ATTENDANCE_V'])
  }
  ]},
  { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, meta: { title: 'Attendance Review', breadcrumb: ' / Attendance Review', section: "Attendance", depth: 3} },
  { path: 'attendance', name: 'LessonAttendanceSingle', component: LessonAttendanceSingle, meta: { title: 'Lesson Attendance', breadcrumb: ' / Attendance', section: "Attendance", depth: 3},
  beforeEnter: [
    () => checkLessonObject('LessonsList'),
    () => {
    const { checkPermissions } = usePermissions()
    checkPermissions(['ATTENDANCE_R', 'ATTENDANCE_V'])
  }
  ]},
] 

function checkPermission(permission, redirect){
  const user = useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkLessonObject(redirect){
  const lessonStore = useLessonsStore()
  if(lessonStore.getLessonsData.length == 0) return { name: redirect}
  else return true
}
export default attendanceRoutes;
