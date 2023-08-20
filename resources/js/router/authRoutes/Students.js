import StudentsTable from '../../components/Restricted/Students/StudentsTable.vue'


const studentsRoutes = [
  {path: 'students', name: 'Students', meta: { title: 'Students', breadcrumb: 'Students'},
      children: [
        { path: '', name: 'StudentsTable', component: StudentsTable },
  ]},
] 

export default studentsRoutes;