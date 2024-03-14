// Lessons
import LessonsList from './LessonsList.vue'
import LessonDetails from './LessonDetails.vue'
import LessonCreate from './LessonCreate.vue'
import LessonNotes from './LessonNotes.vue'

// Attendance
import attendanceRoutes from './Attendance/AttendanceRoutes'
import LessonAttendanceSingle from './Attendance/SingleLesson/AttendanceSingleDetails.vue'

import requestRoutes from './Requests/RequestsRoutes'

import { useLessonsStore } from '/resources/js/stores/lessons'
import { useUserStore } from '/resources/js/stores/user'
import { usePermissions } from '../../../composables/usePermissions'



const lessonsRoutes = [
  {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons', breadcrumb: 'Lessons', section: "Lessons"},
    children: [
      // Lesson Lists
      { path: '', name: 'LessonsList', component: LessonsList, meta: {breadcrumb: ' List', section: "Lessons", depth: 1}},

      // Lesson Details
      { path: 'details', meta: {breadcrumb: 'Details'}
        , children: [
          { path: '', name: 'LessonDetails', component: LessonDetails, meta: {title: 'lesson Details', section: "Lessons", depth: 2}},
          { path: 'notes', name: 'LessonNotes', component: LessonNotes, meta: { title: 'Lesson Notes', breadcrumb: ' / Notes', section: "Lessons", depth: 3 } },
          { path: 'attendance', name: 'LessonAttendanceSingle', component: LessonAttendanceSingle, meta: { title: 'Lesson Attendance', breadcrumb: ' / Attendance', section: "Lessons", depth: 3} },
        ], beforeEnter: () => checkLessonObject('LessonsList') },

      // Create Lessons
      { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson', breadcrumb: ' / Create New', section: "Lessons", depth: 2},
        beforeEnter: () => checkPermission('LESSONS_C', 'LessonsList') },

      // Lesson Attendance
      ...attendanceRoutes,

      // Lesson Requests
      ...requestRoutes,
    ],
    beforeEnter: () => {
      const { checkPermissions } = usePermissions()
      checkPermissions(['LESSONS_R', 'LESSONS_V'])
    }
  },
] 

// function checkPermissions(permissionsArray, redirect){
//   const user = useUserStore()
//   let permitted = false
//   permissionsArray.forEach(permission => {
//     if(user.hasPermissionAny(permission)){
//       permitted = true
//     }
//   });
//   return permitted == true ? true : { name: redirect}
// }

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkLessonObject(redirect){
  const lessonStore = useLessonsStore()
  if(Object.keys(lessonStore.getLessonData) == 0) return { name: redirect}
  else return true
}

export default lessonsRoutes;
