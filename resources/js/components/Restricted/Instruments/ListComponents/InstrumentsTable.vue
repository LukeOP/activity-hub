<template>  
<div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('instrument.name')">Instrument:</th>
          <th @click="sortData('instrument.fee')">Fee:</th>
          <th @click="sortData('instrument.notes')" style="width: 50%;">Notes:</th>
          <th @click="sortData('instrument.state')">State:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="instrument in filteredInstruments" :key="instrument.id" @click="handleClick(instrument)">
          <td>{{ instrument.attributes.name }}</td>
          <td>{{instrument.attributes.fee || '-'}}</td>
          <td style="width: 50%;">{{instrument.attributes.notes}}</td>
          <td>{{instrument.attributes.state.description}}</td>
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


  const router = useRouter()
  const sorter = useSorter()
  const instrumentStore = useInstrumentStore()
  const filteredInstruments = instrumentStore.getFilteredInstruments


  function handleClick(instrument){
    instrumentStore.setInstrument(instrument)
    router.push({
      name: 'InstrumentDetails'
    })
  }

  function getNum(type){
    if(type === 'filtered'){
      return instrumentStore.getFilteredInstruments.length
    }
    if(type === 'total'){
      return instrumentStore.getInstruments.length
    }
    return instrumentStore.getInstruments.length
  }

  function sortData(field){
    sorter.sort(props.lessons, field)
  }

</script>

<style lang="scss" scoped>
@media (min-width: 768px){
  table {
    table-layout: fixed;
    width: 100%;
    thead {
      background-color: $ah-primary;
      color: white;
      tr {
        th {
          &:first-child {
            padding-left: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
          }
        }
      }
    }
    tbody {
      tr {
        border-bottom: 1px solid $ah-grey;
        &:hover {
          background-color: $ah-primary-background;
          cursor: pointer;
        }
        td {
          &:first-child {
            padding: 10px;
          }
        }
      }
    }
  }
  #table-body-section {
    max-height: calc(100vh - 200px);
    border-bottom: 5px solid $ah-primary;
  }
  .totals {
    padding-left: 10px;
    display: inline-flex;
    align-items: flex-end;
    justify-content: space-between;
  }
  .status {
    width: 90px;
    padding: 5px;
    border: 1px solid black;
  }
  .Active-td {
    color: $ah-green;
    background-color: lighten($ah-green-light, 70%);
    border-color: $ah-green;
  }
  .Pending-td {
    color: $ah-purple;
    background-color: lighten($ah-purple-light, 64%);
    border-color: $ah-purple;
  }
}

</style>