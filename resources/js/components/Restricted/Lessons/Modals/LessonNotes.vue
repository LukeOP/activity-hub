<template>
 <modal-template title="Lesson Notes" :data="allNotes" :push='returnDetails'>
  <div class="container body-notes">
    <div v-for="comment in allNotes" :key="comment.id" class="comment-container" style="display:flex">
      <span style="flex-grow:1">
        <div class="comment-date">{{convertDate(comment.created_at)}} - {{comment.created_by.first_name}} {{comment.created_by.last_name}}</div>
        <div class="comment">"{{comment.comment}}"</div>
      </span>
      <span class="trash" @click="handleNoteDelete(comment)"><i class="fa-solid fa-trash"></i></span>
    </div>
  </div>
</modal-template> 
</template>

<script>
import moment from 'moment'
import { useToast } from 'vue-toast-notification'
import axiosClient from '../../../../axios'
import { ref } from 'vue'

import ModalTemplate from '../../../Modal.vue'

export default {
  components: {
    ModalTemplate
  },
  emits: ["close"],
  setup(props, context){
    const toast = useToast()
     
    const allNotes = ref(general.routeData.lesson.notes)

    function convertDate(date){
      return moment(date).format('LL')
    }


    function handleNoteDelete(note){
      axiosClient.delete('/lesson-notes/' + note.id)
      .then(()=>{
        toast.open({ message: 'Lesson Note Deleted', duration: 5000, dismissible: true, type: 'success'})
        allNotes.value = allNotes.value.filter( n => n.id !== note.id);
      })
    }
    const returnDetails = { name: 'LessonDetails', params: { id: general.routeData.lesson.id } }


    return { allNotes, convertDate, handleNoteDelete, returnDetails }
  }

}
</script>

<style lang="scss" scoped>
.body-notes {
  height: calc((100vh * 0.8) - 70px);
  display: flex;
  flex-direction: column;
  background: white;
  overflow-y: scroll;
}
.comment-container {
  padding: 10px;
  .comment-date {
    color: grey;
  }
  .trash {
    color: $ah-primary;
    .fa-trash {
      margin-top: 15px;
      position: relative;
    }
    &:hover {
      color: darkred;
      cursor: pointer;
    }
  }
}


/* Styles for mobile */
@media (max-width: 768px) {
  .body-notes{
    height: calc((100vh * 0.9) - 18px);
  }
}
</style>>