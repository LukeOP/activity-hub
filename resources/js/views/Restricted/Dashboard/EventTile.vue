<template>
  <LoadingSkeleton v-if="eventStore.getEvents.length == 0 && loading" class="user-element">
    <UserElementHeader heading="Upcoming Events" />
    <LoadingSpinner :isLoading="true" :loadingText="true" color="primary" />
  </LoadingSkeleton>
  <div v-else class="user-element">
    <UserElementHeader heading="Upcoming Events" />
    <!-- {{ events }} -->

  <section>
    <div id="upcoming-events" v-if="eventStore.getEvents.length > 0">
      <div class="event-item" v-for="event in eventStore.getEvents.slice(0, 5)" :key="event.id" @click="viewEvent(event)">
        <div class="event-details">
          <div class="event-name">{{ event.attributes.name }}</div>
          <div class="event-date">{{ event.attributes.date }}</div>
        </div>
        <div class="event-flag"><i v-if="jobsOverdue(event)" class="fa-solid fa-triangle-exclamation fa-2x" :class="{userAlert: userJobsOverdue(event)}"></i></div>
      </div>
    </div>
    <div v-else>
      <p>No upcoming events</p>
    </div>
  </section>

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import UserElementHeader from '../../../components/Layouts/MainLayout/Elements/UserElementHeader.vue';
import { useEventStore } from '/resources/js/stores/events';
import useSorter from '/resources/js/composables/useSorter';
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
const { data: events, loading, fetchData: fetchEvents } = useApi('events')
fetchEvents().then(()=> {
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
#upcoming-events {
  .event-item {
    display: flex;
    align-items: center;
    height: 50px;
    .event-details {
      flex-grow: 1;
      display: flex;
      .event-name {
        padding-left: 10px;
        flex-grow: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      .event-date {
        min-width: 100px;
      }
    }
    .event-flag {
      min-width: 45px;
    }
    &:hover {
      background-color: $ah-primary-background;
      cursor: pointer;
    }
  }
}
@media (max-width: 768px){
  #upcoming-events {
  .event-item {
    display: flex;
    align-items: center;
    height: fit-content;
    border-bottom: 1px solid $ah-grey;
    padding-left: 10px;
    height: 70px;
    .event-details {
      display: block;
      width: calc(100% - 45px);
      .event-name {
        padding: 0;
        width: 100%;
        padding-right: 10px;
      }
      .event-date {
        width: 100%;
      }
    }
    .event-flag {
      width: 45px;
    }
  }
}
}
</style>