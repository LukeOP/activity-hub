<template>
  <div v-if="lesson" :class="{fixed: lessonNotesActive}">
    <h1>{{lesson.student.first_name}} {{lesson.student.last_name}}'s {{lesson.attributes.instrument}} Lessons</h1>

    <div id="lesson-details" class="section row">
      <h2>Lesson Details:</h2>
      <div class="col col-12 col-sm-6 col-md-3">
        <span><h3>Status:</h3>
        {{lesson.attributes.status}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <span><h3>Lesson Day:</h3>
        {{lesson.attributes.day}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <span><h3>Lesson Time:</h3>
        {{convertTime(lesson.attributes.start)}}<span v-if="lesson.attributes.end"> - {{convertTime(lesson.attributes.end)}}</span></span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3" v-if="lesson.location">
        <span><h3>Location:</h3>
        {{lesson.location.room_name}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3">
        <span><h3>Tutor:</h3>
        {{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3" v-if="lesson.attributes.funding_type">
        <span><h3>Funding:</h3>
        {{lesson.attributes.funding_type}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3" v-if="lesson.attributes.startDate">
        <span><h3>Start Date:</h3>
        {{lesson.attributes.startDate}}</span>
      </div>
      <div class="col col-12 col-sm-6 col-md-3" v-if="lesson.attributes.endDate">
        <span><h3>End Date:</h3>
        {{lesson.attributes.endDate}}</span>
      </div>
    </div>

    <div id="parent-details" class="section row" v-if="lesson.student.contacts">
      <h2>Contact Details:</h2>
      <div id="student" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.student.email">
        <h2>Student:</h2>
        <h3>Name:</h3>
        {{lesson.student.first_name}} {{lesson.student.last_name}}<br/>
        <h3>Year Level:</h3>
        {{lesson.student.year_level}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.student.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.student.mobile}}<br/>
      </div>
      <div id="primary-carer" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.pc.name">
        <h2>Primary Carer:</h2>
        <h3>Name:</h3>
        {{lesson.student.contacts.pc.name}}<br/>
        <h3>Relationship:</h3>
        {{lesson.student.contacts.pc.relationship}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.pc.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.pc.mobile}}<br/>
      </div>
      <div id="secondary-carer" class="col col-12 col-sm-6 col-md-3" v-if="lesson.student.contacts.sc.name">
        <h2>Secondary Carer:</h2>
        <h3>Name:</h3>
        {{lesson.student.contacts.sc.name}}<br/>
        <h3>Relationship:</h3>
        {{lesson.student.contacts.sc.relationship}}<br/>
        <h3>Email:</h3>
        {{lesson.student.contacts.sc.email}}<br/>
        <h3>Mobile:</h3>
        {{lesson.student.contacts.sc.mobile}}<br/>
      </div>
    </div>

    <div id="lesson-notes" class="section row">
      <h2 style="width:fit-content; flex-grow:1">Lesson Notes:</h2>
      <button class="btn btn-secondary add-btn float-end" style="margin-right:20px" @click="handleNewNotesModal"><i class="fa-solid fa-add"></i></button>
      <!-- <button class="btn btn-primary add-btn float-end" style="margin-right:10px" @click="lessonNotesActive = true"><i class="fa-solid fa-eye"></i></button> -->
      <h3>Recent Notes:</h3>
      <div id="recent-comments" v-if="lesson.notes.length > 0">
        <span>
          <div class="comment-date">{{convertDate(lesson.notes[0].created_at)}}</div>
          <div class="comment">"{{lesson.notes[0].comment}}"</div>
        </span>
        <span v-if="lesson.notes[1]">
          <div class="comment-date">{{convertDate(lesson.notes[1].created_at)}}</div>
          <div class="comment">"{{lesson.notes[1].comment}}"</div>
        </span>
        <span class="link-primary-secondary" style="max-width:fit-content" @click="handleModal">View all lesson notes...</span>
      </div>
      <div v-else>
        <p>Nothing has been noted yet...</p>
      </div>
    </div>

    <lesson-notes id="lesson-notes" 
      v-if="lessonNotesActive" 
      :comments="lesson.notes" 
      @close="refreshNotes(); handleModal()" 
      />

    <lesson-new-note-modal id="lesson-notes" 
      v-if="lessonNewNotesActive" 
      :comments="lesson.notes" 
      @close="handleNewNotesModal" 
      @refresh-notes="refreshNotes" />
      
  </div>
</template>

<script>
import { onMounted, ref } from 'vue'
import { useGeneralStore } from '../../../stores/general'
import { useRoute } from 'vue-router'
import axiosClient from '../../../axios'
import moment from 'moment'

import LessonNotes from './LessonNotesModal.vue'
import LessonNewNoteModal from './LessonNewNoteModal.vue'

export default {
  components: {
    LessonNotes,
    LessonNewNoteModal
  },
  setup(){
    const general = useGeneralStore()
    const route = useRoute()
    const lesson = ref(false)
    const lessonNotesActive = ref(false)
    const lessonNewNotesActive = ref(false)

    general.setActionItems([
      { header: 'Edit Lesson', to: { name: 'LessonEdit' }, showSubItems: false, icon: 'fa-solid fa-pen-to-square', additional: true},
      { header: 'Add Lesson Notes', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-file-circle-plus', additional: true},
      { header: 'Delete Lesson', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-trash', additional: true}
      ])
    
    function handleModal(){
      lessonNotesActive.value = !lessonNotesActive.value
      if(lessonNotesActive.value === true) document.body.classList.add("modal-open")
      if(lessonNotesActive.value === false) document.body.classList.remove("modal-open")
    }
    
    function handleNewNotesModal(){
      lessonNewNotesActive.value = !lessonNewNotesActive.value
      if(lessonNewNotesActive.value === true) document.body.classList.add("modal-open")
      if(lessonNewNotesActive.value === false) document.body.classList.remove("modal-open")
    }

    function convertTime(time){
      return moment(time, 'HH:mm:ss').format('h:mm A')
    }
    function convertDate(date){
      return moment(date).format('LL')
    }

    function refreshNotes(){
      axiosClient.get('lessons/' + route.params.id).then(res => {
        lesson.value = res.data.data
      })
    }

    onMounted(()=>{
      axiosClient.get('lessons/' + route.params.id).then(res => {
        lesson.value = res.data.data
      })
    })

    return {
      lesson,
      lessonNotesActive,
      lessonNewNotesActive,
      handleModal,
      handleNewNotesModal,
      convertTime,
      convertDate,
      refreshNotes
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
}
.section {
  padding: 10px;
  border-bottom: 1px dashed $ah-primary;
  &:last-of-type {
    border: none;
  }
}
#student, #primary-carer, #secondary-carer {
  border-left: 4px solid;
  margin-bottom: 2rem;
}
#student {
  border-color: $ah-primary;
}
#primary-carer {
  border-color: $ah-secondary;
}
#secondary-carer {
  border-color: $ah-background-dark;
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
.modal-open {
  overflow: hidden;
}

</style>