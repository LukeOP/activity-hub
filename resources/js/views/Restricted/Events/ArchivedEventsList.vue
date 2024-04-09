<template>
  <div class="row">
    <HeaderLine heading="Archived Events" 
      link1="Current Events" @link1="routeChange"
      :link2="jobs.link2" @link2="routeChange"
    />

    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Event search..." v-model="search">
    </div>

    <!-- Table Component -->
    <section v-if="filteredEvents && !loading">
      <component :is="currentComponent" :events="filteredEvents" :key="key" />
    </section>
    <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />


  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue';
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { useEventStore } from '/resources/js/stores/events';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useRouter } from 'vue-router';
import useApi from '/resources/js/composables/useApi';
import EventsTable from './ListComponents/EventsTable.vue'
import EventsTableMobile from './ListComponents/EventsTableMobile.vue'
import { useFilterStore } from '/resources/js/stores/filter';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useSorter from '../../../composables/useSorter';

const key = ref(0)

// Initiate Stores
const eventStore = useEventStore()
const filter = useFilterStore()
const user = useUserStore()
const actions  = useActionsStore()

// Initiate Composables
const { windowSize } = useWindowSize()
const router = useRouter()
const sorter = useSorter()
// const loading = ref(false)

const jobs = ref({jobs: ''})


// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? EventsTable : EventsTableMobile
})

// Set Links
if(user.hasPermissionAny('EVENTS_TEMP_V')){
  jobs.value.link2 = 'Event Templates'
}


// Fetch Event data and add to store
const { data, loading, fetchData: fetchEvents } = useApi('events-archived')

// Initiate search variable
const search = ref('')

// Watch for changes in event data and update list
watch(() => eventStore.getEvents, (newValue) => {
  key.value++
})

const filteredEvents = computed(() => {
  const searchTerm = search.value.toLowerCase();

  const filterFunction = i => (
    i.attributes.name.toLowerCase().includes(searchTerm) ||
    i.attributes.description.toLowerCase().includes(searchTerm) ||
    i.school.name.toLowerCase().includes(searchTerm)
  );

  // Selects the filtered array if populated, otherwise uses the events array
  const array = filter.getReturned.length > 0 
    ? filter.getReturned 
    : eventStore.getArchivedEvents

  // Applies any search terms to the array
  const filtered = searchTerm.length > 0 
    ? array.filter(filterFunction) 
    : array;
  
  eventStore.setFilteredEvents(filtered);
  return filtered;

})

// Handle route change
function routeChange(value) {
  let route = {}
  if(value == 'link1') route = {name: 'EventsList'}
  if(value == 'link2') route = {name: 'TemplateList'}
  router.push(route)
}

onMounted(()=>{  
  loading.value = true
  fetchEvents().then(() => {
    let allEvents = [...eventStore.getEvents, ...data.value.data]
    sorter.sort(allEvents, 'attributes.date')
    eventStore.setEvents(allEvents)
    loading.value = false
  })
})

</script>

<style>

</style>