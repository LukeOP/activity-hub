<template>  
<div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('instrument.attributes.name')">Instrument:</th>
          <th @click="sortData('student.full_name')">Student:</th>
          <th @click="sortData('attributes.start_date')">Hire Date:</th>
          <th style="width: 50%;">Notes:</th>
          <th @click="sortData('instrument.school.name')">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="hire in filteredHires" :key="hire.id" @click="handleClick(hire)">
          <td>{{ hire.instrument.attributes.name }}</td>
          <td>{{hire.student.full_name}}</td>
          <td>{{formatDate(hire.attributes.start_date)}}</td>
          <td style="width: 50%;">{{hire.attributes.notes || '-'}}</td>
          <td>{{hire.instrument.school.name}}</td>
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
import useSorter from '../../../../../composables/useSorter'
import { useHireStore } from '../../../../../stores/hires'
import moment from 'moment'


  const router = useRouter()
  const sorter = useSorter()
  const hireStore = useHireStore()
  const filteredHires = hireStore.getFilteredHires


  function handleClick(hire){
    hireStore.setHire(hire)
    router.push({
      name: 'HireDetails'
    })
  }

  function getNum(type){
    if(type === 'filtered'){
      return hireStore.getFilteredHires.length
    }
    if(type === 'total'){
      return hireStore.getHires.length
    }
    return hireStore.getHires.length
  }

  function sortData(field){
    sorter.sort(hireStore.getFilteredHires, field)
  }

  function formatDate(date){
    return moment(date).format('DD-MM-YYYY')
  }

</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
}

</style>