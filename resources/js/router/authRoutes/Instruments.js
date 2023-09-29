import InstrumentList from '../../components/Restricted/Instruments/InstrumentList.vue'
import InstrumentDetails from '../../components/Restricted/Instruments/InstrumentDetails.vue'
import { useInstrumentStore } from '/resources/js/stores/instruments'


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
  ]},
] 

export default instrumentRoutes;