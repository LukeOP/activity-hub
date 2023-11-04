import { useEventStore } from '/resources/js/stores/events'
import EventsList from './EventsList.vue'
import EventDetails from './EventDetails.vue'


const eventsRoutes = [
  {path: 'events', name: 'Events', meta: { title: 'Events', breadcrumb: 'Events'}, redirect: 'EventsList',
      children: [
        { path: '', name: 'EventsList', component: EventsList, meta: { title: 'Events', section: "Events", depth: 1} },
        { path: 'details', name: 'EventDetails', component: EventDetails, meta: { title: 'Event Details', breadcrumb: ' > Details', section: "Events", depth: 2},
        beforeEnter: (to, from, next) => {
          const eventStore = useEventStore()
          if(Object.keys(eventStore.getEvent) == 0) next({ name: 'EventsList'})
          else next()
        }},
  ]},
] 

export default eventsRoutes;