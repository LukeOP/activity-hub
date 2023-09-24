import InstrumentList from '../../components/Restricted/Instruments/InstrumentList.vue'
import InstrumentDetails from '../../components/Restricted/Instruments/InstrumentDetails.vue'
import { useInstrumentStore } from '/resources/js/stores/instruments'


const instrumentRoutes = [
  {path: 'instrument', name: 'Instrument', meta: { title: 'Instrument', breadcrumb: 'Instruments'}, redirect: 'InstrumentList',
      children: [
        { path: '', name: 'InstrumentList', component: InstrumentList, meta: { title: 'Instruments'}},
        { path: 'details', name: 'InstrumentDetails', component: InstrumentDetails, meta: { title: 'Instrument Details', breadcrumb: ' > Details'},
        beforeEnter: (to, from, next) => {
          const instrumentStore = useInstrumentStore()
          if(Object.keys(instrumentStore.getInstrument) == 0) next({ name: 'InstrumentList'})
          else next()
        }
      },
  ]},
] 

export default instrumentRoutes;