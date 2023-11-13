import LessonAttendance from './AttendanceList.vue'
import LessonAttendanceOverview from './Overview/AttendanceOverview.vue'
import LessonAttendanceReview from './Review/AttendanceReview.vue'


const attendanceRoutes = [
  // Lesson Attendance
  { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, props: true, meta: { title: 'Attendance Overview', breadcrumb: ' > Attendance Overview', section: "Lessons", depth: 2} },
  { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, props: true, meta: { title: 'Attendance Review', breadcrumb: ' > Attendance Review', section: "Lessons", depth: 2} },
] 
export default attendanceRoutes;
