<template>
<modal-template-vue title="Set Lesson As Active" :push='returnDetails'>
  <span style="text-align:center; height:fit-content; background:blue">
    <div class="mt-5">You are about to set this lesson as 'active'.</div>
    <div>Do you wish to continue?</div>
    <form class="mt-3">
      <input type="button" value="Yes" class="btn btn-primary mx-2" @click="handleClick('Yes')">
      <input type="button" value="Cancel" class="btn btn-grey mx-2" @click="handleClick('Cancel')">
    </form>
  </span>
</modal-template-vue>

</template>

<script>
import { useRouter } from 'vue-router'
import { useToast } from 'vue-toast-notification'
import axiosClient from '../../../../axios'
import ModalTemplateVue from '../../../Modal.vue'

export default {
  components: {
    ModalTemplateVue
  },
  setup(){
    const router = useRouter()
    const toast = useToast()
     

    function handleClick(click){
      if(click === 'Yes') handleSetActive()
      if(click === 'Cancel') returnToDetails()
    }

    function handleSetActive(){
      axiosClient.patch('lessons/' + general.routeData.lesson.id, {status: 'Active'})
      .then((res) => {
        toast.open({ message: res.data.message, duration: 5000, dismissible: true, type: 'success'})
        axiosClient.post('calendar-events', CalendarData())
        .then(res => {
          returnToDetails()
        })
      })
    }

    function CalendarData(){
      return {
        school_id: general.routeData.lesson.school.id,
        user_id: general.routeData.lesson.tutor.id,
        start: general.routeData.lesson.attributes.startDate ? general.routeData.lesson.attributes.startDate : new Date(),
        reference_type: 'lesson',
        reference_type_id: general.routeData.lesson.id
      }
    }
    const returnDetails = { name: 'LessonDetails', params: { id: general.routeData.lesson.id } }

    function returnToDetails(){
        router.push(returnDetails)
    }

    return {
      handleClick,
      returnDetails
    }
  }

}
</script>

<style>

</style>