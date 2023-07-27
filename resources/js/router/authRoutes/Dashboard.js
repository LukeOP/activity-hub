import YourDay from '../../components/Restricted/Dashboard/YourDay.vue'
import Profile from '../../components/Restricted/Dashboard/Profile/Profile.vue'
import LessonCalendarClick from '../../components/Restricted/Dashboard/Modals/LessonCalendarClick.vue'
import LessonRecordAttendanceSingle from '../../components/Restricted/Dashboard/Modals/LessonRecordAttendanceSingle.vue'
import LessonRecordReviewAttendanceSingle from '../../components/Restricted/Dashboard/Modals/LessonRecordReviewAttendanceSingle.vue'


const dashboardRoutes = [
  {path: 'your-day', name: 'YourDay', component: YourDay, meta: { title: 'Dashboard'}, children: [
    { path: 'calendar-click-lesson', name: 'LessonCalendarClick', component: LessonCalendarClick, props: true, meta: { title: 'Lesson Click', showModal: true} },
    { path: 'record', name: 'LessonRecordAttendanceSingle', component: LessonRecordAttendanceSingle, props: true, meta: { title: 'Record Lesson Attendance'} },
    { path: 'review', name: 'LessonRecordReviewAttendanceSingle', component: LessonRecordReviewAttendanceSingle, props: true, meta: { title: 'Review Lesson Attendance'} },
  ]},
  {path: 'profile/:id', name: 'Profile', component: Profile, meta: { title: 'Profile'}},
] 

export default dashboardRoutes;