import StudentsList from '../../components/Restricted/Students/StudentsList.vue'
import StudentDetails from '../../components/Restricted/Students/StudentDetails.vue'
import { useStudentStore } from '/resources/js/stores/students'


const studentsRoutes = [
  {path: 'students', meta: {breadcrumb: "Students"},
      children: [
        { path: '', name: 'StudentsList', component: StudentsList, meta: { title: 'Students', section: "Students", depth: 1} },
        { path: 'details', name: 'StudentDetails', component: StudentDetails, meta: { title: 'Student Details', breadcrumb: ' / Details', section: "Students", depth: 2},
          beforeEnter: (to, from, next) => {
            const studentStore = useStudentStore()
            if(Object.keys(studentStore.getStudent) == 0) next({ name: 'StudentsList'})
            else next()
          }
        },
    ]},
] 

export default studentsRoutes;