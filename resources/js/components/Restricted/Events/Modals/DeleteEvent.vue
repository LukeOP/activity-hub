<template>
  <div class="text-center">
    <HeaderLine heading="Delete Event" center="true" />
    <p>Are you sure you wish to delete this event?</p>
    <div id="event-name">{{ currentEvent.attributes.name }}</div>
    <p>This cannot be undone.</p>
    <button class="btn btn-grey" @click="modal.close()">Cancel</button>
    <button class="btn btn-red" @click="deleteJob()">Delete</button>
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useModalStore } from '/resources/js/stores/modal';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useRouter } from 'vue-router';

  const eventStore = useEventStore()
  const modal = useModalStore()
  const toast = useToastStore()
  const router = useRouter()
  const currentEvent = eventStore.getEvent

  function deleteJob(){
    axiosClient.delete('events/' + currentEvent.id).then(res => {
      if(res.data == 'success') {
        eventStore.removeEvent(currentEvent.id)
        toast.open('success', 'Event Deleted', currentEvent.attributes.name + ' has been deleted')
        router.push({
          name: 'EventsList'
        })
      }
      else if(res.data == 'error') {
        toast.open('error', 'Event Not Deleted', `Error deleting ${currentEvent.attributes.name}`)
      }
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
#event-name {
  border: 1px dashed $ah-red;
  color: $ah-red;
  font-size: 1.5rem;
}

</style>