<template>
  <div>
    <HeaderLine heading="Edit Template Job" />

    <form @submit.prevent="addJob" class="row">
      <div class="col col-12 mb-3">
        <label>Job Description:
          <input type="text" class="form-control" v-model="formData.description" required>
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <label>To be completed:
          <select v-model="formData.priority" class="form-control">
            <option v-for="priority in priorities" :value="priority.value">{{ priority.description }}</option>
          </select>
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <br>
        
      <button type="submit" aria-label="submit" class="form-control btn btn-primary">Edit Job
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
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useModalStore } from '/resources/js/stores/modal';
import { priorities } from '/resources/js/composables/usePriorities'
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';

const eventStore = useEventStore()
const toast = useToastStore()
const modal = useModalStore()
const currentTemplate = eventStore.getEventData
const currentJob = eventStore.getSingleJob

const submitting = ref(false)

const formData = ref({
  job_id: currentJob.id,
  description: currentJob.description,
  priority: currentJob.priority
})

function addJob(){
  submitting.value = true
  axiosClient.patch('event-school-jobs/' + formData.value.job_id, formData.value).then((res)=>{
    updateDom(res.data)
    toast.open('success', 'Job Added', 'Job added to Template')
    submitting.value = false
    modal.close()
  })
}

function updateDom(newJob){
  let currentJobs = eventStore.getEventJobs.filter(j => j.id != newJob.id)
  eventStore.setEventJobs([...currentJobs, newJob])
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
}
</style>