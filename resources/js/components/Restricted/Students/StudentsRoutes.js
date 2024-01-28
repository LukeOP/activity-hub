import StudentsList from './StudentsList.vue'
import StudentDetails from './StudentDetails.vue'
import { useStudentStore } from '/resources/js/stores/students'
import StudentsBulkUpdate from './StudentsBulkUpdate.vue'
import { useUserStore } from '/resources/js/stores/user'


const studentsRoutes = [
  {path: 'students', meta: {breadcrumb: "Students"},
      children: [
        { path: '', name: 'StudentsList', component: StudentsList, meta: { title: 'Students', section: "Students", depth: 1} },
        { path: 'details', name: 'StudentDetails', component: StudentDetails, meta: { title: 'Student Details', breadcrumb: ' / Details', section: "Students", depth: 2},
        beforeEnter: [
          () => checkPermission('STUDENTS_V', 'StudentsList'),
          () => checkStudentObject()
        ]},
        { path: 'bulk-update', name: "StudentsBulkUpdate", component: StudentsBulkUpdate, meta: { title: 'Bulk Update Students', breadcrumb: ' / Bulk Update', section: 'Students', depth: 2},
          beforeEnter: () => checkPermission('Administrator', 'StudentsList')}
    ]},
] 

function checkPermission(permission, redirect){
  const user = useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkStudentObject(){
  const studentStore = useStudentStore()
  if(Object.keys(studentStore.getStudent) == 0) return { name: 'StudentsList'}
  else return true
}

export default studentsRoutes;