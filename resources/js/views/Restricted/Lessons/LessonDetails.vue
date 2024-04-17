<template>
  <div v-if="lesson" :class="{fixed: lessonNotesActive}">

    <Header :lesson="lesson" />
    <Details :lesson="lesson" />
    <ContactDetails :student="lesson.student" />
    <Notes :lesson="lesson" />
      
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useRoute } from 'vue-router'

import Header from './DetailsComponents/Header.vue';
import Details from './DetailsComponents/Details.vue';
import ContactDetails from '../Students/DetailsComponents/ContactDetails.vue';
import Notes from './DetailsComponents/Notes.vue';
import { useActionsStore } from '../../../stores/actions';
import { useLessonsStore } from '../../../stores/lessons';
import { useUserStore } from '@/stores/user';


  const lessonStore = useLessonsStore()
  const actions = useActionsStore()
  const route = useRoute()
  const lesson = ref(lessonStore.getLessonData)
  const lessonNotesActive = ref(false)
  const lessonNewNotesActive = ref(false)
  const user = useUserStore()


  function setActions(){
    const actionsArray = []
    if(user.hasPermission('LESSONS_R', lesson.value.school.id) || user.hasPermission('LESSONS_V', lesson.value.school.id)){
      actionsArray.push(
        { header: 'Add Lesson Notes', to: { name: 'LessonDetails' }, modal: 'LessonCreateNote', icon: 'fa-solid fa-file-circle-plus', additional: true},
        { header: 'Edit Lesson', to: { name: 'LessonDetails', route: {id: lesson.value.attributes.id} }, modal: 'EditLesson', icon: 'fa-solid fa-edit', additional: true})
    }
    if(user.hasPermission('LESSONS_D', lesson.value.school.id)){
      actionsArray.push({ header: 'Delete Lesson', to: { name: 'LessonDetails' }, modal: 'DeleteLesson', icon: 'fa-solid fa-trash', additional: true, red: true})
    }
    if(lesson.value.attributes.status != 'Active' && lessonDetailsSet()){
      actionsArray.unshift({ header: 'Set Lesson as Active', to: { name: 'LessonDetails' }, modal: "LessonConfirmActive", icon: 'fa-solid fa-circle-check', additional: true, green: true})
    }
    if(lesson.value.attributes.status != 'Active'){
      actionsArray.push({ header: 'Send To Waiting List', to: { name: 'LessonDetails' }, modal: "LessonConfirmWaiting", icon: 'fa-solid fa-hourglass-start', additional: true})
    }
    actions.setItems(actionsArray)
  }

  setActions()

  function lessonDetailsSet(){
    if(lesson.value.attributes.day == "Not Set") return false
    if(lesson.value.attributes.start == null) return false
    if(lesson.value.attributes.startDate == null) return false
    if(lesson.value.attributes.funding_type == null) return false
    return true
  }

  watch(() => lessonStore.singleLesson, (newValue) => {
    lesson.value = newValue
    setActions()
  }, {deep: true})

</script>