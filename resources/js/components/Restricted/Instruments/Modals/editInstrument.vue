<template>
  <div>
    <h1 class="text-center">Edit Instrument</h1>
    <form @submit.prevent="updateInstrument">
      <label for="instrumentName">Instrument Name:</label>
      <input id="instrumentName" type="text" class="form-control" v-model="formData.name" required>

      <div class="row">
        <div class="col col-12 col-md-6">
          <label for="instrumentType">Instrument Type:</label>
          <input id="instrumentType" type="text" class="form-control" v-model="formData.type" required>
        </div>
        <div class="col col-12 col-md-6">
          <label for="instrumentFamily">Instrument Family:</label>
          <input id="instrumentFamily" type="text" class="form-control" v-model="formData.family" required>
        </div>
      </div>

      <div class="row">
        <div class="col col-12 col-md-6" id="fee">
          <label for="instrumentFee">Instrument Fee:</label>
          <input id="instrumentFee" type="number" class="form-control" v-model="formData.fee" required>
        </div>
        <div class="col col-12 col-md-6" id="state">
          <label for="instrumentState">Instrument State:</label>
          <select id="instrumentState" v-model="formData.state_id" class="form-control" required>
            <option v-for="state in states" :value="state.id" >{{ state.description }}</option>
          </select>
        </div>
      </div>
      <input type="submit" aria-label="submit" value="Submit" class="form-control btn btn-primary">
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useInstrumentStore } from '/resources/js/stores/instruments';
import useApi from '/resources/js/composables/useApi';
import { useModalStore } from '/resources/js/stores/modal';
import axiosClient from '/resources/js/axios';

const modal = useModalStore()

const { data: states, fetchData: fetchStates } = useApi('instrument-states')
fetchStates()

const instrumentStore = useInstrumentStore()
const instrument = instrumentStore.getInstrument

const formData = ref({
  name: instrument.attributes.name,
  type: instrument.attributes.type,
  family: instrument.attributes.family,
  fee: instrument.attributes.fee,
  state_id: instrument.attributes.state.id
})

function updateInstrument(){
  axiosClient.patch(`instruments/${instrument.id}`, formData.value).then(res =>{
    instrumentStore.setInstrument(res.data.instrument)
  })
  modal.close()
}

</script>

<style lang="scss" scoped>
form input, 
form select {
  margin-bottom: 1rem;
}

#state, #fee {
  padding-top: 10px;
  margin-bottom: 1rem;
}
#state {
  background-color: lighten($ah-grey-background, 0%);
  border-radius: 0.75rem;
}

</style>