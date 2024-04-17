<template>
  <div class="text-center">
    <h2>Send Lesson To Waiting List?</h2>
    <div>Are you sure you wish to send this lesson to the waiting list?</div>
    <div class="text-red">NOTE: The student <strong>will not</strong> be automatically notified.</div>
    <form class="mt-3">
      <input type="button" value="Cancel" class="btn btn-grey mx-2" @click="handleClick('Cancel')">
      <input type="button" value="Yes" class="btn btn-primary mx-2" @click="handleClick('Yes')">
    </form>
  </div>

</template>

<script>
import { useRouter } from 'vue-router'
import axiosClient from '../../../../axios'
import ModalTemplateVue from '../../../../components/Layouts/MainLayout/Elements/ComposableElements/Modal.vue'
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
      axiosClient.patch('lessons/' + lesson.id, {status: 'Waiting'})
      .then((res) => {
        toast.open('success', 'Lesson State Changed', 'The lesson is now on the Waiting List.')
        lesson.attributes.status = 'Waiting'
        modal.close()
      })
    }

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