<template>
  <div>
    <Calendar class="calendar" />

  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useActionsStore } from '../../../stores/actions'
import { useUserStore } from '../../../stores/user';
import Calendar from './Calendar.vue'

const user = useUserStore()
const actions = useActionsStore()

const actionArray = [
]

function setActions(){
  if(user.attributes.schools.length > 0) {
    console.log('reached')
    actionArray.push(
      { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
      { header: 'Lesson Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'}
    )
  }
  actions.setItems(actionArray)
}
onMounted(()=>{
  setTimeout(()=>{
    setActions()
  },300)
  
})


</script>

<style lang="scss" scoped>
  .calendar {
    height: calc(100vh - 150px);
    max-height: 710px;
  }

</style>