<template>
  <div>
    <HeaderLine :heading="currentHire.instrument.attributes.name + ' Hire Details'" :school="currentHire.instrument.school.name" />
    <Details :hire="currentHire" />
      <!-- <pre>{{ currentHire }}</pre> -->
  </div>
</template>

<script setup>
import { useHireStore } from '/resources/js/stores/hires';
import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import Details from './DetailsComponents/Details.vue'
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';

const hireStore = useHireStore()
const currentHire = hireStore.getHire
const user = useUserStore()
const actions = useActionsStore()

function setActions(){
  let actionsArray = []
  if(user.hasPermission('HIRES_E', currentHire.instrument.school.id)){
    if(currentHire.attributes.returned_date === null){
      actionsArray.push({ header: 'Mark As Returned', to: { name: 'HireDetails' }, modal: 'ReturnInstrumentHire', icon: 'fa-solid fa-circle-check', green:true, additional: true})
    }
    actionsArray.push({ header: 'Edit Hire', to: { name: 'HireDetails' }, modal: 'HireEdit', icon: 'fa-solid fa-pencil', additional: true})
  }
  actions.setItems(actionsArray)
}
setActions()


</script>

<style lang="scss" scoped>

</style>