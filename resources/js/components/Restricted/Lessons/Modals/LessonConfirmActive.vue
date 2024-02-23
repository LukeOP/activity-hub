<template>
  <div class="text-center">
    <h2>Set Lesson as Active?</h2>
    <div>You are about to set this lesson as 'active'.</div>
    <div>Do you wish to continue?</div>
    <form class="mt-3">
      <input type="button" value="Cancel" class="btn btn-grey mx-2" @click="handleClick('Cancel')">
      <input type="button" value="Yes" class="btn btn-primary mx-2" @click="handleClick('Yes')">
    </form>
  </div>

</template>

<script>
import { useRouter } from 'vue-router'
import axiosClient from '../../../../axios'
import ModalTemplateVue from '../../../Layouts/MainLayout/Elements/Modal.vue'
import { useLessonsStore } from '/resources/js/stores/lessons'
import { useModalStore } from '/resources/js/stores/modal'
import { useToastStore } from '/resources/js/stores/toast'

export default {
  components: {
    ModalTemplateVue
  },
  setup(){
    const router = useRouter()
    const toast = useToastStore()

    const lessonStore = useLessonsStore()
    const lesson = lessonStore.getLessonData
    const modal = useModalStore()
     

    function handleClick(click){
      if(click === 'Yes') handleSetActive()
      if(click === 'Cancel') modal.close()
    }

    function handleSetActive(){
      axiosClient.patch('lessons/' + lesson.id, {status: 'Active'})
      .then((res) => {
        toast.open('success', 'Lesson State Changed', 'The lesson is now set as active.')
        lesson.attributes.status = 'Active'
        modal.close()
      })
    }

    // function CalendarData(){
    //   return {
    //     school_id: lesson.school.id,
    //     user_id: lesson.tutor.id,
    //     start: lesson.attributes.startDate ? lesson.attributes.startDate : new Date(),
    //     reference_type: 'lesson',
    //     reference_type_id: lesson.id
    //   }
    // }
    const returnDetails = { name: 'LessonDetails', params: { id: lesson.id } }

    return {
      handleClick,
      returnDetails
    }
  }

}
</script>

<style lang="scss" scoped>
input[type = 'button']{
  width: 100px;
}
</style>