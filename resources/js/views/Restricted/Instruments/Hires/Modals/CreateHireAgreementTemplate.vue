<template>
    <div>
      <HeaderLine heading="Create Hire Agreement Template" />
      <form @submit.prevent="">
        <label>School
          <input type="text" disabled :value="schoolStore.getSchool.name" class="form-control">
        </label>
        <label>Template Title
          <input type="text" class="form-control" v-model="formData.heading">
        </label>
        <input type="submit" class="btn btn-primary float-end mt-2" value="Create Template" :disabled="disabled" @click="createTemplate()">
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
import { useHireStore } from '/resources/js/stores/hires';
  
  const schoolStore = useSchoolStore()
  const eventStore = useEventStore()
  const hireStore = useHireStore()
  const modal = useModalStore()
  const router = useRouter()
  
  const formData = ref({
    school_id: schoolStore.getSchool.id,
    heading: ''
  })
  
  const disabled = computed(()=>{
    return formData.value.heading.length > 3 ? false : true
  })
  
  function createTemplate(){
    axiosClient.post('forms/hires/templates', formData.value).then((res)=>{
      hireStore.setHireData(res.data)
      modal.close()
      router.push({
        name: 'HireAgreementEventTemplateDetails'
      })
    })
  }
  
  </script>
  
  <style lang="scss" scoped>
  label {
    width: 100%;
    margin-bottom: 1rem;
  }
  
  </style>