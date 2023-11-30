<template>
  <div>
    <HeaderLine heading="Add Template Job" />

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
        <input type="submit" class="btn btn-primary form-control" value="Add To Template">
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

const eventStore = useEventStore()
const toast = useToastStore()
const modal = useModalStore()
const currentTemplate = eventStore.getEventData

const formData = ref({
  template_id: currentTemplate.id,
  description: '',
  priority: ''
})

function addJob(){
  console.log(formData.value);
  axiosClient.post('event-school-jobs', formData.value).then((res)=>{
    addJobToDom(res.data)
    toast.open('success', 'Job Added', 'Job added to Template')
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