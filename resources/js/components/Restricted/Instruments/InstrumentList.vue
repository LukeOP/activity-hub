<template>
  <div class="row">
    <HeaderLine heading="Instruments" :link1="links.link1"
      @link1="routeChange" />

    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Instrument search..." v-model="search" disabled>
    </div>

    <!-- Table component -->
    <section v-if="filteredInstruments">
      <component :is="currentComponent" :instruments="filteredInstruments" :key="key" />
    </section>

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { useWindowSize } from '/resources/js/composables/useWindowSize';

import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue'
import InstrumentsTable from './ListComponents/InstrumentsTable.vue'
import InstrumentsTableMobile from './ListComponents/InstrumentsTableMobile.vue';

import { useInstrumentStore } from '/resources/js/stores/instruments';
import { computed, ref } from 'vue';
import { useUserStore } from '/resources/js/stores/user';
import router from '/resources/js/router/router';

const key = ref(0)
const links = ref({link1: ''})


// Initiate Stores
const instrumentStore = useInstrumentStore()
const user = useUserStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? InstrumentsTable : InstrumentsTableMobile
})

// Set user permission areas
if(user.hasPermissionAny('HIRES_V')) links.value.link1 = 'Instrument Hire'


// Fetch Instrument data and add to store
const { data: allInstruments, fetchData: fetchInstruments } = useApi('instruments')
if(instrumentStore.getInstruments.length < 1){
  fetchInstruments().then(()=>{
    instrumentStore.setInstruments(allInstruments.value)
    key.value++
  })
}

// Initiate search variable
const search = ref('')

// Returns array of instruments based on search term, stores array in instrument Store
const filteredInstruments = computed(() => {
  const searchTerm = search.value.toLowerCase();
  const filterFunction = i => (
    i.name.toLowerCase().includes(searchTerm)
  );

  const filtered = searchTerm.length > 0
    ? instrumentStore.getInstruments.filter(filterFunction)
    : instrumentStore.getInstruments;

  instrumentStore.setFilteredInstruments(filtered);
  return filtered;
});

// Handle route change
function routeChange(value) {
  let route = {}
  if(value === 'link1') route = {name: 'HiresList'}
  router.push(route)
}

</script>

<style lang="scss" scoped>

</style>