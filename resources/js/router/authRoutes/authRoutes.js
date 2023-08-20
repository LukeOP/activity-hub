import MainLayout from '../../components/Layouts/MainLayout/MainLayout.vue'

import lessonsRoutes from './Lessons';
import eventsRoutes from './Events';
import dashboardRoutes from './Dashboard';
import staffRoutes from './Staff';
import studentsRoutes from './Students';

const authRoutes = [
  {
    path: '/manage',
    name: 'Home',
    component: MainLayout,  
    redirect: { name: 'YourDay' },
    meta: {
      requiresAuth: true,
      breadcrumb: 'Dashboard'
    },
    children: [
      ...dashboardRoutes,
      ...lessonsRoutes,
      ...eventsRoutes,
      ...staffRoutes,
      ...studentsRoutes,
    ], 
    props: true
  },
];

export default authRoutes;