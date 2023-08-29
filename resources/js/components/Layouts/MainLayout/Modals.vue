<template>
  <div>

    <Modal :modalActive="modalActive" @close="closeModal" >
      <component :is="currentComponent" />
    </Modal>

  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import Modal from "../../Modal.vue";
import { useModalStore } from '../../../stores/modal'
import LessonCalendarClick from "../../Restricted/Lessons/Modals/Calendar/LessonCalendarClick.vue";
import LessonRecordAttendanceSingle from "../../Restricted/Lessons/Modals/Attendance/LessonRecordAttendanceSingle.vue"
import LessonRecordReviewAttendanceSingle from "../../Restricted/Lessons/Modals/Attendance/LessonRecordReviewAttendanceSingle.vue"
import LessonCreateNote from "../../Restricted/Lessons/Modals/Notes/LessonCreateNote.vue"
import StaffDeleteSubject from '../../Restricted/Staff/Modals/Details/DeleteSubject.vue'
import NewStaff from "../../Restricted/Staff/Modals/NewStaff.vue";
import InviteCodeEntry from "../../Restricted/Dashboard/Modals/InviteCodeEntry.vue";
import InviteCodeSuccess from "../../Restricted/Dashboard/Modals/InviteCodeSuccess.vue";

const modal = useModalStore()

const currentComponent = computed(()=>{
  // console.log(modal.getType)
  switch (modal.getType) {
    case 'LessonCalendarClick': return LessonCalendarClick
    case 'LessonRecordAttendanceSingle': return LessonRecordAttendanceSingle
    case 'LessonRecordReviewAttendanceSingle': return LessonRecordReviewAttendanceSingle
    case 'LessonCreateNote': return LessonCreateNote
    case 'StaffDeleteSubject': return StaffDeleteSubject
    case 'NewStaff': return NewStaff
    case 'InviteCodeEntry': return InviteCodeEntry
    case'InviteCodeSuccess': return InviteCodeSuccess
    default: return null
  }
})

const modalActive = computed(() => {
  return modal.getActiveState
})

function closeModal(){
  modal.close()
}

</script>

<style lang="scss" scoped>

</style>