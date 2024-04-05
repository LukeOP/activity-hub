<template>
    <div>
      <HeaderLine heading="Edit Event" />
      <form @submit.prevent="editEvent">
        <div class="row" v-if="user.attributes.schools">
            <label>Event Title
              <input type="text" class="form-control" v-model="formData.name" required>
            </label>
            <label>Description
              <input type="text" class="form-control" v-model="formData.description" required>
            </label>
            <label>Notes
              <textarea rows="5" class="form-control" v-model="formData.notes"></textarea>
            </label>
  
            <label>Location
              <input type="text" class="form-control" v-model="formData.location" required>
            </label>
            <label>Date 
              <input type="date" class="form-control" v-model="formData.date" required>
              <div v-if="dateChange" class="text-red text-center">Note: changing event date will not change the due dates of event jobs.</div>
            </label>
            <label>Time
              <input type="time" class="form-control" v-model="formData.time" required>
            </label>
  
          <button type="submit" aria-label="submit" class="form-control btn btn-primary mt-2" :disabled="submitting">Edit Event
            <LoadingSpinner :isLoading="submitting" />
          </button>
  
        </div>
      </form>
    </div>
  </template>
  
  <script setup>
  import { useUserStore } from '/resources/js/stores/user';
  import { useEventStore } from '/resources/js/stores/events';
  import { computed, ref } from 'vue';
  import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import useApi from '../../../../composables/useApi';
import { useModalStore } from '../../../../stores/modal';
  
  // Initiate Stores
  const user = useUserStore()
  const eventStore = useEventStore()
  const modal = useModalStore()
  
  // Initiate Variables
  const currentEvent = eventStore.getEvent
  const formData = ref({
    id: currentEvent.id,
    name: currentEvent.attributes.name,
    description: currentEvent.attributes.description,
    notes: currentEvent.attributes.notes,
    location: currentEvent.attributes.location,
    date: currentEvent.attributes.date,
    time: currentEvent.attributes.time,
  })
  const submitting = ref(false)

  const dateChange = computed(()=>{
    if (formData.value.date != currentEvent.attributes.date) {
        return true
    } return false
  })

  const { data, fetchData } = useApi('events/' + formData.value.id, formData.value, 'PATCH', true)

  function editEvent(){
    submitting.value = true
    fetchData().then(()=>{
        eventStore.updateEventRecord(data.value.data)
        submitting.value = false
        modal.close()
    })
  }
  
  </script>
  
  <style lang="scss" scoped>
  label {
    width: 100%;
    margin-bottom: 0.5rem;
  }
  
  </style>