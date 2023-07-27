<template>
  <div>
    <div class="row mb-3" id="lesson-heading">
      <div class="col col-12 col-md-8">
        <h2>{{lesson.student.first_name}} {{lesson.student.last_name}}'s Attendance: </h2>
        <h3>{{lesson.attributes.instrument}} lessons with {{lesson.tutor.first_name}} {{lesson.tutor.last_name}}</h3>
      </div>
      <div class="col col-12 col-md-4">
        <div id="detailsBtn" class="float-end btn btn-outline-primary form-control mb-2" @click="routeChange({name: 'LessonDetails', params: {id: lesson.id}})">Lesson Details</div>
      </div>
    </div>
    
    <div class="row mb-4">
      <div class="col-12 col-sm-4">
        <AttendanceSnapshot :lesson="lesson" heading="Overall Attendance" />
      </div>
    </div>

    <div class="row">
      <AttendanceTable :lesson="lesson" :key="tableKey"/>
    </div>
    
    <div class="modal-route">
        <router-view></router-view>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import AttendanceSnapshot from './AttendanceSnapshot.vue'
import AttendanceTable from './AttendanceTable.vue'
import { useRouter } from 'vue-router'
import { useFilterStore } from '../../../../stores/filter'
import { useLessonsStore } from '../../../../stores/lessons'

const lessonStore = useLessonsStore()
const filter = useFilterStore()
const router = useRouter()
const tableKey = ref(0)
filter.setData(lessonStore.getLessonData)
filter.setType('AttendanceSingleForm')

const lesson = computed(()=>{
  tableKey.value++
  return Object.keys(filter.getReturned).length > 0 
  ? filter.getReturned 
  : lessonStore.getLessonData 
})

function routeChange(path){
  filter.setType('')
  router.push(path)
}
</script>

<style lang="scss" scoped>
#lesson-heading {
  border-bottom: 2px solid $ah-primary;
}
#detailsBtn {
  max-width: fit-content;
}

</style>