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
      <button type="submit" aria-label="submit" class="form-control btn btn-primary">Add Job
        <LoadingSpinner :isLoading="submitting" />
      </button>
      </div>
    </form>
  </div>

</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import { useModalStore } from '/resources/js/stores/modal';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useApi from '../../../../composables/useApi';

const eventStore = useEventStore()
const modal = useModalStore()
const currentEvent = eventStore.getEvent
const submitting = ref(false)

const formData = ref({
  event_id: currentEvent.id,
  description: '',
  due_date: ''
})

function addJob(){
  submitting.value = true
  const {data, fetchData} = useApi('event-jobs', formData.value, 'POST', true)
  fetchData().then(()=>{
    eventStore.addEventJob(data.value.data)
    submitting.value = false
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
}
</style>