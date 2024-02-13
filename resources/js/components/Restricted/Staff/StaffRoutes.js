import StaffList from './StaffList.vue'
import StaffDetails from './StaffDetails.vue'
import { useStaffStore } from '/resources/js/stores/staff'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff', breadcrumb: 'Staff'}, redirect: 'StaffList',
      children: [
        { path: '', name: 'StaffList', component: StaffList, meta: { title: 'Staff', section: "Staff", depth: 1}},
        { path: 'details', name: 'StaffDetails', component: StaffDetails, meta: { title: 'Staff Details', breadcrumb: ' / Details', section: "Staff", depth: 2},
        beforeEnter: (to, from, next) => {
          const staffStore = useStaffStore()
          if(Object.keys(staffStore.getStaff) == 0) next({ name: 'StaffList'})
          else next()
        }},
  ]},
] 

export default staffRoutes;