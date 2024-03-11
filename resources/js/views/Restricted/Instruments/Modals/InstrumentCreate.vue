<template>
  <div>
    <HeaderLine heading="Add Instrument" />
    <form @submit.prevent="createInstrument">
      <label>School:</label>
      <select name="school" class="form-control" v-model="formData.school" required>
        <option v-for="school in schools" :key="school.id" :value="school.school_id">{{school.name}}</option>
      </select>
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
import { useUserStore } from '/resources/js/stores/user';
import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useRouter } from 'vue-router';
import { useFilterStore } from '/resources/js/stores/filter';

const modal = useModalStore()
const user = useUserStore()
const router = useRouter()
const filter = useFilterStore()

const { data: states, fetchData: fetchStates } = useApi('instrument-states')
fetchStates()

const schools = ref(user.permissions.filter(p => (p.type === 'Administrator' || p.type === 'INSTRUMENTS_C')))

const instrumentStore = useInstrumentStore()

const formData = ref({
  school: schools.value[0].school_id,
  name: '',
  type: '',
  family: '',
  fee: 0,
  state_id: 1
})

function createInstrument(){
  axiosClient.post(`instruments`, formData.value).then(res =>{
    filter.reset()
    instrumentStore.setInstrument(res.data)
    instrumentStore.addInstrument(res.data)
    router.push({name: 'InstrumentDetails'})
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
