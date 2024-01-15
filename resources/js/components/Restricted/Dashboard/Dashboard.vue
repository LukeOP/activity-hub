<template>
  <div v-if="ready" class="row">
    <NewUserSetUp v-if="!hasSchools" />
    <div class="col col-12 col-xl-6">
      <LessonList />
      <button @click="sendTestEmail">Test Emails</button>
    </div>
    

  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue';
import { useActionsStore } from '../../../stores/actions'
import { useUserStore } from '../../../stores/user';
import NewUserSetUp from './NewUserSetUp.vue';
import LessonList from './LessonList.vue';
import axiosClient from '/resources/js/axios';

const user = useUserStore()
const actions = useActionsStore()
const hasSchools = ref(false)
const ready = ref(false)

const actionArray = []

function setActions(){
  if(user.attributes.schools.length > 0) {
    if(user.hasPermissionAny('LESSONS_C')){
      actionArray.push({ header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'})
    }
    if(user.hasPermissionAny('ATTENDANCE_R') || user.hasPermissionAny('ATTENDANCE_V')){
      actionArray.push({ header: 'Lesson Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'})
    }
    hasSchools.value = true
  }
  actions.setItems(actionArray)
  ready.value = true
}

watch(() => user.attributes.schools, (newValue) => {
  setActions()
})

onMounted(()=>{
  setTimeout(()=>{
    setActions()
  },500)
  
})

function sendTestEmail(){
  axiosClient.post('email-test').then(res => {
    console.log(res.data)
  })
}


</script>

<style lang="scss" scoped>
  .calendar {
    height: calc(100vh - 150px);
    max-height: 710px;
  }

</style>