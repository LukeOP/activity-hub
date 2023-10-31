import MainLayout from '../../components/Layouts/MainLayout/MainLayout.vue'

import lessonsRoutes from './Lessons';
import eventsRoutes from './Events';
import dashboardRoutes from './Dashboard';
import staffRoutes from './Staff';
import studentsRoutes from './Students';
import instrumentRoutes from '../../components/Restricted/Instruments/InstrumentRoutes';
import { useFilterStore } from '/resources/js/stores/filter';

const authRoutes = [
  {
    path: '/manage',
    name: 'MainAuth',
    component: MainLayout,  
    redirect: { name: 'Dashboard' },
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
      ...instrumentRoutes,
    ], 
    props: true,
    beforeEnter: (to, from, next) => {
      const filter = useFilterStore()
      filter.$reset()
      next()
    }
  },
];

export default authRoutes;