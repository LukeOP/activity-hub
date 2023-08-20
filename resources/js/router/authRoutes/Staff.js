import StaffList from '../../components/Restricted/Staff/StaffList.vue'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff', breadcrumb: 'Staff'}, redirect: 'StaffList',
      children: [
        { path: '', name: 'StaffList', component: StaffList, meta: { title: 'Staff'}}
  ]},
] 

export default staffRoutes;