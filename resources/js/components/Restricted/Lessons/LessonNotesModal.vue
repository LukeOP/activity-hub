<template>
  <div class="full-container" @click.self="$emit('close')">
    <div class="main-container">
      <div id="header">
        <h3 style="flex-grow:1; width:fit-content; display:inline-block">Lesson Notes:</h3>
        <i class="fa-solid fa-xmark fa-2x float-end me-2" @click="$emit('close')"></i>
      </div>
      <div id="body">
        <div class="container body-notes">
          <div v-for="comment in allNotes" :key="comment.id" class="comment-container" style="display:flex">
            <span style="flex-grow:1">
              <div class="comment-date">{{convertDate(comment.created_at)}}</div>
              <div class="comment">"{{comment.comment}}"</div>
            </span>
            <span class="trash" @click="handleNoteDelete(comment)"><i class="fa-solid fa-trash"></i></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import { useGeneralStore } from '../../../stores/general'
import { useToast } from 'vue-toast-notification'
import axiosClient from '../../../axios'
import { ref } from 'vue'
export default {
  props: {
    comments: Array
  },
  emits: ["close"],
  setup(props, context){
    const toast = useToast()
    const allNotes = ref(props.comments)

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

    return { allNotes, convertDate, handleNoteDelete }
  }

}
</script>

<style lang="scss" scoped>
.full-container {
  position: fixed;
  top: 0px;
  left: 0px;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 100;
}
.main-container {
  position: fixed;
  height: 80%;
  width: 50%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 0.75rem;
  padding: 0px;
}
#header {
  width: 100%;
  padding: 10px;
  height:59px;
  border-radius: 0.75rem 0.75rem 0 0;
  background-color: $ah-primary-dark;
  color: white;
  h3 {
    padding-left: 10px;
  }
  .fa-xmark {
    cursor: pointer;
    &:hover {
      color: $ah-background-dark;
    }
  }
}
#body {
  .body-notes {
    height: calc((100vh * 0.8) - 70px);
    display: flex;
    flex-direction: column;
    // background: orange;
    overflow-y: scroll;
  }
  .comment-container {
    padding: 10px;
    .comment-date {
      color: grey;
    }
  }
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
/* Styles for mobile */
@media (max-width: 768px) {
  .main-container {
    width: 95%;
    height: 95%;
  }
  #body{
    .body-notes{
      height: calc((100vh * 0.95) - 70px);
    }
  }
  
}
</style>>