<template>
  <div class="container body-notes" v-if="allNotes.length > 0">
    <div v-for="comment in allNotes" :key="comment.id" class="comment-container">
      <span id="comment-section">
        <div class="comment-date">{{convertDate(comment.created_at)}} - {{comment.created_by.first_name}} {{comment.created_by.last_name}}</div>
        <div class="comment">"{{comment.comment}}"</div>
      </span>
      <div v-html="icons.trash" class="trash" @click="handleNoteDelete(comment)"></div>
    </div>    
  </div>
  <div v-else class="container text-center mt-5">
    <h2>It looks like there are no notes to display!</h2>
    <button class="btn btn-primary mx-2" @click="handleReturnToDetails">Return to Lesson Details</button>
    <button class="btn btn-secondary mx-2" @click="handleAddNote">Make a Note</button>
  </div>
</template>

<script setup>
import moment from 'moment'
import { computed } from 'vue'

import { useLessonsStore } from '@/stores/lessons'
import { icons } from '@/images/icons/icons'
import { useModalStore } from '@/stores/modal'
import { useRouter } from 'vue-router'

const emits = defineEmits(['close'])
const lessonStore = useLessonsStore()
const modal = useModalStore()
const router = useRouter()
  
const allNotes = computed(()=>{
  return lessonStore.getLessonData.notes
})

function convertDate(date){
  return moment(date).format('LL')
}

function handleNoteDelete(note){
  modal.setData(note)
  modal.open('LessonNoteDeleteConfirm')
}

function handleAddNote(){
  modal.open('LessonCreateNote')
}

function handleReturnToDetails(){
  router.push({
    name: 'LessonDetails',
    params: {
      id: lessonStore.getLessonData.id
    }
  })
}

</script>

<style lang="scss" scoped>
.body-notes {
  height: calc(100vh - 110px);
  display: flex;
  flex-direction: column;
  background: white;
  overflow-y: scroll;
}
.comment-container {
  // box-shadow: 0px 5px 10px $ah-grey;
  display:flex;
  border: 1px solid $ah-grey;
  border-radius: 0.5rem;
  padding: 10px;
  margin-bottom: 6px;
  &:hover {
    cursor: pointer;
    background-color: lighten($ah-primary-background, 6%);
    border-color: $ah-primary;
  }
  #comment-section {
    flex-grow: 1;
  }
  .comment-date {
    color: grey;
  }
  .trash {
    fill: $ah-primary;
    height: 100%;
    width: 1.5rem;
    margin-top: 0.5rem;
    &:hover {
      fill: darkred;
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