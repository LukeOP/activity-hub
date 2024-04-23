<template>  
<div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('attributes.name')">Event:</th>
          <th @click="sortData('attributes.description')">Description:</th>
          <th @click="sortData('attributes.date')">Date:</th>
          <th @click="sortData('attributes.date')">Term:</th>
          <th @click="sortData('school.name')" v-if="user.getSchools.length > 1">School:</th>
          <th style="width: 45px;"></th>
        </tr>
      </thead>
      <tbody v-if="events.length > 0">
        <tr v-for="event in events" :key="event.id" @click="handleClick(event)">
          <td>{{ event.attributes.name }}</td>
          <td>{{ event.attributes.description }}</td>
          <td>{{formatDate(event.attributes.date)}}</td>
          <td>{{event.attributes.term}}</td>
          <td v-if="user.getSchools.length > 1">{{event.school.name}}</td>
          <td style="width: 45px;">
            <i v-if="jobsOverdue(event)" class="fa-solid fa-triangle-exclamation fa-2x" :class="{userAlert: userJobsOverdue(event)}"></i>
            <!-- <div>Overdue Jobs</div> -->
          </td>
        </tr>
      </tbody>
      <tbody v-else><tr><td colspan="5">No Events</td></tr></tbody>
    </table>
  </section>

  <div class="col-12 col-md-4 totals">
    <span>Displaying: {{getNum('filtered')}}/{{getNum('total')}}</span>
  </div>
  
</div>
</template>
<script setup>
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'
import { useEventStore } from '../../../../stores/events'
import { useUserStore } from '/resources/js/stores/user';
import moment from 'moment';


  const router = useRouter()
  const sorter = useSorter()
  const eventStore = useEventStore()
  const user = useUserStore()

  const props = defineProps({events: Array})


  function handleClick(event){
    eventStore.setEvent(event.id)
    router.push({
      name: 'EventDetails'
    })
  }

  function getNum(type){
    if(type === 'filtered'){
      return props.events.length
    }
    if(type === 'total'){
      return eventStore.getEvents.length
    }
    return eventStore.getEvents.length
  }

  function sortData(field){
    sorter.sort(props.events, field)
  }

  function formatDate(date){
    let formattedDate = moment(date).format('MMM Do, YYYY');
    if(formattedDate != 'Invalid date'){
      return formattedDate
    } return '-'
  }

  function jobsOverdue(event) {
    return event.jobs.some(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
  }
  function userJobsOverdue(event){
    if(user.hasPermission('EVENTS_E', event.school.id)) return true
    let overdueJobs = event.jobs.filter(j => (j.due_date < moment().format('YYYY-MM-DD') && j.status == 0))
    return overdueJobs.some(j => j.users.some(u => u.attributes.id == user.attributes.id))
  }

</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
}
.fa-triangle-exclamation {
  color: $ah-primary;
}
.userAlert{
  color: rgb(222, 14, 14);
}

</style>