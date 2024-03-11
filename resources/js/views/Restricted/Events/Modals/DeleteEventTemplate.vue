<template>
    <div class="text-center">
      <HeaderLine heading="Delete Event Template" center="true" />
      <p>Are you sure you wish to delete this event template? <br> This cannot be undone.</p>
      <button class="btn btn-grey" @click="modal.close()">Cancel</button>
      <button class="btn btn-red" @click="deleteTemplate()">Delete</button>
    </div>
  </template>
  
  <script setup>
  import { useRouter } from 'vue-router';
import axiosClient from '/resources/js/axios';
  import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import { useEventStore } from '/resources/js/stores/events';
  import { useModalStore } from '/resources/js/stores/modal';
  
  const eventStore = useEventStore()
  const modal = useModalStore()
  const router = useRouter()
  
  function deleteTemplate(){
    axiosClient.delete('event-school-jobs/template/' + eventStore.getEventData.id).then(res => {
      modal.close()
      router.push({
        name: 'TemplateList'
      })
    })
  }
  
  </script>
  
  <style lang="scss" scoped>
    button {
      margin-left: 0.5rem;
      margin-right: 0.5rem;
    }
  
  </style>