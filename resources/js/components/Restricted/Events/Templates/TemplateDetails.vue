<template>
  <div v-if="jobs">
    <HeaderLine heading="Template Details" :school="currentTemplate.school.name" />
    <form class="row" @submit.prevent="saveChanges">
      <div class="col col-12 col-md-6">
        <label>Title
          <input type="text" class="form-control" v-model="currentTemplate.heading">
        </label>
        <label>Description
          <input type="text" class="form-control" v-model="currentTemplate.description">
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <label>Notes
          <textarea rows="4" class="form-control" v-model="currentTemplate.notes"></textarea>
        </label>
        <input type="submit" class="btn btn-primary" value="Save Changes" :disabled="disabled">
        <!-- {{ currentTemplate.id }} -->
      </div>
    </form>

    <section id="template-jobs">
      <h2>Template Event Jobs
        <!-- <span class="float-end btn btn-secondary" @click="addJob()">Add Job</span> -->
        <span id="refresh" @click="refreshJobs()">Refresh</span>
      </h2>
      
      <div v-for="job in eventStore.getEventJobs" :key="job" class="job-item">
        {{ job.description }}
        <span style="cursor: pointer" id="delete" @click="deleteJob(job)">Delete</span>
        <span style="cursor: pointer" id="edit" @click="editJob(job)">Edit</span>
        <span id="priority">{{ getPriority(job.priority) }}</span>
      </div>
    </section>
    <!-- <pre v-if="jobs != []">{{ jobs }}</pre> -->
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref, watch } from 'vue';
import useApi from '/resources/js/composables/useApi';
import { useModalStore } from '/resources/js/stores/modal';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { priorities } from '/resources/js/composables/usePriorities'
import { useActionsStore } from '/resources/js/stores/actions';
import { useUserStore } from '/resources/js/stores/user';

const eventStore = useEventStore()
const modal = useModalStore()
const toast = useToastStore()
const actions = useActionsStore()
const user = useUserStore()
const currentTemplate = ref(eventStore.getEventData)
const disabled = ref(false)

const {data: jobs, fetchData: fetchJobs} = useApi('event-school-jobs/template/' + currentTemplate.value.id)
fetchJobs().then(()=>{
  eventStore.setEventJobs(jobs.value)
})

function refreshJobs(){
  fetchJobs().then(()=>{
    eventStore.setEventJobs(jobs.value)
  })
}

function saveChanges(){
  disabled.value = true
  axiosClient.patch('/event-school-jobs/template/edit/' + eventStore.getEventData.id, currentTemplate.value).then((res)=>{
    toast.open(...res.data)
    disabled.value = false
  })
}

const priorityList = priorities

function getPriority(priority){
  let found = priorityList.find(p => p.value == priority)
  if(found) return found.description
  return ''
}

function deleteJob(job){
  eventStore.setSingleJob(job)
  modal.open('DeleteTemplateJob')
}

function editJob(job){
  eventStore.setSingleJob(job)
  modal.open('EditTemplateJob')
}

function addJob(){
  modal.open('AddTemplateJob')
}

// Set side actions available on this page
const actionArray = []
if(user.hasPermission('EVENTS_TEMP_C', currentTemplate.value.school.id)){
  actionArray.push({ header: 'Add Template Job', to: { name: 'EventTemplateDetails' }, modal: 'AddTemplateJob', icon: 'fa-solid fa-plus'})
}
actions.setItems(actionArray)

</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  margin-top: 1rem;
}
label {
  width: 100%;
  margin-top: 0.5rem;
}
input[type='submit'] {
  width: 150px;
  float: right;
}
#template-jobs {
  border-top: 1px dashed $ah-primary;
  margin-top: 1rem;
}
#refresh {
  font-size: 1rem;
  color: $ah-primary;
  float: right;
  padding: 10px;
  cursor: pointer;
}
.job-item {
  border-radius: 0.375rem;
  padding: 10px 10px;

  #delete, #edit, #priority {
    float: right;
    margin-left: 2rem;
  }
  &:nth-child(even) {
    background-color: $ah-primary-background;
  }
  &:hover {
    background-color: $ah-primary;
    color: white;
  }
}

</style>