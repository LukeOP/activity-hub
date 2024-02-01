import InstrumentList from './InstrumentList.vue'
import InstrumentDetails from './InstrumentDetails.vue'
// import InstrumentCreate from './InstrumentCreate.vue'
import { useInstrumentStore } from '/resources/js/stores/instruments'
import { useUserStore } from '/resources/js/stores/user'

import hireRoutes from './Hires/HiresRoutes'


const instrumentRoutes = [
  {path: 'instruments', meta: {breadcrumb: "Instruments"},
    children: [

      // List
      { path: '', name: 'InstrumentList', component: InstrumentList, meta: { title: 'Instruments', section: "Instruments", depth: 1}},
      { path: 'details', name: 'InstrumentDetails', component: InstrumentDetails, meta: { title: 'Instrument Details', breadcrumb: ' / Details', section: "Instruments", depth: 2},
        beforeEnter: () => checkInstrumentObject('InstrumentList')
      },

      ...hireRoutes,
    ],
    beforeEnter: () => checkPermission('INSTRUMENTS_V', 'Dashboard')
  },
] 

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkInstrumentObject(redirect){
  const instrumentStore = useInstrumentStore()
  if(Object.keys(instrumentStore.getInstrument) == 0) return { name: redirect}
  else return true
}

export default instrumentRoutes;