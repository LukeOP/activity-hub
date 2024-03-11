<template>
  <div class="row">
    <!-- <HeaderLine heading="Instrument Hires" link2="Hire Agreement Templates" @link2="routeChange('HireFormList')" link1="Instrument List" @link1="routeChange('InstrumentList')" /> -->
    <HeaderLine heading="Instrument Hires" link1="Instrument List" @link1="routeChange('InstrumentList')" />

    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Hire search..." v-model="search">
    </div>

    <!-- Table component -->
    <section v-if="filteredHires || hireStore.isLoading">
      <component :is="currentComponent" :hires="filteredHires" :key="key" />
    </section>
    <LoadingSpinner :isLoading="hireStore.isLoading" :loadingText="true" color="primary" />

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { useWindowSize } from '/resources/js/composables/useWindowSize';

import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import HiresTable from './ListComponents/HiresTable.vue'
import HiresTableMobile from './ListComponents/HiresTableMobile.vue';

import { useHireStore } from '/resources/js/stores/hires';
import { computed, onMounted, ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';
import { useFilterStore } from '/resources/js/stores/filter';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';

const key = ref(0)


// Initiate Stores
const hireStore = useHireStore()
const user = useUserStore()
const actions = useActionsStore()
const filter = useFilterStore()

// Initiate Composables
const { windowSize } = useWindowSize()
const router = useRouter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? HiresTable : HiresTableMobile
})

// Watch for changes in hire data and update list
watch(() => hireStore.getHires, (newValue) => {
  key.value++
})

// Watch for changes in filtered hire data and update list
watch(() => hireStore.getFilteredHires, (newValue) => {
  key.value++
})

// Initiate search variable
const search = ref('')

// Returns array of hires based on search term, stores array in hire Store
const filteredHires = computed(() => {
  const searchTerm = search.value.toLowerCase();
  
  const filterFunction = h => (
    h.instrument.attributes.name.toLowerCase().includes(searchTerm) ||
    h.student.first_name.toLowerCase().includes(searchTerm) ||
    h.student.last_name.toLowerCase().includes(searchTerm)
  );

  // Selects the filtered array if populated, otherwise uses the hires array
  const array = filter.getReturned.length > 0 
    ? filter.getReturned 
    : hireStore.getHires

  // Applies any search terms to the array
  let filtered = searchTerm.length > 0
    ? array.filter(filterFunction)
    : array;

  hireStore.setFilteredHires(filtered);
  return filtered
});

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

// Handle Route Change
function routeChange(value){
  router.push({name: value})
}

onMounted(() => {
  setActions()
})

</script>

<style lang="scss" scoped>

</style>