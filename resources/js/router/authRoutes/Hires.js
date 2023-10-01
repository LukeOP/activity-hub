import HiresList from '../../components/Restricted/Hires/HiresList.vue'
import HireDetails from '../../components/Restricted/Hires/HireDetails.vue'
import { useHireStore } from '/resources/js/stores/hires'


const hireRoutes = [
  {path: 'hire', meta: {breadcrumb: "Hires"},
      children: [
        { path: '', name: 'HiresList', component: HiresList, meta: { title: 'Hires', section: "Hires", depth: 1}},
        { path: 'details', name: 'HireDetails', component: HireDetails, meta: { title: 'Hire Details', breadcrumb: ' > Details', section: "Hires", depth: 2},
        beforeEnter: (to, from, next) => {
          const hireStore = useHireStore()
          if(Object.keys(hireStore.getHire).length == 0) next({ name: 'HiresList'})
          else next()
        }
      },
  ]},
] 

export default hireRoutes;