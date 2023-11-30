import StaffDeleteSubject from '../components/Restricted/Staff/Modals/Details/DeleteSubject.vue'
import NewStaff from "../components/Restricted/Staff/Modals/NewStaff.vue";

import lessonModals from '../components/Restricted/Lessons/Modals/LessonModals';
import dashboardModals from '../components/Restricted/Dashboard/Modals/DashboardModals';
import instrumentModals from '../components/Restricted/Instruments/Modals/InstrumentModals';
import eventModals from '../components/Restricted/Events/Modals/EventModals';

const modalComponents = {
  ...lessonModals,
  ...dashboardModals,
  ...instrumentModals,
  ...eventModals,
  StaffDeleteSubject,
  NewStaff,
}

export default modalComponents; 