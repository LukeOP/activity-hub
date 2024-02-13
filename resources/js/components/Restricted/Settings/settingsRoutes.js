import Privacy from './Privacy.vue'
import Settings from './Settings.vue'
import SchoolSetup from './SchoolSetup.vue'

const settingsRoutes = [
  { path: 'settings', meta: {breadcrumb: 'Settings', section: 'Settings'}, children: [
    { path: '', name: 'Settings', component: Settings, meta: {section: 'Settings', depth: 1} },
    { path: 'privacy', name: 'Privacy', component: Privacy, meta: {breadcrumb: ' / Privacy Policy', section: 'Settings', depth: 2}},
    { path: 'school-setup', name: 'SchoolSetup', component: SchoolSetup, meta: {breadcrumb: ' / School Setup', section: 'Settings', depth: 2}}
  ]},
] 
export default settingsRoutes;
