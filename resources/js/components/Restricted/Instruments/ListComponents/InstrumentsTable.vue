<template>  
<div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('attributes.name')">Instrument:</th>
          <th @click="sortData('attributes.type')">Type:</th>
          <th @click="sortData('attributes.notes')" style="width: 50%;">Notes:</th>
          <th @click="sortData('attributes.state.description')">State:</th>
          <th @click="sortData('school.name')" v-if="user.getSchools.length > 1">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="instrument in instruments" :key="instrument.id" @click="handleClick(instrument)">
          <td>{{ instrument.attributes.name }}</td>
          <td>{{ instrument.attributes.type }}</td>
          <td style="width: 50%;">{{instrument.attributes.notes}}</td>
          <td>{{instrument.attributes.state.description}}</td>
          <td v-if="user.getSchools.length > 1">{{instrument.school.name}}</td>
        </tr>
      </tbody>
    </table>
  </section>

  <div class="col-12 col-md-4 totals">
    <span>Displaying: {{getNum('filtered')}}/{{getNum('total')}}</span>
  </div>
  
</div>
</template>
<script setup>
import { useRouter } from 'vue-router'
import useSorter from '../../../../composables/useSorter'
import { useInstrumentStore } from '../../../../stores/instruments'
import { useUserStore } from '/resources/js/stores/user';


  const router = useRouter()
  const sorter = useSorter()
  const instrumentStore = useInstrumentStore()
  const user = useUserStore()

  const props = defineProps({instruments: Array})


  function handleClick(instrument){
    instrumentStore.setInstrument(instrument)
    router.push({
      name: 'InstrumentDetails'
    })
  }

  function getNum(type){
    if(type === 'filtered'){
      return props.instruments.length
    }
    if(type === 'total'){
      return instrumentStore.getInstruments.length
    }
    return instrumentStore.getInstruments.length
  }

  function sortData(field){
    sorter.sort(props.instruments, field)
  }

</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
}

</style>