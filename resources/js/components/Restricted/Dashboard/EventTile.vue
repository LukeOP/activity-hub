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
      <tbody v-if="events">
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
import useSorter from '/resources/js/composables/useSorter';
import { computed } from 'vue';
import LoadingSpinner from '../../Layouts/MainLayout/Elements/LoadingSpinner.vue';
import LoadingSkeleton from '../../Layouts/MainLayout/Elements/LoadingSkeleton.vue';

// Initiate Stores
const eventStore = useEventStore()

//Initiate Composables
const sorter = useSorter()


// Fetch Lesson Data
const { data: events, loading, fetchData: fetchLessons } = useApi('events')
fetchLessons().then(()=> {
  sorter.sort(events.value, 'id', 'desc')
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