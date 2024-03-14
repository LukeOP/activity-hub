import { useEventStore } from '/resources/js/stores/events'
import EventsList from './EventsList.vue'
import EventDetails from './EventDetails.vue'
import EventCreate from './EventCreate.vue'
import TemplateList from './Templates/TemplateList.vue'
import EventTemplateDetails from './Templates/TemplateDetails.vue'
import { useUserStore } from '/resources/js/stores/user'
import { usePermissions } from '../../../composables/usePermissions'


const eventsRoutes = [
  {path: 'events', name: 'Events', meta: { title: 'Events', breadcrumb: 'Events'}, redirect: 'EventsList',
    children: [
      { path: '', name: 'EventsList', component: EventsList, meta: { title: 'Events', section: "Events", depth: 1},      
        beforeEnter: () => {
          const { checkPermissions } = usePermissions()
          checkPermissions(['EVENTS_R', 'EVENTS_V'], 'Dashboard')
        }},
      { path: 'create', name: 'EventCreate', component: EventCreate, meta: { title: 'Events', breadcrumb: ' / Create', section: "Events", depth: 2},
        beforeEnter: () => checkPermission('EVENTS_C', 'EventsList')},
      { path: 'details', name: 'EventDetails', component: EventDetails, meta: { title: 'Event Details', breadcrumb: ' / Details', section: "Events", depth: 2},
        beforeEnter: [() => checkEventObject('EventsList'), () => checkPermission('EVENTS_V', 'EventsList')]},
      
      {path: 'templates', meta: { title: 'Event Templates', breadcrumb: 'Templates'},
        children: [
          { path: '', name: 'TemplateList', component: TemplateList, meta: { section: "Events", depth: 2},
            beforeEnter: [() => checkPermission('EVENTS_TEMP_V', 'EventsList')]},
          { path: 'details', name: 'EventTemplateDetails', component: EventTemplateDetails, meta: { section: "Events", breadcrumb: ' / Details', depth: 3},
            beforeEnter: [() => checkEventData('TemplateList'), () => checkPermission('EVENTS_TEMP_V', 'EventsList')]},
        ]
      }
    ]
  },
] 

function checkPermission(permission, redirect){
  const user =  useUserStore()
  if(!user.hasPermissionAny(permission)) return { name: redirect}
  else return true
}

function checkEventObject(redirect){
  const eventStore = useEventStore()
  if(Object.keys(eventStore.getEvent) == 0) return { name: redirect}
  else return true
}

function checkEventData(redirect){
  const eventStore = useEventStore()
  if(Object.keys(eventStore.eventData) == 0) return { name: redirect}
  else return true
}

export default eventsRoutes;