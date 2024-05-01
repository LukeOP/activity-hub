<template>
    <section id="planner-table">
      <table>
        <thead class="table-head">
          <tr>
            <th style="width: 80px;"></th>
            <th @click="sortLessons('attributes.start')">Lesson Time:</th>
            <th @click="sortLessons('student.last_name')">Student:</th>
            <th @click="sortLessons('attributes.instrument')">Instrument:</th>
            <!-- <th @click="sortLessons('school.room')">Room:</th> -->
            <th @click="sortLessons('tutor.last_name')">Tutor:</th>
            <th style="width: 50px;"></th>
          </tr>
        </thead>
        <tbody>
          <PlannerTableRow v-if="lessons.length > 0" :dayLessons="lessons" :date="date" :key="refresh"/>
          <tr v-else><td class="text-center" style="height: 50px; padding: 13px;" colspan="6">No lessons on this day</td></tr>
        </tbody>
      </table>

      <div class="col-12 col-md-6 totals">
        <span>Total: {{getNum('total')}}</span>
        <span>Present: {{getMarkedLessons('present')}}</span>
        <span>Late: {{getMarkedLessons('late')}}</span>
        <span>Absent: {{getMarkedLessons('absent')}}</span>
        <span>Unmarked: {{getUnmarkedLessons()}}</span>
        <span>Overdue: {{getMarkedLessons('incomplete')}}</span>
      </div>
    </section>
  </template>
  
  <script setup>
  import moment from 'moment';
  import { useLessonsStore } from '../../../../../stores/lessons';
  import { useAppStore } from '../../../../../stores/appStore';
  import { computed, ref, watch } from 'vue';
  import useSorter from '../../../../../composables/useSorter';
  import { useWindowSize } from '../../../../../composables/useWindowSize';
  import TableHeader from '../../../../../components/Layouts/MainLayout/Elements/TableHeader.vue';
  import TableBody from '../../../../../components/Layouts/MainLayout/Elements/TableBody.vue';
  import PlannerTableRow from '../ListComponents/PlannerTableRow.vue'
import { useSchoolStore } from '../../../../../stores/schools';

  const props = defineProps({lessons: Array, date: Object})
  
  const lessonStore = useLessonsStore()
  const appStore = useAppStore()
  const schoolStore = useSchoolStore()
  const sorter = useSorter()
  const selectedDate = ref(moment(appStore.getItems.date))
  const refresh = ref(0)
  
  // const dayLessons = computed(() => {
  //   const selectedDateString = moment(selectedDate.value).format('YYYY-MM-DD');
  //   return lessonStore.getLessonsData.filter(l => 
  //     l.attributes.status === 'Active' &&
  //     l.attributes.day === moment(selectedDate.value).format('dddd') &&
  //     l.attributes.startDate <= selectedDateString &&
  //     (!l.attributes.endDate || l.attributes.endDate >= selectedDateString)
  //     && (l.attributes.term_link == 0 
  //       || (l.attributes.term_link == 1 && schoolStore.getSchool.data.terms.some(t => (
  //           appStore.getItems.date >= t.start_date && appStore.getItems.date <= t.end_date))))
  //   );
  // });
  
  sorter.sort(props.lessons, 'attributes.start')
  
  function sortLessons(sortValue){
    sorter.sort(props.lessons, sortValue)
    refresh.value++
  }
  
  function getNum(type){
    if(type != 'total'){
      console.log(props.lessons.filter(l => l.attendance.filter(a => a.attendance === type)).length);
      return props.lessons.filter(l => l.attendance.filter(a => a.attendance === type)).length
    }
    return props.lessons.length
  }
  function getMarkedLessons(type) {
    return props.lessons.filter(lesson =>
      lesson.attendance.some(a => a.attendance === type)
    ).length;
  }
  function getUnmarkedLessons(){
    return props.lessons.filter(lesson =>
      !lesson.attendance.some(a => ['present', 'late', 'absent', 'custom'].includes(a.attendance))
    ).length;
  }
  
  watch(() => props.lessons, () => {
    sorter.sort(props.lessons, 'attributes.start')
  })
  
  </script>
  
  <style lang="scss" scoped>
  .table-head {
    height: 35px;
  }
  #date-banner{
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
    #date {
      font-size: 1.5rem;
    }
  }
  th {
    cursor:pointer;
  }
  
  
  </style>