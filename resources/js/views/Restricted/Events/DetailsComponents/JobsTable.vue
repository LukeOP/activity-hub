<template>
  <div>
    <table style="width: 100%;">
        <thead>
          <tr>
            <th>Description:</th>
            <th style="width: 150px;">Assigned:</th>
            <th style="width: 150px;">Due Date:</th>
            <th style="width: 60px;">Status:</th>
            <th style="width: 60px;"></th>
          </tr>
        </thead>
    
        <tbody v-if="eventStore.getEvent.jobs.length > 0">
          <!-- Iterate over each section of jobs -->
          <template v-for="(jobs, index) in jobSections" :key="jobs">
            <!-- Table row for the section heading -->
            <tr class="countdown-section">
              <td colspan="5" class="countdown-headings">{{ countdownText(jobs) }}</td>
            </tr>
            <!-- Table rows for each job in the section -->
            <JobRow v-for="job in jobsInSection(jobs)" :key="job.id" :job="job" />
            <tr v-if="index < jobSections.length - 1" class="line">
              <td colspan="5"><hr style="margin: 0;"></td>
            </tr>
          </template>
        </tbody>
    </table>
    <div style="margin-bottom: 7rem;"></div>
  </div>
</template>

<script setup>
import moment from 'moment';
import useApi from '/resources/js/composables/useApi';
import { useEventStore } from '/resources/js/stores/events';
import { computed, ref } from 'vue';
import JobRow from './JobRow.vue'
import useSorter from '../../../../composables/useSorter';

const eventStore = useEventStore()
const sorter = useSorter()
const currentEvent = eventStore.getEvent

// calculate the number of weeks before an event job
function jobTimeBeforeEvent(job_date){
  let job = moment(job_date)
  let due_date = moment(currentEvent.attributes.date)
  return due_date.diff(job, 'days')
}

// Create array of weeks before jobs are due
const jobSections = computed(()=>{
  let sortedJobs = eventStore.getEvent.jobs
  sorter.sort(sortedJobs, 'due_date')
  return Array.from(new Set(sortedJobs.map(j => jobTimeBeforeEvent(j.due_date))))
})

// Filter job list based on number of weeks remaining
function jobsInSection(section_num){
  return currentEvent.jobs.filter(j => jobTimeBeforeEvent(j.due_date) == section_num)
}

function countdownText(jobs){
    if (jobs > 7) {
      const weeks = Math.round(jobs / 7);
      return `${weeks} week${weeks > 1 ? 's' : ''} prior to event.`;
    } else if (jobs > 0) {
      return `${jobs} day${jobs > 1 ? 's' : ''} prior to event.`;
    } else if (jobs === 0) {
      return 'Day of the event.';
    } else {
      return 'After the event.';
    }
}


</script>

<style lang="scss" scoped>
.countdown-section {
  display: contents;
}
.countdown-headings {
  padding-left: 10px;
  font-size: 1rem;
  font-weight: bold;
  // text-decoration: underline;
}
tr {
  border: none;
  &:hover {
    cursor: default;
  }
}
.line{
  &:hover {
    background-color: transparent;
  }
}
.jobRow {
  margin-bottom: 3rem;
}

</style>