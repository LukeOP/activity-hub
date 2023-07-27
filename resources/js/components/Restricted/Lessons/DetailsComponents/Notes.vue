<template>
  <div id="lesson-notes" class="section row">
      <h2 style="width:fit-content; flex-grow:1">Lesson Notes:</h2>
      <router-link :to="{ name: 'LessonCreateNote' }" class="btn btn-secondary add-btn float-end" style="margin-right:20px"><i class="fa-solid fa-add"></i></router-link>
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

<script>
export default {
  props: {
    lesson: Object
  },
  setup(){

    function convertDate(date){
      return moment(date).format('LL')
    }

    return {
      convertDate
    }
  }

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

</style>