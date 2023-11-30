<template>
  <div>
    <HeaderLine heading="Create Event" />
    <form @submit.prevent="setupEvent">
      <div class="row" v-if="user.attributes.schools">
        <div class="col col-12 col-md-6">
          <label>School*
            <select class="form-control" v-model="formData.school" required>
              <option v-for="school in userSchools" :value="school.id">{{ school.name }}</option>
            </select>
          </label>
          <label>Event Title*
            <input type="text" class="form-control" v-model="formData.title" required>
          </label>
          <label>Description*
            <input type="text" class="form-control" v-model="formData.description" required>
          </label>
          <label>Notes
            <textarea rows="5" class="form-control" v-model="formData.notes"></textarea>
          </label>
        </div>

        <div class="col col-12 col-md-6">
          <label>Location*
            <input type="text" class="form-control" v-model="formData.location" required>
          </label>
          <label>Date*
            <input type="date" class="form-control" v-model="formData.date" required>
          </label>
          <label>Time*
            <input type="time" class="form-control" v-model="formData.time" required>
          </label>
          <label>Event Job Setup*
            <select class="form-control" v-model="formData.template" required>
              <option value="empty" selected>Empty Event</option>
              <option v-for="template in eventJobTemplates" :key="template" :value="template.id">{{ template.heading }}</option>
            </select>
          </label>
          <input type="submit" class="btn btn-primary form-control" value="Create">
        </div>

      </div>
    </form>
  </div>
</template>

<script setup>
import { useUserStore } from '/resources/js/stores/user';
import { useEventStore } from '/resources/js/stores/events';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';
import { computed, ref, watch } from 'vue';
import useApi from '/resources/js/composables/useApi';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useRouter } from 'vue-router';

// Initiate Stores
const user = useUserStore()
const events = useEventStore()
const toast = useToastStore()
const router = useRouter()

// Initiate Variables
const eventJobTemplates = ref([])
const formData = ref({
  school: '',
  title: '',
  description: '',
  notes: '',
  location: '',
  date: '',
  time: '',
  template: ''
})

// Get schools user can create events for
const userSchools = computed(()=>{
  let schoolArray = []
  user.attributes.schools.forEach(school => {
    if(user.hasPermission('EVENT_C', school.id)) {
      schoolArray.push(school)
    }
  });
  return schoolArray
})

// Get Event Job Templates based on school
watch(() => formData.value.school, (newValue) => {
  if(formData.value.school != ''){
    const {data, fetchData} = useApi('event-school-jobs/templates/' + newValue)
    fetchData().then(()=>{
      eventJobTemplates.value = data.value
    })
  }else eventJobTemplates.value = []
})

function setupEvent(){
  createEvent()
}

function createEvent(){
  axiosClient.post('events', formData.value)
    .then((res) => {
      createEventJobs(res.data.event)
      events.addEvent(res.data.event)
      toast.open('success', 'Event Created!', 'Template jobs have been setup for your event')
      router.push({
        name: 'EventsList'
      })
    })
}

function createEventJobs(event){
  if(formData.value.template != 'empty'){
    axiosClient.post(`event-school-jobs/add-to-event/${event.id}/${formData.value.template}`).then(res => {
    })
  }
}



</script>

<style lang="scss" scoped>
label {
  width: 100%;
  margin-bottom: 0.5rem;
}

</style>