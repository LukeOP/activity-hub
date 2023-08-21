import StaffList from '../../components/Restricted/Staff/StaffList.vue'
import StaffDetails from '../../components/Restricted/Staff/StaffDetails.vue'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff', breadcrumb: 'Staff'}, redirect: 'StaffList',
      children: [
        { path: '', name: 'StaffList', component: StaffList, meta: { title: 'Staff'}},
        { path: 'details', name: 'StaffDetails', component: StaffDetails, meta: { title: 'Staff Details', breadcrumb: ' > Details'}},
  ]},
] 

export default staffRoutes;