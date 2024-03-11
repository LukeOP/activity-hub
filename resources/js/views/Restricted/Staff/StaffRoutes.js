import StaffList from './StaffList.vue'
import StaffDetails from './StaffDetails.vue'
import { useStaffStore } from '/resources/js/stores/staff'
import { useUserStore } from '/resources/js/stores/user'


const staffRoutes = [
  {path: 'staff', name: 'Staff', meta: { title: 'Staff', breadcrumb: 'Staff'}, redirect: 'StaffList',
    children: [
      { path: '', name: 'StaffList', component: StaffList, meta: { title: 'Staff', section: "Staff", depth: 1}},
      { path: 'details', name: 'StaffDetails', component: StaffDetails, meta: { title: 'Staff Details', breadcrumb: ' / Details', section: "Staff", depth: 2},
        beforeEnter: () => checkStaffObject('StaffList')},
    ],
    beforeEnter: () => checkPermission('STAFF_V')
  },
] 

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkStaffObject(redirect){
  const staffStore = useStaffStore()
  if(Object.keys(staffStore.getStaff) == 0) return { name: redirect}
  else return true
}

export default staffRoutes;