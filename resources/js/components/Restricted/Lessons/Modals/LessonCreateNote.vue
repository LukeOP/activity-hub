<template>
  <modal-template title="Create A Note" :push='returnDetails'>
    <div class="container body-notes">
      <textarea v-model="noteData.comment" rows="10" placeholder="Today we worked on..." style="resize:none"></textarea>
      <button class="btn btn-primary mt-2" @click="handleCreateNote">Submit</button>
    </div>
  </modal-template>
</template>

<script>
import moment from 'moment'
import { ref } from 'vue'
import axiosClient from '../../../../axios'
import { useToast } from 'vue-toast-notification'
import { useRouter } from 'vue-router'

import ModalTemplate from '../../../Modal.vue'

export default {
  props: {
    comments: Array
  },
  components: {
    ModalTemplate
  },
  emits: ["close", "refresh-notes"],
  setup(props, context){
    const toast = useToast()
     
    const router = useRouter()

    const noteData = ref({
      lesson_id: general.routeData.lesson.id,
      comment: ''
    })

    function convertDate(date){
      return moment(date).format('LL')
    }

    function handleCreateNote(){
      axiosClient.post('/lesson-notes', noteData.value)
      .then(() => {
        toast.open({ message: 'Lesson Note Added', duration: 5000, dismissible: true, type: 'success'})
        context.emit('refresh-notes')
        context.emit('close')
      })
    }

    const returnDetails = { name: 'LessonDetails', params: { id: general.routeData.lesson.id } }

    function close(){
      router.push(returnDetails)
    }

    return { noteData, convertDate, handleCreateNote, close, returnDetails }
  }

}
</script>

<style lang="scss" scoped>
.body-notes {
  padding:10px;
  height: fit-content;
  display: flex;
  flex-direction: column;
}

/* Styles for mobile */
@media (max-width: 768px) {
  .body-notes{
    height: calc((100vh * 0.5) - 70px);
  }
}
</style>>