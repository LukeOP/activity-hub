<template>
  <div class="row">
    <HeaderLine heading="Instrument Hires" link1="Instrument List" @link1="routeChange" />

    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Hire search..." v-model="search" disabled>
    </div>

    <!-- Table component -->
    <section v-if="filteredHires">
      <component :is="currentComponent" :hires="filteredHires" :key="key" />
    </section>

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import { useWindowSize } from '/resources/js/composables/useWindowSize';

import HeaderLine from '../../../Layouts/MainLayout/Elements/HeaderLine.vue'
import HiresTable from './ListComponents/HiresTable.vue'
import HiresTableMobile from './ListComponents/HiresTableMobile.vue';

import { useHireStore } from '/resources/js/stores/hires';
import { computed, ref } from 'vue';
import { useRouter } from 'vue-router';

const key = ref(0)


// Initiate Stores
const hireStore = useHireStore()

// Initiate Composables
const { windowSize } = useWindowSize()
const router = useRouter()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? HiresTable : HiresTableMobile
})

// Fetch Hire data and add to store
const { data: allHires, fetchData: fetchHires } = useApi('hires')
if(hireStore.getHires.length < 1){
  fetchHires().then(()=>{
    hireStore.setHires(allHires.value)
    key.value++
  })
}

// Initiate search variable
const search = ref('')

// Returns array of hires based on search term, stores array in hire Store
const filteredHires = computed(() => {
  const searchTerm = search.value.toLowerCase();
  const filterFunction = i => (
    i.name.toLowerCase().includes(searchTerm)
  );

  const filtered = searchTerm.length > 0
    ? hireStore.getHires.filter(filterFunction)
    : hireStore.getHires;

  hireStore.setFilteredHires(filtered);
  return filtered;
});

// Handle Route Change
function routeChange(value){
  router.push({name: 'InstrumentList'})
}

</script>

<style lang="scss" scoped>

</style>