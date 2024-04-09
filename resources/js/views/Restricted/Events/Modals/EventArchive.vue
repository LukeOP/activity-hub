<template>
    <div class="text-center">
      <HeaderLine heading="Archive Event" center="true" />
      <p>Are you sure you wish to archive this event?</p>
      <div id="event-name">{{ currentEvent.attributes.name }}</div>
      <p>You cannot edit events that are archived.</p>
      <button class="btn btn-grey" @click="modal.close()">Cancel</button>
      <button class="btn btn-primary" @click="archiveJob()" :disabled="submitting">Archive
        <LoadingSpinner :isLoading="submitting" />
      </button>
    </div>
  </template>
  
  <script setup>
  import { useEventStore } from '/resources/js/stores/events';
  import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import { useModalStore } from '/resources/js/stores/modal';
  import axiosClient from '/resources/js/axios';
  import { useToastStore } from '/resources/js/stores/toast';
  import { useRouter } from 'vue-router';
  import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
  import { ref } from 'vue';
import useApi from '../../../../composables/useApi';
  
    const eventStore = useEventStore()
    const modal = useModalStore()
    const toast = useToastStore()
    const router = useRouter()
    const currentEvent = eventStore.getEvent
    const submitting = ref(false)
  
    function archiveJob(){
      submitting.value = true
      const {data, fetchData} = useApi('events/' + currentEvent.id, {archived: true}, 'PATCH')
      fetchData().then(()=>{
        eventStore.updateEventRecord(data.value.data)
        submitting.value = false
        toast.open('success', 'Event Archived', currentEvent.attributes.name + ' has been archived successfully.')
        modal.close()
      })


    //   axiosClient.delete('events/' + currentEvent.id).then(res => {
    //     if(res.data == 'success') {
    //       eventStore.removeEvent(currentEvent.id)
    //       toast.open('success', 'Event Deleted', currentEvent.attributes.name + ' has been deleted')
    //       submitting.value = false
    //       router.push({
    //         name: 'EventsList'
    //       })
    //     }
    //     else if(res.data == 'error') {
    //       submitting.value = false
    //       toast.open('error', 'Event Not Deleted', `Error deleting ${currentEvent.attributes.name}`)
    //     }
    //     modal.close()
    //   })
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
  #event-name {
    border: 1px dashed $ah-primary;
    color: $ah-primary;
    font-size: 1.5rem;
  }
  
  </style>