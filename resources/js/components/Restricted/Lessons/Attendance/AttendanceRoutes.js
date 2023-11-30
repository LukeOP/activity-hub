import { useLessonsStore } from '/resources/js/stores/lessons'
import LessonAttendanceOverview from './Overview/AttendanceOverview.vue'
import LessonAttendanceReview from './Review/AttendanceReview.vue'


const attendanceRoutes = [
  // Lesson Attendance
  { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, props: true, meta: { title: 'Attendance Overview', breadcrumb: ' / Attendance Overview', section: "Lessons", depth: 2}, 
  beforeEnter: (to, from, next) => {
    const lessonStore = useLessonsStore()
    if(Object.keys(lessonStore.getLessonsData) === 0) next({ name: 'LessonsList'})
    else next()}},
  { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, props: true, meta: { title: 'Attendance Review', breadcrumb: ' / Attendance Review', section: "Lessons", depth: 3} },
] 
export default attendanceRoutes;
