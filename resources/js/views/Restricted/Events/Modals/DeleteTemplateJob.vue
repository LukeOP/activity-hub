<template>
  <div class="text-center">
    <HeaderLine heading="Delete Template Job" center="true" />
    <p>Are you sure you wish to delete this template job? <br> This cannot be undone.</p>
    <button class="btn btn-grey" @click="modal.close()">Cancel</button>
    <button class="btn btn-red" @click="deleteJob()">Delete</button>
  </div>
</template>

<script setup>
import axiosClient from '/resources/js/axios';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useEventStore } from '/resources/js/stores/events';
import { useModalStore } from '/resources/js/stores/modal';

const eventStore = useEventStore()
const modal = useModalStore()

function deleteJob(){
  axiosClient.delete('event-school-jobs/' + eventStore.getSingleJob.id).then(res => {
    eventStore.setEventJobs(eventStore.getEventJobs.filter(j => j.id != eventStore.getSingleJob.id))
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
  button {
    margin-left: 0.5rem;
    margin-right: 0.5rem;
  }

</style>