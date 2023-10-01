<template>
  <div>
    <HeaderLine :heading="lesson.student.full_name + `'s Attendance:`" :school="lesson.attributes.instrument + ' lessons with ' + lesson.tutor.full_name"
      link1="Lesson Details" @link1="routeChange({name: 'LessonDetails'})"/>
    
    <div class="row mb-4">
      <div class="col-12 col-sm-4">
        <AttendanceSnapshot :lesson="lesson" heading="Overall Attendance" stats="true" />
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
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'

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