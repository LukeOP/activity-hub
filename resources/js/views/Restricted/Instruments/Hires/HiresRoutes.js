import { useUserStore } from '/resources/js/stores/user'
import { useHireStore } from '/resources/js/stores/hires'

import HiresList from './HiresList.vue'
import HireDetails from './HireDetails.vue'
import HireFormList from './HireForms/HireFormList.vue'
import HireAgreementTemplateDetails from './HireForms/TemplateDetails.vue'


const hireRoutes = [
  {path: 'hire', meta: {breadcrumb: "Hires", breadcrumb: "Hires"},
    children: [
      { path: '', name: 'HiresList', component: HiresList, meta: { title: 'Hires', section: "Instruments", depth: 2}},
      // Single Hire Details
      { path: 'details', name: 'HireDetails', component: HireDetails, meta: { title: 'Hire Details', breadcrumb: ' / Details', section: "Instruments", depth: 3},
          beforeEnter: () => checkHireObject('HiresList')},
      {path: 'templates', meta: { title: 'Hire Agreement Templates', breadcrumb: 'Templates'},
        children: [
          { path: '', name: 'HireFormList', component: HireFormList, meta: { section: "Instruments", depth: 4} },
          { path: 'details', name: 'HireAgreementTemplateDetails', component: HireAgreementTemplateDetails, meta: { section: "Instruments", breadcrumb: ' / Details', depth: 5},
              beforeEnter: () => checkPermission('HIRES_TEMP_V', 'HireFormList')},
        ]
      },
    ],
    beforeEnter: () => checkPermission('HIRES_V', 'Dashboard')
  },
] 

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkHireObject(redirect){
  const hireStore = useHireStore()
  if(Object.keys(hireStore.getHire) == 0) return { name: redirect}
  else return true
}

export default hireRoutes;