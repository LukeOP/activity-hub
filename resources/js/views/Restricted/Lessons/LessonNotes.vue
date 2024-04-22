<template>
  <div>
    <HeaderLine heading="Lesson Notes" :school="subHeading" link1="Student Details" @link1="handleReturnToDetails" />
    <div></div>
    <div class="container body-notes" v-if="allNotes.length > 0">
      <div v-for="comment in allNotes" :key="comment.id" class="comment-container">
        <div style="display: flex; justify-content: space-between;">
          <div>
            <span class="comment-tag" :class="comment.comments.general != null ? 'general' : 'lesson'">{{comment.comments.general != null ? 'General' : 'Lesson'}} Comment</span>
            <span class="comment-date">{{convertDate(comment.created_at)}} - {{comment.created_by.first_name}} {{comment.created_by.last_name}}</span>
          </div>
          <div v-html="icons.trash" class="trash" @click="handleNoteDelete(comment)"></div>
        </div>
        <div style="display: flex;">
          <span id="comment-section">
            <div class="comment" v-if="comment.comments.planning"><strong>Planning:</strong> "{{comment.comments.planning}}"</div>
            <div class="comment" v-if="comment.comments.progress"><strong>Progress:</strong> "{{comment.comments.progress}}"</div>
            <div class="comment" v-if="comment.comments.next_steps"><strong>Next Steps:</strong> "{{comment.comments.next_steps}}"</div>
            <div class="comment" v-if="comment.comments.general"><strong>General:</strong> "{{comment.comments.general}}"</div>
          </span>
        </div>
        <hr />
      </div>    
    </div>
    <div v-else class="container text-center mt-5">
      <h2>It looks like there are no notes to display!</h2>
      <button class="btn btn-primary mx-2" @click="handleReturnToDetails">Return to Lesson Details</button>
      <button class="btn btn-secondary mx-2" @click="handleAddNote">Make a Note</button>
    </div>
  </div>
</template>

<script setup>
import moment from 'moment'
import { computed } from 'vue'

import { useLessonsStore } from '@/stores/lessons'
import { icons } from '@/images/icons/icons'
import { useModalStore } from '@/stores/modal'
import { useRouter } from 'vue-router'
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'

const emits = defineEmits(['close'])
const lessonStore = useLessonsStore()
const currentLesson = lessonStore.getLessonData
const modal = useModalStore()
const router = useRouter()

const subHeading = `${currentLesson.student.full_name}'s ${currentLesson.attributes.instrument} Lessons`
  
const allNotes = computed(()=>{
  return lessonStore.getLessonNotes
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
    name: 'LessonDetails'
  })
}

</script>

<style lang="scss" scoped>
.body-notes {
  height: calc(100vh - 250px);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}
.comment-container {
  margin-bottom: 6px;
  #comment-section {
    flex-grow: 1;
    margin-top: 10px;
  }
  .comment-date {
    color: grey;
    margin-left: 1rem;
  }
  .trash {
    fill: $ah-primary;
    width: 1.5rem;
    &:hover {
      fill: darkred;
      cursor: pointer;
    }
  }
}
.comment-tag {
  width: fit-content;
  padding: 0 10px;
  border-radius: 10px;
  margin: auto 0;
}
.general {
  background-color: $ah-primary-light;
  color: white;
}
.lesson {
  background-color: $ah-primary-dark;
  color: white;
}


/* Styles for mobile */
@media (max-width: 768px) {
  .body-notes{
    height: calc((100vh * 0.9) - 18px);
  }
}
</style>>