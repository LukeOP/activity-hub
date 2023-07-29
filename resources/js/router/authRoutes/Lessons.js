import LessonsTable from '../../components/Restricted/Lessons/LessonsTable.vue'
import LessonsList from '../../components/Restricted/Lessons/LessonsList.vue'
import LessonDetails from '../../components/Restricted/Lessons/LessonDetails.vue'
import LessonCreate from '../../components/Restricted/Lessons/LessonCreate.vue'
import LessonEdit from '../../components/Restricted/Lessons/Modals/LessonEdit.vue'
import LessonCreateNote from '../../components/Restricted/Lessons/Modals/LessonCreateNote.vue'
import LessonNotes from '../../components/Restricted/Lessons/Modals/LessonNotes.vue'
import LessonConfirmActive from '../../components/Restricted/Lessons/Modals/LessonConfirmActive.vue'
import LessonDateTime from '../../components/Restricted/Lessons/Modals/LessonDateTime.vue'

import LessonAttendance from '../../components/Restricted/Lessons/Attendance/Attendance.vue'
import LessonAttendanceSingle from '../../components/Restricted/Lessons/Attendance/AttendanceSingle.vue'
import LessonAttendanceOverview from '../../components/Restricted/Lessons/Attendance/AttendanceOverview.vue'
import LessonAttendanceReview from '../../components/Restricted/Lessons/Attendance/AttendanceReview.vue'


const lessonsRoutes = [
  {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons'},
      children: [
        { path: '', name: 'LessonsList', component: LessonsList },
        { path: ':id', children: [
          { path: '', name: 'LessonDetails', component: LessonDetails, props: true, meta: {title: 'lesson Details'}, children: [
            { path: 'edit', name: 'LessonEdit', component: LessonEdit, props: true, meta: { title: 'Edit Lesson', showModal: true} },
            { path: 'create-note', name: 'LessonCreateNote', component: LessonCreateNote, props: true, meta: { title: 'Create Note Lesson', showModal: true} },
            { path: 'notes', name: 'LessonNotes', component: LessonNotes, props: true, meta: { title: 'Lesson Notes', showModal: true} },
            { path: 'confirm-active', name: 'LessonConfirmActive', component: LessonConfirmActive, props: true, meta: { title: 'Lesson Details', showModal: true} },
            { path: 'confirm-date-time', name: 'LessonDateTime', component: LessonDateTime, props: true, meta: { title: 'Lesson Date and Time', showModal: true} },
          ]},
          { path: 'attendance', name: 'LessonAttendanceSingle', component: LessonAttendanceSingle, props: true, meta: { title: 'Lesson Attendance'} },
      ] },
      { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson'} },
      { path: 'attendance', name: 'LessonAttendance', component: LessonAttendance, children: [
        { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, props: true, meta: { title: 'Attendance Overview'} },
        { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, props: true, meta: { title: 'Attendance Review'} },
      ] },
  ]},
] 

export default lessonsRoutes;