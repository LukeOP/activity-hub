<template>
  <div>
    <HeaderLine heading="Create Event Template" />
    <form @submit.prevent="createTemplate">
      <label>School
        <input type="text" disabled :value="schoolStore.getSchool.name" class="form-control">
      </label>
      <label>Template Title
        <input type="text" class="form-control" v-model="formData.heading">
      </label>

      <button type="submit" aria-label="submit" class="form-control float-end btn btn-primary mt-2">Create Template
        <LoadingSpinner :isLoading="submitting" />
      </button>
    </form>
  </div>
</template>

<script setup>
import { useSchoolStore } from '/resources/js/stores/schools';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { computed, ref } from 'vue'
import axiosClient from '/resources/js/axios';
import { useRouter } from 'vue-router';
import { useEventStore } from '/resources/js/stores/events';
import { useModalStore } from '/resources/js/stores/modal';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useApi from '../../../../composables/useApi';

const schoolStore = useSchoolStore()
const eventStore = useEventStore()
const modal = useModalStore()
const router = useRouter()
const submitting = ref(false)

const formData = ref({
  school_id: schoolStore.getSchool.id,
  heading: ''
})

const disabled = computed(()=>{
  return formData.value.heading.length > 3 ? false : true
})

function createTemplate(){
  submitting.value = true
  const {data, fetchData} = useApi('event-school-jobs/templates', formData.value, 'POST', true)
  fetchData().then(()=>{
    eventStore.setEventData(data.value.data)
    modal.close()
    router.push({
      name: 'EventTemplateDetails'
    })
  })


  // axiosClient.post('event-school-jobs/templates', formData.value).then((res)=>{
  //   eventStore.setEventData(res.data)
  //   submitting.value = false
  //   modal.close()
  //   router.push({
  //     name: 'EventTemplateDetails'
  //   })
  // })
}

</script>

<style lang="scss" scoped>
label {
  width: 100%;
  margin-bottom: 1rem;
}

</style>