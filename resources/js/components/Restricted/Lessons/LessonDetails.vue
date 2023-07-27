<template>
  <div v-if="lesson" :class="{fixed: lessonNotesActive}">

    <Header :lesson="lesson" />
    <LessonDetails :lesson="lesson" />
    <ParentDetails :lesson="lesson" />
    <Notes :lesson="lesson" />

    <div class="modal-route">
        <router-view></router-view>
    </div>
      
  </div>
</template>

<script>
import { onMounted, ref, watch } from 'vue'
import { useRoute } from 'vue-router'
import axiosClient from '../../../axios'

import LessonNotes from './Modals/LessonNotes.vue'
import LessonNewNoteModal from './Modals/LessonCreateNote.vue'
import Header from './DetailsComponents/Header.vue'
import LessonDetails from './DetailsComponents/LessonDetails.vue'
import ParentDetails from './DetailsComponents/ParentDetails.vue'
import Notes from './DetailsComponents/Notes.vue'
import { useActionsStore } from '../../../stores/actions'
import { useLessonsStore } from '../../../stores/lessons'

export default {
  components: {
    Header,
    LessonDetails,
    ParentDetails,
    Notes,
    LessonNotes,
    LessonNewNoteModal
  },
  setup(){
    const lessonStore = useLessonsStore()
    const actions = useActionsStore()
    const route = useRoute()
    const lesson = ref(false)
    const lessonNotesActive = ref(false)
    const lessonNewNotesActive = ref(false)

    function getData(){
      axiosClient.get('lessons/' + route.params.id).then(res => {
        lesson.value = res.data.data
        lessonStore.setLesson(res.data.data)
        setActions()
      })
    }

    function setActions(){
      const actionsArray = [
      { header: 'Edit Lesson', to: { name: 'LessonEdit' }, showSubItems: false, icon: 'fa-solid fa-edit', additional: true},
      { header: 'Add Lesson Notes', to: { name: 'LessonCreateNote' }, showSubItems: false, icon: 'fa-solid fa-file-circle-plus', additional: true},
      { header: 'View Lesson Notes', to: { name: 'LessonNotes' }, showSubItems: false, icon: 'fa-solid fa-eye', additional: true},
      { header: 'View Attendance', to: { name: 'LessonAttendanceSingle' }, showSubItems: false, icon: 'fa-solid fa-user-check', additional: true},
      { header: 'Delete Lesson', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-trash', additional: true, red: true}
      ]
      if(lesson.value.attributes.status != 'Active' && lessonDetailsSet()){
        actionsArray.unshift({ header: 'Set Lesson as Active', to: { name: 'LessonConfirmActive' }, showSubItems: false, icon: 'fa-solid fa-circle-check', additional: true, green: true})
      }
      actions.setItems(actionsArray)
    }

    function lessonDetailsSet(){
      console.log(lesson.value)
      if(lesson.value.attributes.day == "Not Set") return false
      if(lesson.value.attributes.start == null) return false
      if(lesson.value.attributes.startDate == null) return false
      if(lesson.value.attributes.funding_type == null) return false
      return true
    }
    
    watch(()=> route.name, () => {
      if(route.name === 'LessonDetails'){
        getData()
      }
    })

    function refreshNotes(){
      axiosClient.get('lessons/' + route.params.id).then(res => {
        lesson.value = res.data.data
      })
    }

    onMounted(()=>{
      getData()
    })

    return {
      lesson,
      lessonNotesActive,
      lessonNewNotesActive,
      refreshNotes,
    }
  }

}
</script>