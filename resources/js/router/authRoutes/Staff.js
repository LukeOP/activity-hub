import StaffTable from '../../components/Restricted/Staff/StaffTable.vue'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff'},
      children: [
        { path: '', name: 'StaffTable', component: StaffTable },
  ]},
] 

export default staffRoutes;