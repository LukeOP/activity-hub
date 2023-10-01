import InstrumentList from '../../components/Restricted/Instruments/InstrumentList.vue'
import InstrumentDetails from '../../components/Restricted/Instruments/InstrumentDetails.vue'
import { useInstrumentStore } from '/resources/js/stores/instruments'
import { useHireStore } from '/resources/js/stores/hires'

import HiresList from '../../components/Restricted/Instruments/Hires/HiresList.vue'
import HireDetails from '../../components/Restricted/Instruments/Hires/HireDetails.vue'


const instrumentRoutes = [
  {path: 'instrument', meta: {breadcrumb: "Instruments"},
      children: [
        { path: '', name: 'InstrumentList', component: InstrumentList, meta: { title: 'Instruments', section: "Instruments", depth: 1}},
        { path: 'details', name: 'InstrumentDetails', component: InstrumentDetails, meta: { title: 'Instrument Details', breadcrumb: ' > Details', section: "Instruments", depth: 2},
        beforeEnter: (to, from, next) => {
          const instrumentStore = useInstrumentStore()
          if(Object.keys(instrumentStore.getInstrument) == 0) next({ name: 'InstrumentList'})
          else next()
          }
        },
        {path: 'hire', meta: {breadcrumb: "Hires", breadcrumb: "Hires"},
        children: [
          { path: '', name: 'HiresList', component: HiresList, meta: { title: 'Hires', section: "Instruments", depth: 2}},
          { path: 'details', name: 'HireDetails', component: HireDetails, meta: { title: 'Hire Details', breadcrumb: ' > Details', section: "Instruments", depth: 3},
          beforeEnter: (to, from, next) => {
            const hireStore = useHireStore()
            if(Object.keys(hireStore.getHire).length == 0) next({ name: 'HiresList'})
            else next()
          }
        },
    ]},
  ]},
] 

export default instrumentRoutes;