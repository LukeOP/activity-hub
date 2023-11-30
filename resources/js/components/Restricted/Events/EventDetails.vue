<template>
  <div>
    <HeaderLine :heading="currentEvent.attributes.name + ' - Event Details'" :school="currentEvent.school.name"/>
    <Details :event="currentEvent" />
    <JobsTable />
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import Details from './DetailsComponents/Details.vue'
import JobsTable from './DetailsComponents/JobsTable.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';

// Initiate Stores
const eventStore = useEventStore()
const actions = useActionsStore()
const user = useUserStore()

// Initiate Variables
const currentEvent = ref(eventStore.getEvent)

// Set side actions available on this page
const actionArray = []
if(user.hasPermission('EVENTS_C', currentEvent.value.school.id)){
  actionArray.push({ header: 'Add Event Job', to: { name: 'EventDetails' }, modal: 'AddEventJob', icon: 'fa-solid fa-plus'})
}
if(user.hasPermission('EVENTS_D', currentEvent.value.school.id)){
  actionArray.push({ header: 'Delete Event', to: { name: 'EventDetails' }, modal: 'DeleteEvent', red: true, icon: 'fa-solid fa-trash'})
}
actions.setItems(actionArray)

</script>

<style lang="scss" scoped>

</style>