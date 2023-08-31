<template>
  <div v-if="ready">
    <NewUserSetUp v-if="!hasSchools" />
    <Calendar class="calendar" />

  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { useActionsStore } from '../../../stores/actions'
import { useUserStore } from '../../../stores/user';
import Calendar from './Calendar.vue'
import NewUserSetUp from './NewUserSetUp.vue';

const user = useUserStore()
const actions = useActionsStore()
const hasSchools = ref(false)
const ready = ref(false)

const actionArray = []

function setActions(){
  if(user.attributes.schools.length > 0) {
    actionArray.push(
      { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
      { header: 'Lesson Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'}
    )
    hasSchools.value = true
  }
  actions.setItems(actionArray)
  ready.value = true
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