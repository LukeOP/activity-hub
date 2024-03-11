<template>
  <div id="lesson-notes" class="section row">
      <h2 style="width:fit-content; flex-grow:1">Lesson Notes:</h2>
      <div class="btn btn-secondary add-btn float-end" @click="handleAddNote" style="margin-right:20px"><i class="add-icon" v-html="icons.add"></i></div>
      <h3>Recent Notes:</h3>
      <div id="recent-comments" v-if="lesson.notes.length > 0">
        <span>
          <div class="comment-date">{{convertDate(lesson.notes[0].created_at)}} - {{lesson.notes[0].created_by.first_name}} {{lesson.notes[0].created_by.last_name}}</div>
          <div class="comment">"{{lesson.notes[0].comment}}"</div>
        </span>
        <span v-if="lesson.notes[1]">
          <div class="comment-date">{{convertDate(lesson.notes[1].created_at)}} - {{lesson.notes[1].created_by.first_name}} {{lesson.notes[1].created_by.last_name}}</div>
          <div class="comment">"{{lesson.notes[1].comment}}"</div>
        </span>
        <router-link :to="{ name: 'LessonNotes'}" class="link-primary-secondary" style="max-width:fit-content">View all lesson notes...</router-link >
      </div>
      <div v-else>
        <p>Nothing has been noted yet...</p>
      </div>
    </div>
</template>

<script setup>
import moment from 'moment';
import { useModalStore } from '../../../../stores/modal';
import { icons } from '@/images/icons/icons'

const props = defineProps({
  lesson: Object})

  const modal = useModalStore()

function convertDate(date){
  return moment(date).format('LL')
}

function handleAddNote(){
  modal.open('LessonCreateNote')
}
</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
h3 {
  font-size: 1rem;
  display: inline-block;
  color: $ah-primary-dark;
  font-weight: bold;
  margin-right: 0.3rem;
}
.section {
  padding: 10px;
}
#lesson-notes {
  transition: transform 3.3s ease-out;
}
.comment-date {
  color: grey;
  font-style: italic;
}
.comment {
  margin-bottom: 1rem;
}
.add-btn {
  width: fit-content;
}
.add-icon {
  fill: white;
}

</style>