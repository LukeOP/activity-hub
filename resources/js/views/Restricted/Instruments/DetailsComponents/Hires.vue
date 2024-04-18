<template>
  <section id="main-section" v-if="hires">
    <h3>Hires</h3>

    <!-- Table component -->
    <section v-if="hires">
      <component :is="currentComponent" :hires="hires" :key="key" />
    </section>

    <div v-else class="text-center" id="UI-note">-- No hires yet --</div>
    <hr />
  </section>
</template>

<script setup>
import { useInstrumentStore } from '/resources/js/stores/instruments';
import useApi from '/resources/js/composables/useApi';
import { useRouter } from 'vue-router';
import { useHireStore } from '/resources/js/stores/hires';
import { computed, ref, watch } from 'vue';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import HiresTable from './HiresTable.vue';
import HiresTableMobile from './HiresTableMobile.vue';

const instrumentStore = useInstrumentStore()
const hireStore = useHireStore()
const router = useRouter()
const key = ref(0)

const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? HiresTable : HiresTableMobile
})


// Fetch Hire data for instrument
const { data: hires, fetchData: fetchHires } = useApi('instrument-hires/' + instrumentStore.getInstrument.id)
fetchHires()

watch(() => hireStore.getHires, (newValue) => {
  fetchHires()
})

function viewHire(hire){
  hireStore.setHire(hire)
  router.push({
    name: 'HireDetails'
  })
}

</script>

<style lang="scss" scoped>
#main-section {
  padding: 10px 10px 1rem;
  // border-bottom: 1px dashed $ah-primary;
}
#UI-note {
  color: $ah-primary;
  font-size: 1.5rem;
}

</style>