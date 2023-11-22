// Lessons
import LessonsList from './LessonsList.vue'
import LessonDetails from './LessonDetails.vue'
import LessonCreate from './LessonCreate.vue'
import LessonEdit from './Modals/LessonEdit.vue'
import LessonCreateNote from './Modals/Notes/LessonCreateNote.vue'
import LessonNotes from './LessonNotes.vue'
import LessonConfirmActive from './Modals/LessonConfirmActive.vue'
import LessonDateTime from './Modals/LessonDateTime.vue'

// Attendance
import attendanceRoutes from './Attendance/AttendanceRoutes'
import LessonAttendanceSingle from './Attendance/SingleLesson/AttendanceSingleDetails.vue'

// Lesson Requests
import RequestReview from './Requests/RequestReview.vue'
import RequestsList from './Requests/RequestsList.vue'
import RequestFormList from './Requests/RequestForms/RequestFormsList.vue'
import RequestFormDetails from './Requests/RequestForms/FormDetails.vue'
import FormPreview from './Requests/RequestForms/FormPreview.vue'



import { useLessonsStore } from '/resources/js/stores/lessons'


const lessonsRoutes = [
  {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons', breadcrumb: 'Lessons', section: "Lessons"},
      children: [
        // Lesson Lists
        { path: '', name: 'LessonsList', component: LessonsList, meta: {breadcrumb: ' List', section: "Lessons", depth: 1}},

        // Lesson Details
        { path: 'details', meta: {breadcrumb: 'Details'},
          beforeEnter: (to, from, next) => {
            const lessonStore = useLessonsStore()
            if(Object.keys(lessonStore.getLessonData) == 0) next({ name: 'LessonsList'})
            else next()
          }, children: [
            { path: '', name: 'LessonDetails', component: LessonDetails, props: true, meta: {title: 'lesson Details', section: "Lessons", depth: 2}, children: [
                { path: 'edit', name: 'LessonEdit', component: LessonEdit, props: true, meta: { title: 'Edit Lesson', showModal: true} },
                { path: 'create-note', name: 'LessonCreateNote', component: LessonCreateNote, props: true, meta: { title: 'Create Note Lesson', showModal: true} },
                { path: 'confirm-active', name: 'LessonConfirmActive', component: LessonConfirmActive, props: true, meta: { title: 'Lesson Details', showModal: true} },
                { path: 'confirm-date-time', name: 'LessonDateTime', component: LessonDateTime, props: true, meta: { title: 'Lesson Date and Time', showModal: true} },
            ]},
            // View Notes
            { path: 'notes', name: 'LessonNotes', component: LessonNotes, props: true, meta: { title: 'Lesson Notes', breadcrumb: ' / Notes', section: "Lessons", depth: 3 } },
            // View Single Lesson Attendance
            { path: 'attendance', name: 'LessonAttendanceSingle', component: LessonAttendanceSingle, props: true, meta: { title: 'Lesson Attendance', breadcrumb: ' / Attendance', section: "Lessons", depth: 3} },
          ] },

        // Create Lessons
        { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson', breadcrumb: ' / Create New', section: "Lessons", depth: 2} },

        // Lesson Attendance
        ...attendanceRoutes,

        // Lesson Requests
        { path: 'requests', meta: { title: 'Lesson Requests', breadcrumb: 'Requests'},
          children: [
              { path: '', name: 'RequestsList', component: RequestsList, meta: {section: "Lessons", depth: 2}},
              { path: 'review', name: 'LessonRequestReview', component: RequestReview, meta: {breadcrumb: ' / Review', section: "Lessons", depth: 3}, 
              beforeEnter: (to, from, next) => {
                const lessonStore = useLessonsStore()
                if(Object.keys(lessonStore.getRequest) == 0) next({ name: 'RequestsList'})
                else next() }},

              { path: 'forms', meta: {breadcrumb: "Forms"},
                children: [
                  { path: '', name: 'RequestFormsList', component: RequestFormList, meta: {section: "Lessons", depth: 3}},
                  { path: 'details',  meta: {breadcrumb: 'Details'},
                  beforeEnter: (to, from, next) => {
                    const lessonStore = useLessonsStore()
                    if(Object.keys(lessonStore.getRequestForm) == 0) next({ name: 'RequestFormsList'})
                    else next()
                  }, children: [
                    { path: '', name: 'RequestFormDetails', component: RequestFormDetails, meta: {section: "Lessons", depth: 4}},
                    { path: 'preview', name: 'RequestFormPreview', component: FormPreview, meta: {section: "Lessons", breadcrumb: ' / Preview', depth: 5}}
                  ]},
                ]}
          ]}
  ]},
] 
export default lessonsRoutes;
