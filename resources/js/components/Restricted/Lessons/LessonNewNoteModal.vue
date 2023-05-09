<template>
  <div class="full-container" @click.self="$emit('close')">
    <div class="main-container">
      <div id="header">
        <h3 style="flex-grow:1; width:fit-content; display:inline-block">Create A Note:</h3>
        <i class="fa-solid fa-xmark fa-2x float-end me-2" @click="$emit('close')"></i>
      </div>
      <div id="body">
        <div class="container body-notes">
          <textarea v-model="noteData.comment" rows="5" placeholder="Today we worked on..." style="resize:none"></textarea>
          <button class="btn btn-primary mt-2" @click="handleCreateNote">Submit</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import { ref } from 'vue'
import { useGeneralStore } from '../../../stores/general'
import axiosClient from '../../../axios'
import { useToast } from 'vue-toast-notification'
export default {
  props: {
    comments: Array
  },
  emits: ["close", "refresh-notes"],
  setup(props, context){
    const toast = useToast()
    const general = useGeneralStore()

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

    return { noteData, convertDate, handleCreateNote }
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
  height: 28%;
  min-height: 250px;
  width: 50%;
  top: 30%;
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
    padding:10px;
    height: calc((100vh * 0.8) - 70px);
    display: flex;
    flex-direction: column;
    // background: orange;
    // overflow-y: scroll;
  }
  .comment-container {
    padding: 10px;
    .comment-date {
      color: grey;
    }
  }
}
/* Styles for mobile */
@media (max-width: 768px) {
  .main-container {
    top: 30%;
    width: 95%;
    // height: 50%;
  }
  #body{
    .body-notes{
      height: calc((100vh * 0.5) - 70px);
    }
  }
  
}
</style>>