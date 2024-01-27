import MainLayout from '../../components/Layouts/MainLayout/MainLayout.vue'
import NotFoundRestricted from '../../components/Restricted/NotFoundRestricted.vue'

import lessonsRoutes from '../../components/Restricted/Lessons/LessonsRoutes';
import eventsRoutes from '../../components/Restricted/Events/EventRoutes';
import dashboardRoutes from './Dashboard';
import staffRoutes from './Staff';
import studentsRoutes from '../../components/Restricted/Students/StudentsRoutes';
import instrumentRoutes from '../../components/Restricted/Instruments/InstrumentRoutes';
import settingsRoutes from '/resources/js/components/Restricted/Settings/settingsRoutes';
import { useFilterStore } from '/resources/js/stores/filter';
import { useUserStore } from '/resources/js/stores/user';

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
      {path: '*', name: 'NotFoundRestricted', component: NotFoundRestricted, meta: {title: '404 Not Found'}}
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