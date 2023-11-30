<template>
  <div>
    <HeaderLine heading="Add Custom Event Job" />

    <form @submit.prevent="addJob" class="row">
      <div class="col col-12 mb-3">
        <label>Job Description:
          <input type="text" class="form-control" v-model="formData.description" required>
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <label>Due Date:
          <input type="date" class="form-control" v-model="formData.due_date" required>
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <br>
        <input type="submit" class="btn btn-primary form-control" value="Add Job">
      </div>
    </form>
  </div>

</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useModalStore } from '/resources/js/stores/modal';

const eventStore = useEventStore()
const toast = useToastStore()
const modal = useModalStore()
const currentEvent = eventStore.getEvent

const formData = ref({
  event_id: currentEvent.id,
  description: '',
  due_date: ''
})

function addJob(){
  axiosClient.post('event-jobs', formData.value).then((res)=>{
    addJobToDom(res.data)
    toast.open('success', 'Event Job Added', 'Event Job added to Event')
    modal.close()
  })
}

function addJobToDom(newJob){
  let currentJobs = eventStore.getEventJobs
  eventStore.setEventJobs([...currentJobs, newJob])
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
}
</style>