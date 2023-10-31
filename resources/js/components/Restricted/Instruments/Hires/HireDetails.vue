<template>
  <div>
    <HeaderLine :heading="currentHire.instrument.attributes.name + ' Hire Details'" :school="currentHire.instrument.school.name" />
    <Details :hire="currentHire" />
      <!-- <pre>{{ currentHire }}</pre> -->
  </div>
</template>

<script setup>
import { useHireStore } from '/resources/js/stores/hires';
import HeaderLine from '../../../Layouts/MainLayout/Elements/HeaderLine.vue';
import Details from './DetailsComponents/Details.vue'
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';

const hireStore = useHireStore()
const currentHire = hireStore.getHire
const user = useUserStore()
const actions = useActionsStore()

if(user.hasPermission('HIRES_E', currentHire.instrument.school.id)){
  actions.setItems([
    { header: 'Mark as returned', to: { name: 'HireDetails' }, modal: 'ReturnInstrumentHire', icon: 'fa-solid fa-circle-check', additional: true},
  ])
}


</script>

<style lang="scss" scoped>

</style>