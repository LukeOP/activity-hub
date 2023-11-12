<template>
  <section id="main-section" v-if="hires">
    <h3>Hires</h3>
    <section id="table-header-section">
      <table>
        <thead>
          <tr>
            <th @click="sortData('attributes.name')">Hirer:</th>
            <th @click="sortData('attributes.name')">Hire Date:</th>
            <th @click="sortData('attributes.name')">Expected Return:</th>
            <th @click="sortData('attributes.name')">Returned:</th>
            <th @click="sortData('attributes.name')">Form Signed:</th>
          </tr>
        </thead>
      </table>
    </section>

    <section id="table-body-section" style="overflow-y:auto" v-if="hires.length > 0">
      <table>
        <tbody>
          <tr v-for="hire in hires" :key="hire.id" @click="viewHire(hire)">
            <td>{{ hire.student.full_name }}</td>
            <td>{{ hire.attributes.start_date }}</td>
            <td>{{ hire.attributes.return_date }}</td>
            <td>{{ hire.attributes.returned_date }}</td>
            <td>{{ hire.attributes.form_signed === 0 ? 'No' : 'Yes' }}</td>
          </tr>
        </tbody>
      </table>
    </section>
    <div v-else class="text-center" id="UI-note">-- No hires yet --</div>
  </section>
</template>

<script setup>
import { useInstrumentStore } from '/resources/js/stores/instruments';
import useApi from '/resources/js/composables/useApi';
import { useRouter } from 'vue-router';
import { useHireStore } from '/resources/js/stores/hires';
import { watch } from 'vue';

const instrumentStore = useInstrumentStore()
const hireStore = useHireStore()
const router = useRouter()


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
  padding: 10px 10px 2rem;
  border-bottom: 1px dashed $ah-primary;
}
#UI-note {
  color: $ah-primary;
  font-size: 1.5rem;
}

</style>