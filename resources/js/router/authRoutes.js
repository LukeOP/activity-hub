import MainLayout from '../components/Layouts/MainLayout/MainLayout.vue'
import NotFoundRestricted from '../components/Restricted/NotFoundRestricted.vue'

import lessonsRoutes from '../components/Restricted/Lessons/LessonsRoutes';
import eventsRoutes from '../components/Restricted/Events/EventRoutes';
import dashboardRoutes from '../components/Restricted/Dashboard/DashboardRoutes';
import staffRoutes from '../components/Restricted/Staff/StaffRoutes';
import studentsRoutes from '../components/Restricted/Students/StudentsRoutes';
import instrumentRoutes from '../components/Restricted/Instruments/InstrumentRoutes';
import settingsRoutes from '/resources/js/components/Restricted/Settings/settingsRoutes';
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