<template>
  <div class="text-center">
    <h2>Create a General Comment</h2>
    <div class="container body-notes">
      <textarea v-model="noteData.general_comment" rows="5" :placeholder="'e.g, ' + currentLesson.student.first_name + ' has borrowed a learning book...'" style="resize:none"></textarea>
      <button class="btn btn-primary mt-2" @click="handleCreateNote">Submit</button>
    </div>
  </div>
  
</template>

<script>
import moment from 'moment'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

import ModalTemplate from '../../../../../components/Layouts/MainLayout/Elements/ComposableElements/Modal.vue'
import { useLessonsStore } from '../../../../../stores/lessons'
import { useUserStore } from '../../../../../stores/user'
import { useModalStore } from '../../../../../stores/modal'
import { useToastStore } from '/resources/js/stores/toast'
import useApi from '../../../../../composables/useApi'

export default {
  props: {
    comments: Array
  },
  components: {
    ModalTemplate
  },
  emits: ["close", "refresh-notes"],
  setup(props, context){
    const toast = useToastStore()
    const lessonStore = useLessonsStore()
    const currentLesson = lessonStore.getLessonData
     
    const router = useRouter()
    const user = useUserStore()
    const modal = useModalStore()

    const noteData = ref({
      lesson_id: currentLesson.id,
      user_id: user.attributes.id,
      tutor_id: currentLesson.tutor.id,
      general_comment: ''
    })

    function convertDate(date){
      return moment(date).format('LL')
    }

    function handleCreateNote(){
      console.log(noteData.value);
      const {data, fetchData} = useApi('/lesson-notes-general', noteData.value, 'POST', true)
      fetchData()
      .then(() => {
        lessonStore.addNote(data.value.data)
        modal.close()
      })
    }

    const returnDetails = { name: 'LessonDetails', params: { id: currentLesson.id } }

    function close(){
      router.push(returnDetails)
    }

    return { currentLesson, noteData, convertDate, handleCreateNote, close, returnDetails }
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

textarea {
  border: none;
  border-left: 2px solid $ah-primary;
  outline-color: transparent;
  padding-left: 10px;
}

button {
  width: 200px;
  margin-left: auto;
  margin-right: auto;
}

/* Styles for mobile */
@media (max-width: 768px) {
  .body-notes{
    height: calc((100vh * 0.5) - 70px);
  }
}
</style>>