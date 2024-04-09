<template>
  <div>
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

      <button type="submit" aria-label="submit" class="form-control btn btn-primary mt-2" :disabled="submitting">Save Changes
        <LoadingSpinner :isLoading="submitting" />
      </button>
        <!-- {{ currentTemplate.id }} -->
      </div>
    </form>

    <section id="template-jobs">
      <h2>Template Event Jobs
      </h2>
      
      <div v-for="job in sortedJobs" :key="job" class="job-item">
        {{ job.description }}
        <span style="cursor: pointer" id="delete" @click="deleteJob(job)">Delete</span>
        <span style="cursor: pointer" id="edit" @click="editJob(job)">Edit</span>
        <span id="priority">{{ getPriority(job.priority) }}</span>
      </div>
      <div v-if="sortedJobs.length < 1">No jobs have been created for this template yet.</div>
    </section>
    <!-- <pre v-if="jobs != []">{{ jobs }}</pre> -->
  </div>
</template>

<script setup>
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { computed, ref } from 'vue';
import { useModalStore } from '/resources/js/stores/modal';
import { priorities } from '/resources/js/composables/usePriorities'
import { useActionsStore } from '/resources/js/stores/actions';
import { useUserStore } from '/resources/js/stores/user';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useSorter from '../../../../composables/useSorter';
import useApi from '../../../../composables/useApi';

const eventStore = useEventStore()
const modal = useModalStore()
const actions = useActionsStore()
const user = useUserStore()
const sorter = useSorter()
const currentTemplate = ref(eventStore.getEventData)
const submitting = ref(false)

const sortedJobs = computed(() => {
  let sortedJobList = eventStore.getEventData.jobs
  sorter.sort(sortedJobList, 'priority')
  return sortedJobList
})

function saveChanges(){
  submitting.value = true
  const {fetchData} = useApi('/event-school-jobs/template/edit/' + eventStore.getEventData.id, currentTemplate.value, 'PATCH', true)
  fetchData().then(()=>{
    submitting.value = false
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

// Set side actions available on this page
const actionArray = []
if(user.hasPermission('EVENTS_TEMP_C', currentTemplate.value.school.id)){
  actionArray.push({ header: 'Add Template Job', to: { name: 'EventTemplateDetails' }, modal: 'AddTemplateJob', icon: 'fa-solid fa-plus'})
}
if(user.hasPermission('EVENTS_TEMP_D', currentTemplate.value.school.id)){
  actionArray.push({ header: 'Delete Template', to: { name: 'EventTemplateDetails' }, modal: 'DeleteEventTemplate', icon: 'fa-solid fa-trash', additional: true, red: true})
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