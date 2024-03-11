<template>
  <div>
    <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th>Description:</th>
          <th style="width: 150px;">Date:</th>
          <th style="width: 60px;">Status:</th>
          <th style="width: 60px;" v-if="deleteJobs" >Delete:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto" v-if="eventStore.getEventJobs.length > 0">
    <div class="countdown-section" v-for="jobs in jobSections" :key="jobs">
      <span class="countdown-headings">{{ countdownText(jobs) }}</span>
      <table>
        <tbody>
          <tr v-for="job in jobsInSection(jobs)" :key="job" @click="toggleStatus(job)">
            <td>{{ job.description }}</td>
            <td style="width: 150px;">{{ moment(job.due_date).format('DD-MM-YYYY') }}</td>
            <td style="width: 60px;">
              <div style="width: 40px;">
                <StatusIconSVG :status="getStatus(job)" />
              </div>
            </td>
            <td v-if="deleteJobs" style="width: 40px;"><i class="fa fa-trash"></i></td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
  </div>
</template>

<script setup>
import moment from 'moment';
import StatusIconSVG from '/resources/js/components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import useApi from '/resources/js/composables/useApi';
import { useEventStore } from '/resources/js/stores/events';
import { computed, ref } from 'vue';
import axiosClient from '/resources/js/axios';

const eventStore = useEventStore()
const currentEvent = eventStore.getEvent
const deleteJobs = ref(false)

const {data: jobs, fetchData: fetchJobs} = useApi(`/event-jobs-list/${currentEvent.id}`)
fetchJobs().then(()=>{
  eventStore.setEventJobs(jobs.value)
})

function getStatus(job){
  let status = 'pending'
  let today = moment().format('YYYY-MM-DD')
  job.due_date <= today ? status = 'incomplete' : status = 'pending'
  return job.status == '0' ? status : 'complete'
}

// calculate the number of weeks before an event job
function jobTimeBeforeEvent(job_date){
  let job = moment(job_date)
  let due_date = moment(currentEvent.attributes.date)
  return due_date.diff(job, 'days')
}

// Create array of weeks before jobs are due
const jobSections = computed(()=>{
  return Array.from(new Set(eventStore.getEventJobs.map(j => jobTimeBeforeEvent(j.due_date))))
})

// Filter job list based on number of weeks remaining
function jobsInSection(section_num){
  return eventStore.getEventJobs.filter(j => jobTimeBeforeEvent(j.due_date) == section_num)
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

// Handle job click to change status
function toggleStatus(job){
  axiosClient.patch(`event-jobs/${job.id}`, {status: 1}).then((res)=>{
    job.status === 0 ? job.status = 1 : job.status = 0
  })
}


</script>

<style lang="scss" scoped>
.countdown-section {
  margin-top: 1rem;
}
.countdown-headings {
  font-weight: bold;
  font-size: 1rem;
  padding-left: 10px;
  margin-top: 3rem;
}
tr {
  border: none;
}

</style>