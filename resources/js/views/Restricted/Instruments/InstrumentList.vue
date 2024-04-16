<template>
  <div class="row">
    <HeaderLine heading="Instruments" :link1="links.link1"
      @link1="routeChange" />

    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Instrument search..." v-model="search">
    </div>

    <!-- Table component -->
    <section v-if="filteredInstruments">
      <component :is="currentComponent" :instruments="filteredInstruments" :key="key" />
    </section>
    <LoadingSpinner :isLoading="filteredInstruments.length < 1 && loading" :loadingText="true" color="primary" />

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { useWindowSize } from '/resources/js/composables/useWindowSize';

import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import InstrumentsTable from './ListComponents/InstrumentsTable.vue'
import InstrumentsTableMobile from './ListComponents/InstrumentsTableMobile.vue';

import { useInstrumentStore } from '/resources/js/stores/instruments';
import { computed, onUpdated, onMounted, ref, watch } from 'vue';
import { useUserStore } from '/resources/js/stores/user';
import router from '/resources/js/router/router';
import { useActionsStore } from '/resources/js/stores/actions';
import { useFilterStore } from '/resources/js/stores/filter';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';

const key = ref(0)
const links = ref({link1: ''})


// Initiate Stores
const instrumentStore = useInstrumentStore()
const user = useUserStore()
const actions = useActionsStore()
const filter = useFilterStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? InstrumentsTable : InstrumentsTableMobile
})

// Set user permission areas
if(user.hasPermissionAny('HIRES_V')) links.value.link1 = 'Instrument Hire'

// Fetch Instrument data and add to store
const { data: allInstruments, loading, fetchData: fetchInstruments } = useApi('instruments')

function getInstruments(){
  if(instrumentStore.getInstruments.length < 1){
    fetchInstruments().then(()=>{
      instrumentStore.setInstruments(allInstruments.value)
      key.value++
    })
  }
}
getInstruments()

// Set user actions
function setActions(){
  let actionsArray = []
  if(user.hasPermissionAny('INSTRUMENTS_C')){
      actionsArray.push({ header: 'New Instrument', to: { name: 'InstrumentList' }, modal: 'InstrumentCreate', icon: 'fa-solid fa-add'})
  }
  if(user.hasPermissionAny('HIRES_C')){
      actionsArray.push({ header: 'New Instrument Hire', to: { name: 'HiresList' }, modal: 'InstrumentHireCreate', icon: 'fa-solid fa-add'})
  }
  actions.setItems(actionsArray)
}
setActions()

// Set filter options
function setFilter(){
  filter.setData(instrumentStore.getInstruments)
  filter.setType('InstrumentsForm')
}
setFilter()


// Watch for changes in instrument data and update list
watch(() => instrumentStore.getInstruments, (newValue) => {
  key.value++
})

// Initiate search variable
const search = ref('')

// Returns array of instruments based on search term, stores array in instrument Store
const filteredInstruments = computed(() => {
  const searchTerm = search.value.toLowerCase();

  const filterFunction = i => (
    i.attributes.name.toLowerCase().includes(searchTerm) ||
    i.attributes.type.toLowerCase().includes(searchTerm) ||
    i.attributes.state.description.toLowerCase().includes(searchTerm)
  );

  // Selects the filtered array if populated, otherwise uses the instruments array
  const array = filter.getReturned.length > 0 
    ? filter.getReturned 
    : instrumentStore.getInstruments

  // Applies any search terms to the array
  const filtered = searchTerm.length > 0 
    ? array.filter(filterFunction) 
    : array;
  
  instrumentStore.setFilteredInstruments(filtered);
  return filtered;
});

// Handle route change
function routeChange(value) {
  let route = {}
  if(value === 'link1') route = {name: 'HiresList'}
  router.push(route)
}

onUpdated(()=>{ 
  setActions()
  setFilter()
})

onMounted(()=>{  
  fetchInstruments().then(()=>{
    if(allInstruments.value != instrumentStore.getInstruments){
      sorter.sort(allInstruments.value, 'attributes.name')
      instrumentStore.setInstruments(allInstruments.value)
    }
  })
})
</script>

<style lang="scss" scoped>

</style>