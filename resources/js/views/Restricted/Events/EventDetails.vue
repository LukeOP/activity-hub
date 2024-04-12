<template>
  <div>
    <HeaderLine :heading="eventStore.getEvent.attributes.name + ' - Event Details'" :school="eventStore.getEvent.school.name"/>
    <Archived v-if="eventStore.getEvent.attributes.archived != 0" />
    <Details :event="eventStore.getEvent" />

    <!-- Table Component -->
    <section v-if="!loading">
      <component :is="currentComponent" />
    </section>
    <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />

    <!-- <JobsTable /> -->
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import Details from './DetailsComponents/Details.vue'
import JobsTable from './DetailsComponents/JobsTable.vue';
import JobsTableMobile from './DetailsComponents/JobsTableMobile.vue';
import Archived from './DetailsComponents/Archived.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import { useWindowSize } from '../../../composables/useWindowSize';
import { computed, onMounted, ref } from 'vue';

// Initiate Stores
const eventStore = useEventStore()
const actions = useActionsStore()
const user = useUserStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Initiate Variables
const currentEvent = eventStore.getEvent
const loading = ref(false)

// Set side actions available on this page
const actionArray = []
if(user.hasPermission('EVENTS_C', currentEvent.school.id) && eventStore.getEvent.attributes.archived == 0){
  actionArray.push({ header: 'Add Event Job', to: { name: 'EventDetails' }, modal: 'AddEventJob', additional: true, icon: 'fa-solid fa-plus'})
}
if(user.hasPermission('EVENTS_E', currentEvent.school.id)){
  if(eventStore.getEvent.attributes.archived == 0){
    actionArray.push({ header: 'Edit Event', to: { name: 'EventDetails' }, modal: 'EditEvent', additional: true, icon: 'fa-solid fa-pen'})
    actionArray.push({ header: 'Link Event Staff', to: { name: 'EventDetails' }, modal: 'LinkEventStaff', additional: true, icon: 'fa-solid fa-user-plus'})
    actionArray.push({ header: 'Archive Event', to: { name: 'EventDetails' }, modal: 'EventArchive', additional: true, icon: 'fa-solid fa-file-arrow-down'})
  } else actionArray.push({ header: 'Restore Event', to: { name: 'EventDetails' }, modal: 'EventRestore', additional: true, icon: 'fa-solid fa-file-arrow-up'})
}
if(user.hasPermission('EVENTS_D', currentEvent.school.id)){
  actionArray.push({ header: 'Delete Event', to: { name: 'EventDetails' }, modal: 'DeleteEvent', additional: true, red: true, icon: 'fa-solid fa-trash'})
}
actions.setItems(actionArray)

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? JobsTable : JobsTableMobile
})


</script>

<style lang="scss" scoped>

</style>