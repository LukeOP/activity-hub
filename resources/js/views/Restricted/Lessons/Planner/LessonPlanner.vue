<template>
  <div>   
    <HeaderLine heading="Lesson Planner" />
    <div id="date-banner" style="padding: 0 10px;">
      <div id="date" v-if="!mobileFormat">{{ moment(selectedDate).format('dddd - MMMM Do, YYYY') }}</div>
      <div id="date" v-else>{{ moment(selectedDate).format('ddd - MMM Do') }}</div>
        <DateScroller @selectedDate="updateDate"/>
    </div>
    <!-- <pre>{{ dayLessons }}</pre> -->
    <TableHeader>
      <tr>
        <th style="width: 80px;"></th>
        <th @click="sortLessons('attributes.start')">Lesson Time:</th>
        <th @click="sortLessons('student.last_name')">Student:</th>
        <th @click="sortLessons('attributes.instrument')">Instrument:</th>
        <th @click="sortLessons('school.room')">Room:</th>
        <th @click="sortLessons('tutor.last_name')">Tutor:</th>
        <th style="width: 50px;"></th>
      </tr>
    </TableHeader>
    <TableBody>
      <PlannerTableRow v-if="dayLessons.length > 0" :dayLessons="dayLessons" :date="selectedDate" :key="refresh"/>
      <div v-else class="text-center" style="height: 50px; padding: 13px;">No lessons on this day</div>
    </TableBody>
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
import TableHeader from '../../../../components/Layouts/MainLayout/Elements/TableHeader.vue';
import TableBody from '../../../../components/Layouts/MainLayout/Elements/TableBody.vue';
import PlannerTableRow from './ListComponents/PlannerTableRow.vue'

const lessonStore = useLessonsStore()
const appStore = useAppStore()
const sorter = useSorter()
const selectedDate = ref(moment(appStore.getItems.date))
const mobileFormat = useWindowSize().mobileFormat
const refresh = ref(0)

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