<template>
<div>
  <div v-if="ready" class="row">
    <NewUserSetUp v-if="!hasSchools" />
  </div>
  <InfoTiles />
  <div id="dashboard-tiles">
    <div class="tile-row">
      <div class="mobile-full" style="flex: 66%;"><LessonList /></div>
      <div class="mobile-full" style="flex: 34%;"><AttendanceTile /></div>
    </div>
    <div class="tile-row">
      <div class="mobile-full" style="flex: 50%;"><EventList /></div>
      <div class="mobile-full" style="flex: 50%;"><RoomsTile /></div>
    </div>
  </div>
</div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue';
import { useActionsStore } from '../../../stores/actions'
import { useUserStore } from '../../../stores/user';
import NewUserSetUp from './NewUserSetUp.vue';
import LessonList from './LessonList.vue';
import AttendanceTile from './AttendanceTile.vue';
import EventList from './EventList.vue';
import RoomsTile from './RoomsTile.vue';
import InfoTiles from './InfoTiles/InfoTiles.vue';

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


</script>

<style lang="scss" scoped>
  .calendar {
    height: calc(100vh - 150px);
    max-height: 710px;
  }
  #dashboard-tiles {
    display: flex;
    flex-wrap: wrap;
  }
  .tile-row {
    width: 100%;
    display: flex;
    div {
      margin-right: 2rem;
      &:last-of-type{
        margin-right: 0;
      }
    }
  }

  @media (max-width: 768px) {
    #dashboard-tiles {
      display: block;
      .tile-row {
        display: block;
      }
      .mobile-full {
        display: block;
        width: 100%;
      }

    }
  }

</style>