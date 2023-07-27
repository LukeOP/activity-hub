import MainLayout from '../../components/Layouts/MainLayout/MainLayout.vue'

import lessonsRoutes from './Lessons';
import eventsRoutes from './Events';
import dashboardRoutes from './Dashboard';
import staffRoutes from './Staff';

const authRoutes = [
  {
    path: '/manage',
    name: 'Home',
    component: MainLayout,  
    redirect: { name: 'YourDay' },
    meta: {
      requiresAuth: true,
    },
    children: [
      ...dashboardRoutes,
      ...lessonsRoutes,
      ...eventsRoutes,
      ...staffRoutes,
    ], 
    props: true
  },
];

export default authRoutes;