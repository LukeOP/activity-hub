<template>
    <div class="text-center">
      <HeaderLine heading="Delete Event Job" center="true" />
      <p>Are you sure you wish to delete the job:</p>
      <div id="job-name">{{ currentJob.description }}</div>
      <p>This cannot be undone.</p>
      <button class="btn btn-grey" @click="modal.close()">Cancel</button>
      <button class="btn btn-red" @click="deleteJob()" :disabled="submitting">Delete
        <LoadingSpinner :isLoading="submitting" />
      </button>
    </div>
  </template>
  
  <script setup>
  import { useEventStore } from '/resources/js/stores/events';
  import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import { useModalStore } from '/resources/js/stores/modal';
  import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
  import { ref } from 'vue';
  import useApi from '../../../../composables/useApi';
  
    const eventStore = useEventStore()
    const modal = useModalStore()
    const currentJob = eventStore.getSingleJob
    const submitting = ref(false)
  
    function deleteJob(){
        submitting.value = true
        const {fetchData} = useApi('event-jobs/' + currentJob.id, null, 'DELETE', true)
        fetchData().then(()=>{
            eventStore.removeEventJob(currentJob)
            modal.close()
        })
    }
  
  </script>
  
  <style lang="scss" scoped>
  p {
    padding: 5px;
    margin: 0;
  }
  button {
    margin-top: 1rem;
    margin-left: 0.5rem;
    margin-right: 0.5rem;
  }
  #job-name {
    // border: 1px dashed $ah-red;
    color: $ah-red;
    font-size: 1.5rem;
  }
  
  </style>