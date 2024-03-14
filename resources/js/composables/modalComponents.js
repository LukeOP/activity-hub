import lessonModals from '../views/Restricted/Lessons/Modals/LessonModals';
import dashboardModals from '../views/Restricted/Dashboard/Modals/DashboardModals';
import instrumentModals from '../views/Restricted/Instruments/Modals/InstrumentModals';
import eventModals from '../views/Restricted/Events/Modals/EventModals';
import studentModals from '../views/Restricted/Students/Modals/StudentModals';
import staffModals from '../views/Restricted/Staff/Modals/StaffModals';

const modalComponents = {
  ...lessonModals,
  ...dashboardModals,
  ...instrumentModals,
  ...eventModals,
  ...studentModals,
  ...staffModals,
}

export default modalComponents; 