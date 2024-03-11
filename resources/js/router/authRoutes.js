import MainLayout from '../components/Layouts/MainLayout/MainLayout.vue'
import NotFoundRestricted from '../views/Restricted/NotFoundRestricted.vue'

import lessonsRoutes from '../views/Restricted/Lessons/LessonsRoutes';
import eventsRoutes from '../views/Restricted/Events/EventRoutes';
import dashboardRoutes from '../views/Restricted/Dashboard/DashboardRoutes';
import staffRoutes from '../views/Restricted/Staff/StaffRoutes';
import studentsRoutes from '../views/Restricted/Students/StudentsRoutes';
import instrumentRoutes from '../views/Restricted/Instruments/InstrumentRoutes';
import settingsRoutes from '/resources/js/views/Restricted/Settings/settingsRoutes';
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
      ...settingsRoutes,
      { path: 'not-found', name: 'NotFoundRestricted', component: NotFoundRestricted, redirect: { name: 'Dashboard'} }
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