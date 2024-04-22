// Lessons
import LessonsList from './LessonsList.vue'
import LessonDetails from './LessonDetails.vue'
import LessonCreate from './LessonCreate.vue'
import LessonNotes from './LessonNotes.vue'

import requestRoutes from './Requests/RequestsRoutes'
import plannerRoutes from './Planner/PlannerRoutes'

import { useLessonsStore } from '/resources/js/stores/lessons'
import { useUserStore } from '/resources/js/stores/user'
import { usePermissions } from '../../../composables/usePermissions'
import { useSchoolPermissions } from '../../../composables/useSchoolPermissions'



const lessonsRoutes = [
  {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons', breadcrumb: 'Lessons', section: "Lessons"},
    children: [
      // Lesson Lists
      { path: '', name: 'LessonsList', component: LessonsList, meta: {breadcrumb: ' List', section: "Lessons", depth: 1},
      beforeEnter: () => {
          const { checkPermissions } = usePermissions()
          return checkPermissions(['LESSONS_R', 'LESSONS_V']) ? true : {name: 'Dashboard'}
        }},

      // Lesson Details
      { path: 'details', meta: {breadcrumb: 'Details'}
        , children: [
          { path: '', name: 'LessonDetails', component: LessonDetails, meta: {title: 'lesson Details', section: "Lessons", depth: 2}},
          { path: 'notes', name: 'LessonNotes', component: LessonNotes, meta: { title: 'Lesson Notes', breadcrumb: ' / Notes', section: "Lessons", depth: 3 } },
        ], beforeEnter: [
          () => checkLessonObject('LessonsList') ,
          () => checkUserHasSchoolPermission(['LESSONS_R', 'LESSONS_V'])
        ]},

      // Create Lessons
      { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson', breadcrumb: ' / Create New', section: "Lessons", depth: 2},
        beforeEnter: () => checkPermission('LESSONS_C', 'LessonsList') },

      // Lesson Requests
      ...requestRoutes,

      // Planner Routes
      ...plannerRoutes
    ],
    beforeEnter: () => {
      const { checkPermissions } = usePermissions()
      return checkPermissions(['LESSONS_R', 'LESSONS_V']) ? true : {name: 'Dashboard'}
    }
  },
] 

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkLessonObject(redirect){
  const lessonStore = useLessonsStore()
  if(!lessonStore.getLessonData) return { name: redirect}
  else return true
}

function checkUserHasSchoolPermission(permissionsArray){
  const lessonStore = useLessonsStore()
  const { checkSchoolPermissions } = useSchoolPermissions()
  return checkSchoolPermissions(permissionsArray, lessonStore.getLessonData.school.id) ? true : {name: 'LessonsList'}
}

export default lessonsRoutes;
