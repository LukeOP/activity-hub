import Events from '../../components/Restricted/Events/Events.vue'


const eventsRoutes = [
  {path: 'events', name: 'Events', meta: { title: 'Events'},
      children: [
        { path: '', name: 'EventsTable', component: Events },
  ]},
] 

export default eventsRoutes;