import Events from '../../components/Restricted/Events/Events.vue'


const eventsRoutes = [
  {path: 'events',
      children: [
        { path: '', name: 'EventsTable', component: Events, meta: { title: 'Events', breadcrumb: "Events", section: "Events", depth: 1} },
  ]},
] 

export default eventsRoutes;