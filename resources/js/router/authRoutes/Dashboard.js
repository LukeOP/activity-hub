import Dashboard from '../../components/Restricted/Dashboard/Dashboard.vue'
import Profile from '../../components/Restricted/Dashboard/Profile/Profile.vue'


const dashboardRoutes = [
  {path: 'dashboard', name: 'Dashboard', component: Dashboard, meta: { title: 'Dashboard', section: "Dashboard", depth: 1}},
  {path: 'profile/:id', name: 'Profile', component: Profile, meta: { title: 'Profile', section: "Dashboard", depth: 2}},
] 

export default dashboardRoutes;