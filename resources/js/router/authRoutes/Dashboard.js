import YourDay from '../../components/Restricted/Dashboard/YourDay.vue'
import Profile from '../../components/Restricted/Dashboard/Profile/Profile.vue'


const dashboardRoutes = [
  {path: 'your-day', name: 'YourDay', component: YourDay, meta: { title: 'Dashboard'}},
  {path: 'profile/:id', name: 'Profile', component: Profile, meta: { title: 'Profile'}},
] 

export default dashboardRoutes;