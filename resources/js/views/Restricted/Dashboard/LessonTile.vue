<template>
  <LoadingSkeleton v-if="lessonStore.loading" class="user-element">
    <UserElementHeader heading="Lessons By Date" />
    <LoadingSpinner :isLoading="true" :loadingText="true" color="primary" />
  </LoadingSkeleton>
  <div v-else class="user-element" @click="changeRoute()">
    <UserElementHeader heading="Lessons By Date" />
    <div id="date-banner" style="padding: 0 10px;">
      <div id="date" v-if="!mobileFormat">{{ moment(selectedDate).format('dddd - MMMM Do') }}</div>
      <div id="date" v-else>{{ moment(selectedDate).format('ddd - MMM Do') }}</div>
      <div id="btn-container">
        <DateScroller @click.stop="" @selectedDate="changeDate" />
      </div>
    </div>
    <div v-if="selectedDate <= moment() && dayLessons.length > 0" id="scheduled-lessons">Scheduled Lessons: {{ dayLessons.length }}</div>
    <div id="lesson-stats" v-if="selectedDate <= moment() && dayLessons.length > 0">
      <div class="stat-item">
        <span><StatusIconSVG status="present" /></span>
        <span class="item-text">Present: {{ getMarkedLessons('present') }}</span>
      </div>
      <div class="stat-item">
        <span><StatusIconSVG status="late" /></span>
        <span class="item-text">Late: {{ getMarkedLessons('late') }}</span></div>
      <div class="stat-item">
        <span><StatusIconSVG status="absent" /></span>
        <span class="item-text">Absent: {{ getMarkedLessons('absent') }}</span></div>
      <div class="stat-item" v-if="getMarkedLessons('custom') > 0">
        <span><StatusIconSVG status="custom" /></span>
        <span class="item-text">Custom: {{ getMarkedLessons('custom') }}</span></div>
      <div class="stat-item">
        <span><StatusIconSVG status="pending" /></span>
        <span class="item-text">Unmarked: {{ getUnmarkedLessons() }}</span></div>
    </div>
    <div v-else-if="selectedDate > moment() && dayLessons.length > 0">
      <div style="padding: 0 10px; font-size: 1.5rem;" class="text-primary text-center">{{ dayLessons.length }} Upcoming Lessons Scheduled</div>
    </div>
    <div v-else>
      <div style="padding: 0 10px; font-size: 1.5rem;" class="text-primary text-center">No Lessons On This Day</div></div>
  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { computed, ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import moment from 'moment';
import { useLessonsStore } from '/resources/js/stores/lessons';
import { useAppStore } from '/resources/js/stores/appStore';
import StatusIconSVG from '../../../components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import UserElementHeader from '../../../components/Layouts/MainLayout/Elements/UserElementHeader.vue';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import LoadingSkeleton from '../../../components/Layouts/MainLayout/Elements/LoadingSkeleton.vue';
import DateScroller from '../../../components/Layouts/MainLayout/Elements/DateScroller.vue';
import { useWindowSize } from '../../../composables/useWindowSize';


// Initiate Stores
const lessonStore = useLessonsStore()
const appStore = useAppStore()
lessonStore.checkLessonData()

// Initiate Composables
const router = useRouter()
const { mobileFormat } = useWindowSize()

// Initiate Variables
const selectedDate = ref(moment())

function changeDate(newDate){
  selectedDate.value = newDate
}

const dayLessons = computed(() => {
  const selectedDateString = moment(selectedDate.value).format('YYYY-MM-DD');
  return lessonStore.getLessonsData.filter(l => 
    l.attributes.status === 'Active' &&
    l.attributes.day === moment(selectedDate.value).format('dddd') &&
    l.attributes.startDate <= selectedDateString &&
    (!l.attributes.endDate || l.attributes.endDate >= selectedDateString)
  );
});

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

function changeRoute(){
  appStore.setItems({date: moment(selectedDate.value).format('YYYY-MM-DD')})
  router.push({
    name: 'LessonPlanner',
  })
}


</script>

<style lang="scss" scoped>
.user-element {
  min-height: 215px;
  height: fit-content;
  &:hover {
    cursor: pointer;
  box-shadow: 0 5px 10px rgb(223, 223, 223);
  }
}
#date-banner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 5px;
  // border-bottom: 3px solid $ah-primary;

  #date {
    font-size: 1.5rem;
  }

  #btn-container {
    button {
      border-radius: 0.375rem;
      min-width: 37px;
    }
  }
}
#scheduled-lessons{
  padding: 0 10px;
}
#lesson-stats {
  margin-top: 1rem;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  .stat-item {
    display: flex;
    border: 1px solid $ah-grey;
    color: $ah-primary;
    padding: 5px 1rem;
    border-radius: 0.25rem;
    margin: 10px;
    width: calc(25% - 20px);
    height: 50px;
    .item-text {
      align-self: center;
      padding-left: 20px;
    }
  }
}

@media (max-width: 768px){
  #date-banner {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 5px;
    // border-bottom: 3px solid $ah-primary;
    #date {
      font-size: 1.5rem;
    }
    #btn-container {
      button {
        border-radius: 0.375rem;
        min-width: 37px;
      }
    }
  }
  #scheduled-lessons{
    text-align: center;
    margin-top: 0.25rem;
  }
  #lesson-stats {
    margin-top: 1rem;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-wrap: wrap;
    .stat-item {
      display: flex;
      border: 1px solid $ah-grey;
      color: $ah-primary;
      padding: 5px 1rem;
      border-radius: 0.25rem;
      width: 100%;
      height: 50px;
      margin: 0 0 0.5rem 0;
      .item-text {
        align-self: center;
        padding-left: 20px;
      }
    }
  }
}


</style>