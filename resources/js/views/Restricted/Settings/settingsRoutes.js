import Privacy from './Policies/Privacy.vue'
import IPPolicy from './Policies/IPPolicy.vue'
import Settings from './Settings.vue'
import SchoolSetup from './SchoolSetup.vue'
import SchoolDetails from './SchoolSetup/SchoolDetails.vue'

const settingsRoutes = [
  { path: 'settings', meta: {title: 'Settings', breadcrumb: 'Settings', section: 'Settings'}, children: [
    { path: '', name: 'Settings', component: Settings, meta: {section: 'Settings', depth: 1}},
    { path: 'privacy', name: 'Privacy', component: Privacy, meta: {breadcrumb: ' / Privacy Policy', section: 'Settings', depth: 2}},
    { path: 'ip-policy', name: 'IPPolicy', component: IPPolicy, meta: {breadcrumb: ' / Intellectual Property Policy', section: 'Settings', depth: 2}},
    { path: 'school-setup', name: 'SchoolSetup', component: SchoolSetup, meta: {breadcrumb: ' / School Setup', section: 'Settings', depth: 2}},
    { path: 'school-details', name: 'SchoolDetails', component: SchoolDetails, meta: {breadcrumb: ' / School Details', section: 'Settings', depth: 3}}
  ]},
] 
export default settingsRoutes;
