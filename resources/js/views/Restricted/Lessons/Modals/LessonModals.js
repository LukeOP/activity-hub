import LessonCalendarClick from "./Calendar/LessonCalendarClick.vue";
import LessonRecordAttendanceSingle from "./Attendance/LessonRecordAttendanceSingle.vue"
import LessonRecordReviewAttendanceSingle from "./Attendance/LessonRecordReviewAttendanceSingle.vue"
import LessonCreateNote from "./Notes/LessonCreateNote.vue"
import LessonNoteDeleteConfirm from './Notes/LessonNoteDeleteConfirm.vue'
import EditLesson from './LessonEdit.vue'
import DeleteLesson from './LessonDelete.vue'
import LessonConfirmActive from './LessonConfirmActive.vue'
import EditAttendance from './Attendance/EditAttendance.vue'

import requestModals from "../Requests/Modals/requestModals";
import plannerModals from "../Planner/Modals/PlannerModals";


const lessonModals = {
  ...requestModals,
  ...plannerModals,
  LessonCalendarClick,
  // LessonRecordAttendanceSingle,
  LessonRecordReviewAttendanceSingle,
  LessonCreateNote,
  LessonNoteDeleteConfirm,
  EditLesson,
  DeleteLesson,
  LessonConfirmActive,
  EditAttendance,
}

export default lessonModals;