<template>
  <div v-if="lesson" :class="{fixed: lessonNotesActive}">

    <Header :lesson="lesson" />
    <Details :lesson="lesson" />
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

import LessonNotes from './Modals/Notes/LessonNotes.vue';
import Header from './DetailsComponents/Header.vue';
import Details from './DetailsComponents/Details.vue';
import ParentDetails from './DetailsComponents/ParentDetails.vue';
import Notes from './DetailsComponents/Notes.vue';
import { useActionsStore } from '../../../stores/actions';
import { useLessonsStore } from '../../../stores/lessons';
import { useUserStore } from '@/stores/user';

export default {
  components: {
    Header,
    Details,
    ParentDetails,
    Notes,
    LessonNotes,
  },
  setup(){
    const lessonStore = useLessonsStore()
    const actions = useActionsStore()
    const route = useRoute()
    const lesson = ref(false)
    const lessonNotesActive = ref(false)
    const lessonNewNotesActive = ref(false)
    const user = useUserStore()

    function getData(){
      axiosClient.get('lessons/' + route.params.id).then(res => {
        lesson.value = res.data.data
        lessonStore.setLesson(res.data.data)
        setActions()
      })
    }

    function setActions(){
      const actionsArray = []
      if(user.hasPermission('LESSONS_R', lesson.value.school.id) || user.hasPermission('LESSONS_V', lesson.value.school.id)){
        actionsArray.push(
          { header: 'Add Lesson Notes', to: { name: 'LessonCreateNote' }, icon: 'fa-solid fa-file-circle-plus', additional: true},
          { header: 'View Lesson Notes', to: { name: 'LessonNotes' }, icon: 'fa-solid fa-eye', additional: true},
          { header: 'Edit Lesson', to: { name: 'LessonDetails', route: {id: lesson.value.attributes.id} }, modal: 'EditLesson', icon: 'fa-solid fa-edit', additional: true})
      }
      if(user.hasPermission('ATTENDANCE_R', lesson.value.school.id) || user.hasPermission('ATTENDANCE_V')){
        actionsArray.push({ header: 'View Attendance', to: { name: 'LessonAttendanceSingle' }, icon: 'fa-solid fa-user-check', additional: true})
      }
      if(user.hasPermission('LESSONS_D', lesson.value.school.id)){
        actionsArray.push({ header: 'Delete Lesson', to: { name: 'LessonDetails' }, modal: 'DeleteLesson', icon: 'fa-solid fa-trash', additional: true, red: true})
      }
      if(lesson.value.attributes.status != 'Active' && lessonDetailsSet()){
        actionsArray.unshift({ header: 'Set Lesson as Active', to: { name: 'LessonConfirmActive' }, icon: 'fa-solid fa-circle-check', additional: true, green: true})
      }
      actions.setItems(actionsArray)
    }

    function lessonDetailsSet(){
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

    watch(() => lessonStore.singleLesson, (newValue) => {
      lesson.value = newValue
    }, {deep: true})

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