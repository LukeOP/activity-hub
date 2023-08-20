import StaffTable from '../../components/Restricted/Staff/StaffTable.vue'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff', breadcrumb: 'Staff'}, redirect: 'StaffTable',
      children: [
        { path: '', name: 'StaffTable', component: StaffTable, meta: { title: 'Staff'}}
  ]},
] 

export default staffRoutes;