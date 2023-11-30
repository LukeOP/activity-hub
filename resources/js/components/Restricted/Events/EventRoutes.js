import { useEventStore } from '/resources/js/stores/events'
import EventsList from './EventsList.vue'
import EventDetails from './EventDetails.vue'
import EventCreate from './EventCreate.vue'
import TemplateList from './Templates/TemplateList.vue'
import TemplateDetails from './Templates/TemplateDetails.vue'


const eventsRoutes = [
  {path: 'events', name: 'Events', meta: { title: 'Events', breadcrumb: 'Events'}, redirect: 'EventsList',
      children: [
        { path: '', name: 'EventsList', component: EventsList, meta: { title: 'Events', section: "Events", depth: 1} },
        { path: 'create', name: 'EventCreate', component: EventCreate, meta: { title: 'Events', breadcrumb: ' / Create', section: "Events", depth: 2} },
        { path: 'details', name: 'EventDetails', component: EventDetails, meta: { title: 'Event Details', breadcrumb: ' / Details', section: "Events", depth: 2},
        beforeEnter: (to, from, next) => {
          const eventStore = useEventStore()
          if(Object.keys(eventStore.getEvent) == 0) next({ name: 'EventsList'})
          else next()
        }},
        {path: 'templates', meta: { title: 'Event Templates', breadcrumb: 'Templates'},
      children: [
        { path: '', name: 'TemplateList', component: TemplateList, meta: { section: "Events", depth: 2} },
        { path: 'details', name: 'TemplateDetails', component: TemplateDetails, meta: { section: "Events", breadcrumb: ' / Details', depth: 3},
        beforeEnter: (to, from, next) => {
          const eventStore = useEventStore()
          if(Object.keys(eventStore.getEventData) == 0) next({ name: 'TemplateList'})
          else next()
        } },
      ]}
  ]},
] 

export default eventsRoutes;