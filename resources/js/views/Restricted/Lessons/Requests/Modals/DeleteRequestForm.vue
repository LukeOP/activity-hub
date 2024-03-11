<template>
    <div class="text-center">
      <HeaderLine heading="Delete Signup Form?" center="true" />
      <p>Are you sure you wish to delete this Lesson Signup Form?</p>
      <p>The cannot be undone.</p>
      <button class="btn btn-grey" @click="modal.close()">Cancel</button>
      <button class="btn btn-red" @click="deleteRequestForm">Delete</button>
    </div>
  </template>
  
  <script setup>
  import axiosClient from '/resources/js/axios';
  import HeaderLine from '../../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
  import { useLessonsStore } from '/resources/js/stores/lessons';
  import { useToastStore } from '/resources/js/stores/toast';
  import { useRouter } from 'vue-router';
  import { useModalStore } from '/resources/js/stores/modal';
  
  const lessonStore = useLessonsStore()
  const toast = useToastStore()
  const router = useRouter()
  const modal = useModalStore()
  
  function deleteRequestForm(){
    axiosClient.delete('lesson-request-forms/' + lessonStore.getRequestForm.id).then(res => {
      toast.open('success', 'The Signup Form Has Been Deleted', '')
      modal.close()
      router.push({
        name: 'RequestFormsList'
      })
    })
  }
  
  </script>
  
  <style lang="scss" scoped>
  button {
    min-width:100px;
    margin: 0 0.5rem;
  }
  
  </style>