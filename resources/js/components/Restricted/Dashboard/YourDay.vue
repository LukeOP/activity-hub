<template>
  <div class="row">
    <div class="col col-12">
      <h2>Lessons</h2>
      <calendar class="calendar" />
    </div>

    <div class="modal-route">
        <router-view></router-view>
    </div>
  </div>
</template>

<script setup>
import { useActionsStore } from '../../../stores/actions'
import Calendar from './Calendar.vue'

const actions = useActionsStore()

const actionArray = [
  { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
  { header: 'Lesson Attendance', to: { name: 'LessonAttendanceOverview' }, showSubItems: false, icon: 'fa-solid fa-user-check'},
]
actions.setItems(actionArray)
</script>

<style lang="scss" scoped>
  .calendar {
    height: calc(100vh - 150px);
    max-height: 710px;
  }

</style>