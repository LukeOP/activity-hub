import MainLayout from '../components/Layouts/MainLayout/MainLayout.vue'

import YourDay from '../components/Restricted/Dashboard/YourDay.vue'

import LessonsTable from '../components/Restricted/Lessons/LessonsTable.vue'
import LessonDetails from '../components/Restricted/Lessons/LessonDetails.vue'
import LessonCreate from '../components/Restricted/Lessons/LessonCreate.vue'


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
      {path: 'your-day', name: 'YourDay', component: YourDay, meta: { title: 'Dashboard'}},
      {path: 'lessons', name: 'Lessons', meta: { title: 'Lessons'},
      children: [
        { path: '', name: 'LessonsTable', component: LessonsTable },
        { path: ':id', name: 'LessonDetails', component: LessonDetails, props: true, meta: { title: 'Lesson Details'} },
        { path: 'create', name: 'LessonCreate', component: LessonCreate, props: true, meta: { title: 'Create Lesson'} },
      ]},
    ], 
    props: true
  },
];

export default authRoutes;