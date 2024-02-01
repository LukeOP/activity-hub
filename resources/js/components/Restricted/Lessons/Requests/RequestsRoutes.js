// Lesson Requests
import RequestReview from './RequestReview.vue'
import RequestsList from './RequestsList.vue'
import RequestFormList from './RequestForms/RequestFormsList.vue'
import RequestFormDetails from './RequestForms/FormDetails.vue'
import FormPreview from './RequestForms/FormPreview.vue'



import { useLessonsStore } from '/resources/js/stores/lessons'
import { useUserStore } from '/resources/js/stores/user'


const requestRoutes = [
  { path: 'requests', meta: { title: 'Lesson Requests', breadcrumb: 'Requests'},
    children: [
      { path: '', name: 'RequestsList', component: RequestsList, meta: {section: "Lessons", depth: 2}},
      { path: 'review', name: 'LessonRequestReview', component: RequestReview, meta: {breadcrumb: ' / Review', section: "Lessons", depth: 3}, 
        beforeEnter: () => checkLessonObject('LessonsList')},
      { path: 'forms', meta: {breadcrumb: "Forms"},
        children: [
          { path: '', name: 'RequestFormsList', component: RequestFormList, meta: {section: "Lessons", depth: 3}},
          { path: 'details',  meta: {breadcrumb: 'Details'},
            children: [
              { path: '', name: 'RequestFormDetails', component: RequestFormDetails, meta: {section: "Lessons", depth: 4}},
              { path: 'preview', name: 'RequestFormPreview', component: FormPreview, meta: {section: "Lessons", breadcrumb: ' / Preview', depth: 5}}
            ],
            beforeEnter: () => checkLessonObject('LessonsList')
          }, 
        ]}
      ],
    beforeEnter: () => checkPermission('LESSON_REQ_V', 'LessonsList')
  }
] 

function checkPermission(permission, redirect){
  const user = useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkLessonObject(redirect){
  const lessonStore = useLessonsStore()
  if(Object.keys(lessonStore.getRequestForm) == 0) return { name: redirect}
  else return true
}
export default requestRoutes;
