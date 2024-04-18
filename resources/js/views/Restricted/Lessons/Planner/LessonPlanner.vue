<template>
  <div>
    {{ selectedDate }}
    <section id="planner-page">   
      <HeaderLine heading="Lesson Planner" />
      <div id="date-banner" style="padding: 0 10px;">
        <div id="date" v-if="!mobileFormat">{{ moment(selectedDate).format('dddd - MMMM Do, YYYY') }}</div>
        <div id="date" v-else>{{ moment(selectedDate).format('ddd - MMM Do') }}</div>
          <DateScroller @selectedDate="updateDate"/>
      </div>
    </section>      
    <!-- <PlannerTable /> -->
    <!-- Table component -->
    <section v-if="dayLessons">
      <component :is="currentComponent" :lessons="dayLessons" :date="selectedDate" />
    </section>
    <!-- <LoadingSpinner :isLoading="filteredLessons.length < 1 && loading" :loadingText="true" color="primary" /> -->

  </div>
</template>

<script setup>
import moment from 'moment';
import { useLessonsStore } from '../../../../stores/lessons';
import { useAppStore } from '../../../../stores/appStore';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { computed, ref, watch } from 'vue';
import useSorter from '../../../../composables/useSorter';
import DateScroller from '../../../../components/Layouts/MainLayout/Elements/DateScroller.vue';
import { useWindowSize } from '../../../../composables/useWindowSize';
import PlannerTable from './ListComponents/PlannerTable.vue'
import PlannerTableMobile from './ListComponents/PlannerTableMobile.vue';

const lessonStore = useLessonsStore()
const appStore = useAppStore()
const sorter = useSorter()
const selectedDate = ref(moment(appStore.getItems.date))
const mobileFormat = useWindowSize().mobileFormat
const refresh = ref(0)
const { windowSize } = useWindowSize()


// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? PlannerTable : PlannerTableMobile
})

const dayLessons = computed(() => {
  const selectedDateString = moment(selectedDate.value).format('YYYY-MM-DD');
  return lessonStore.getLessonsData.filter(l => 
    l.attributes.status === 'Active' &&
    l.attributes.day === moment(selectedDate.value).format('dddd') &&
    l.attributes.startDate <= selectedDateString &&
    (!l.attributes.endDate || l.attributes.endDate >= selectedDateString)
  );
});

sorter.sort(dayLessons.value, 'attributes.start')

function sortLessons(sortValue){
  sorter.sort(dayLessons.value, sortValue)
  refresh.value++
}

function updateDate(newDate){
  selectedDate.value = newDate
  sorter.sort(dayLessons.value, 'attributes.start')
}

function getNum(type){
  if(type != 'total'){
    console.log(dayLessons.value.filter(l => l.attendance.filter(a => a.attendance === type)).length);
    return dayLessons.value.filter(l => l.attendance.filter(a => a.attendance === type)).length
  }
  return dayLessons.value.length
}
function getMarkedLessons(type) {
  return dayLessons.value.filter(lesson =>
    lesson.attendance.some(a => a.attendance === type)
  ).length;
}
function getUnmarkedLessons(){
  return dayLessons.value.filter(lesson =>
    !lesson.attendance.some(a => ['present', 'late', 'absent', 'custom'].includes(a.attendance))
  ).length;
}

watch(() => dayLessons.value, () => {
  sorter.sort(dayLessons.value, 'attributes.start')
})

</script>

<style lang="scss" scoped>
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