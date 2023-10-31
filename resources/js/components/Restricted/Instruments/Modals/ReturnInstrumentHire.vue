<template>
  <div>
    <HeaderLine :heading="'Return ' + currentHire.instrument.attributes.name + '?'"/>
    <form @submit.prevent="handleHireReturn" class="row">
      <div class="col col-12 col-md-6 text-center"><label for="date">Returned Date:</label></div>
      <div class="col col-12 col-md-6"></div>
    
      <div class="col col-12 col-md-6">
        <input type="date" class="form-control text-center" v-model="returned_date" :max="moment().format('YYYY-MM-DD')" required>
      </div>
      <div class="col col-12 col-md-6 text-center">
        <input type="submit" value="Mark as Returned" class="btn btn-primary form-control">
      </div>
    </form>
  </div>
</template>

<script setup>
import { useHireStore } from '/resources/js/stores/hires';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import moment from 'moment';
import axiosClient from '/resources/js/axios';
import { useModalStore } from '/resources/js/stores/modal';

const hireStore = useHireStore()
const currentHire = hireStore.getHire
const modal = useModalStore()


const returned_date = ref(moment().format('YYYY-MM-DD'))


function handleHireReturn(){
  // update hire returned value
  axiosClient.patch('hires/' + currentHire.id, returned_date.value)
  .then(res => {
    // update Instrument status to 'Available'
    axiosClient.patch('instruments/' + currentHire.instrument.id, {state_id: 1})
    .then(res => {
      // archive hire by 'deleting' it
      axiosClient.delete('hires/' + currentHire.id)
      .then(res => {
        hireStore.setHires(hireStore.getHires.filter(h => h.id != currentHire.id))
      })
    })
  })
  modal.close()
}


</script>

<style lang="scss" scoped>
.comment {
  font-size: 1.25rem;
}
@media (max-width: 768px){
  input[type='submit']{
    width: 100%;
    margin-top: 1rem;
  }
}


</style>