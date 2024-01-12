<template>
  <div v-if="!loading" class="user-element">
    <UserElementHeader heading="Upcoming Events" />
    <!-- {{ events }} -->

  <section style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="event in events" :key="event.id">
          <td>{{ event.attributes.name }}</td>
          <td>{{event.attributes.date}}</td>
        </tr>
      </tbody>
    </table>
  </section>
  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import UserElementHeader from '../../Layouts/MainLayout/Elements/UserElementHeader.vue';
import { useEventStore } from '/resources/js/stores/events';

// Initiate Stores
const eventStore = useEventStore()

// Fetch Lesson Data
const { data: events, loading, fetchData: fetchLessons } = useApi('events')
fetchLessons().then(()=> {
  eventStore.setEvents(events.value)
})


</script>

<style lang="scss" scoped>
tr {
  border: none;
  display: flex;
  justify-content: space-between;
  td {
    padding: 10px;
  }
}

</style>