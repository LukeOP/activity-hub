<template>
  <LoadingSkeleton v-if="loading" class="user-element">
    <UserElementHeader heading="Upcoming Events" />
    <LoadingSpinner :isLoading="true" :loadingText="true" color="primary" />
  </LoadingSkeleton>
  <div v-else class="user-element">
    <UserElementHeader heading="Upcoming Events" />
    <!-- {{ events }} -->

  <section style="overflow-y:auto">
    <table>
      <tbody v-if="events.length > 0">
        <tr v-for="event in events.slice(0, 5)" :key="event.id" @click="viewEvent(event)">
          <td style="flex-grow: 2;">{{ event.attributes.name }}</td>
          <td>{{event.attributes.date}}</td>
          <td style="width: 45px;" >
            <i v-if="jobsOverdue(event)" class="fa-solid fa-triangle-exclamation fa-2x" :class="{userAlert: userJobsOverdue(event)}"></i>
            <!-- <div>Overdue Jobs</div> -->
          </td>
        </tr>
      </tbody>
      <tbody v-else>
        <tr><td>No Upcoming Events</td></tr>
      </tbody>
    </table>
  </section>
  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import UserElementHeader from '../../../components/Layouts/MainLayout/Elements/UserElementHeader.vue';
import { useEventStore } from '/resources/js/stores/events';
import useSorter from '/resources/js/composables/useSorter';
import { computed } from 'vue';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import LoadingSkeleton from '../../../components/Layouts/MainLayout/Elements/LoadingSkeleton.vue';
import { useUserStore } from '../../../stores/user';
import moment from 'moment';
import { useRouter } from 'vue-router';

// Initiate Stores
const eventStore = useEventStore()
const user = useUserStore()

//Initiate Composables
const sorter = useSorter()
const router = useRouter()


// Fetch Lesson Data
const { data: events, loading, fetchData: fetchLessons } = useApi('events')
fetchLessons().then(()=> {
  if(events.value != null) sorter.sort(events.value, 'id', 'desc')
  eventStore.setEvents(events.value)
})

function jobsOverdue(event) {
    return event.jobs.some(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
  }
function userJobsOverdue(event){
  if(user.hasPermission('EVENTS_E', event.school.id)) return true
  let overdueJobs = event.jobs.filter(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
  return overdueJobs.some(j => j.users.some(u => u.attributes.id == user.attributes.id))
}

function viewEvent(event){
  eventStore.setEvent(event.id)
  router.push({
    name: 'EventDetails'
  })
}

</script>

<style lang="scss" scoped>
tr {
  display: flex;
  border: none;
  height: 52px;
  align-items: center;
  td {
    padding: 10px;
  }
}
.fa-triangle-exclamation {
  color: $ah-primary;
}
.userAlert{
  color: rgb(222, 14, 14);
}
</style>