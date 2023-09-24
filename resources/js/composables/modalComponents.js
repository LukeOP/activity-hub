import StaffDeleteSubject from '../components/Restricted/Staff/Modals/Details/DeleteSubject.vue'
import NewStaff from "../components/Restricted/Staff/Modals/NewStaff.vue";

import lessonModals from '../components/Restricted/Lessons/Modals/LessonModals';
import dashboardModals from '../components/Restricted/Dashboard/Modals/DashboardModals';
import instrumentModals from '../components/Restricted/Instruments/Modals/InstrumentModals';

const modalComponents = {
  ...lessonModals,
  ...dashboardModals,
  ...instrumentModals,
  StaffDeleteSubject,
  NewStaff,
}

export default modalComponents; 