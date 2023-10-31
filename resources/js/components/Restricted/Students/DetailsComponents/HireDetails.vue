<template>
  <div id="hire-details" class="section" v-if="student.contacts != null">
    <h2>Hire Details:</h2>
    <h3>
      <span class="tab" :class="{active: showActiveHires}" @click="showActiveHires = true">Active Hires</span>
      <span class="tab" :class="{active: !showActiveHires}" @click="showActiveHires = false">Concluded Hires</span>
    </h3>
    <div id="hire-list" class="row" v-if="showActiveHires">
      <div class="col col-12 col-md-6" v-for="hire in hires" :key="hire">
        <SingleHireTile :hire="hire" />
      </div>
    </div>
    <div id="hire-list" class="row" v-if="!showActiveHires">
      <div class="col col-12 col-md-6" v-for="hire in pastHires" :key="hire">
        <SingleHireTile :hire="hire" />
      </div>
    </div>
  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import SingleHireTile from './SingleHireTile.vue'
import { ref } from 'vue'
import { useHireStore } from '/resources/js/stores/hires';

const props = defineProps({student:Object})
const showActiveHires = ref(true)
const hireStore = useHireStore()

const { data: hires, fetchData: fetchHires } = useApi('student-hires/' + props.student.id)
fetchHires()

const { data: pastHires, fetchData: fetchPastHires } = useApi('student-hires/past/' + props.student.id)
fetchPastHires()

</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-size: 1.5rem;
}
.tab {
  font-size: 1rem;
  display: inline-block;
  color: $ah-grey;
  font-weight: bold;
  margin-right: 0.3rem;
  &:hover {
    cursor: pointer;
  }
}
.section {
  padding: 10px 10px 2rem;
  border-bottom: 1px dashed $ah-primary;
}
.active {
  color: $ah-primary-dark;
}

</style>