<template>
  <div>
    <!-- <Header :instrument="instrument" /> -->
    <HeaderLine :heading="instrument.attributes.name + ' Details'" :school="instrument.school.name" />
    <Details :instrument="instrument" />
    <Hires :instrument="instrument" />
    <Maintenance :instrument="instrument" />
  </div>
</template>

<script setup>
import { useActionsStore } from '/resources/js/stores/actions';
import { useInstrumentStore } from '/resources/js/stores/instruments';
import { useUserStore } from '/resources/js/stores/user';
import { ref, watch } from 'vue';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import Details from './DetailsComponents/Details.vue'
import Hires from './DetailsComponents/Hires.vue'
import Maintenance from './DetailsComponents/Maintenance.vue'

const instrumentStore = useInstrumentStore()
const instrument = ref(instrumentStore.getInstrument)

watch(()=> instrumentStore.getInstrument, (newValue) => {
  instrument.value = newValue
})

const user = useUserStore()
const actions = useActionsStore()

const actionArray = []
if(user.hasPermission('INSTRUMENTS_E', instrument.value.school.id)){
  actionArray.push({ header: 'Edit Instrument', to: { name: 'InstrumentDetails' }, modal: 'EditInstrument', icon: 'fa-solid fa-circle-check', additional: true})
}
if(user.hasPermission('HIRE_C', instrument.value.school.id) && instrument.value.attributes.state.id == 1){
  actionArray.push(
    { header: 'Hire Out Instrument', to: { name: 'InstrumentDetails' }, modal: 'InstrumentHireCreateFromInstrument', icon: 'fa-solid fa-circle-check', additional: true}
  )
}
actions.setItems(actionArray)

</script>

<style lang="scss" scoped>

</style>