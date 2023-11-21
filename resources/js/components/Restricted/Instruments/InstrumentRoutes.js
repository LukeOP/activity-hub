import InstrumentList from './InstrumentList.vue'
import InstrumentDetails from './InstrumentDetails.vue'
// import InstrumentCreate from './InstrumentCreate.vue'
import { useInstrumentStore } from '/resources/js/stores/instruments'
import { useHireStore } from '/resources/js/stores/hires'

import HiresList from './Hires/HiresList.vue'
import HireDetails from './Hires/HireDetails.vue'


const instrumentRoutes = [
  {path: 'instruments', meta: {breadcrumb: "Instruments"},
      children: [

        //INSTRUMENT ROUTES

        // List
        { path: '', name: 'InstrumentList', component: InstrumentList, meta: { title: 'Instruments', section: "Instruments", depth: 1}},
        // Create Instrument
        // { path: 'create', name: 'InstrumentCreate', component: InstrumentCreate, meta: { title: 'Create Instrument', breadcrumb: ' / Create', section: "Instruments", depth: 2}},
        // Single Instrument Details
        { path: 'details', name: 'InstrumentDetails', component: InstrumentDetails, meta: { title: 'Instrument Details', breadcrumb: ' / Details', section: "Instruments", depth: 2},
        beforeEnter: (to, from, next) => {
          const instrumentStore = useInstrumentStore()
          if(Object.keys(instrumentStore.getInstrument) == 0) next({ name: 'InstrumentList'})
          else next()
          }
        },

        // INSTRUMENT HIRES ROUTES

        // Hire List
        {path: 'hire', meta: {breadcrumb: "Hires", breadcrumb: "Hires"},
        children: [
          { path: '', name: 'HiresList', component: HiresList, meta: { title: 'Hires', section: "Instruments", depth: 2}},
          // Single Hire Details
          { path: 'details', name: 'HireDetails', component: HireDetails, meta: { title: 'Hire Details', breadcrumb: ' / Details', section: "Instruments", depth: 3},
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