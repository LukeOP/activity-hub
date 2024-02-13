<template>  
<div>
  <section id="table-header-section">
    <table>
      <thead>
        <tr>
          <th @click="sortData('attributes.name')">Event:</th>
          <th @click="sortData('attributes.description')">Description:</th>
          <th @click="sortData('attributes.date')">Date:</th>
          <th @click="sortData('attributes.date')">Term:</th>
          <th @click="sortData('school.name')" v-if="user.getSchools.length > 1">School:</th>
        </tr>
      </thead>
    </table>
  </section>

  <section id="table-body-section" style="overflow-y:auto">
    <table>
      <tbody>
        <tr v-for="event in events" :key="event.id" @click="handleClick(event)">
          <td>{{ event.attributes.name }}</td>
          <td>{{ event.attributes.description }}</td>
          <td>{{event.attributes.date}}</td>
          <td>{{event.attributes.term}}</td>
          <td v-if="user.getSchools.length > 1">{{event.school.name}}</td>
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
import { useEventStore } from '../../../../stores/events'
import { useUserStore } from '/resources/js/stores/user';


  const router = useRouter()
  const sorter = useSorter()
  const eventStore = useEventStore()
  const user = useUserStore()

  const props = defineProps({events: Array})


  function handleClick(event){
    eventStore.setEvent(event)
    router.push({
      name: 'EventDetails'
    })
  }

  function getNum(type){
    if(type === 'filtered'){
      return props.events.length
    }
    if(type === 'total'){
      return eventStore.getEvents.length
    }
    return eventStore.getEvents.length
  }

  function sortData(field){
    sorter.sort(props.events, field)
  }

</script>

<style lang="scss" scoped>
#table-body-section {
  max-height: calc(100vh - 300px);
}

</style>