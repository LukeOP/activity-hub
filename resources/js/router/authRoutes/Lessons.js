import LessonsTable from '../../components/Restricted/Lessons/LessonsTable.vue'
import LessonsList from '../../components/Restricted/Lessons/LessonsList.vue'
import LessonDetails from '../../components/Restricted/Lessons/LessonDetails.vue'
import LessonCreate from '../../components/Restricted/Lessons/LessonCreate.vue'
import LessonEdit from '../../components/Restricted/Lessons/Modals/LessonEdit.vue'
import LessonCreateNote from '../../components/Restricted/Lessons/Modals/Notes/LessonCreateNote.vue'
import LessonNotes from '../../components/Restricted/Lessons/Modals/Notes/LessonNotes.vue'
import LessonConfirmActive from '../../components/Restricted/Lessons/Modals/LessonConfirmActive.vue'
import LessonDateTime from '../../components/Restricted/Lessons/Modals/LessonDateTime.vue'

import LessonAttendance from '../../components/Restricted/Lessons/Attendance/Attendance.vue'
import LessonAttendanceSingle from '../../components/Restricted/Lessons/Attendance/AttendanceSingle.vue'
import LessonAttendanceOverview from '../../components/Restricted/Lessons/Attendance/AttendanceOverview.vue'
import LessonAttendanceReview from '../../components/Restricted/Lessons/Attendance/AttendanceReview.vue'

import RequestsList from '../../components/Restricted/Lessons/Requests/Requestslist.vue'
import RequestReview from '../../components/Restricted/Lessons/Requests/RequestReview.vue'


const lessonsRoutes = [
  {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons', breadcrumb: 'Lessons'},
      children: [
        // Lesson Lists
        { path: '', name: 'LessonsList', component: LessonsList, meta: {breadcrumb: ' List'}},

        // Lesson Details
        { path: ':id', meta: {breadcrumb: 'Details'}, children: [
            { path: '', name: 'LessonDetails', component: LessonDetails, props: true, meta: {title: 'lesson Details'}, children: [
                { path: 'edit', name: 'LessonEdit', component: LessonEdit, props: true, meta: { title: 'Edit Lesson', showModal: true} },
                { path: 'create-note', name: 'LessonCreateNote', component: LessonCreateNote, props: true, meta: { title: 'Create Note Lesson', showModal: true} },
                { path: 'notes', name: 'LessonNotes', component: LessonNotes, props: true, meta: { title: 'Lesson Notes', showModal: true} },
                { path: 'confirm-active', name: 'LessonConfirmActive', component: LessonConfirmActive, props: true, meta: { title: 'Lesson Details', showModal: true} },
                { path: 'confirm-date-time', name: 'LessonDateTime', component: LessonDateTime, props: true, meta: { title: 'Lesson Date and Time', showModal: true} },
            ]},
            { path: 'attendance', name: 'LessonAttendanceSingle', component: LessonAttendanceSingle, props: true, meta: { title: 'Lesson Attendance', breadcrumb: 'Attendance'} },
          ] },

        // Create Lessons
        { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson', breadcrumb: ' > Create New'} },

        // Lesson Attendance
        { path: 'attendance', name: 'LessonAttendance', component: LessonAttendance, children: [
            { path: 'overview', name: 'LessonAttendanceOverview', component: LessonAttendanceOverview, props: true, meta: { title: 'Attendance Overview', breadcrumb: 'Attendance Overview'} },
            { path: 'review', name: 'LessonAttendanceReview', component: LessonAttendanceReview, props: true, meta: { title: 'Attendance Review', breadcrumb: 'Attendance Review'} },
        ] },

        // Lesson Requests
        { path: 'requests', meta: { title: 'Lesson Requests', breadcrumb: 'Requests'},
          children: [
              { path: '', name: 'LessonRequests', component: RequestsList},
              { path: 'review', name: 'LessonRequestReview', component: RequestReview, meta: {breadcrumb: ' > Review'} },
          ]}
  ]},
] 

export default lessonsRoutes;