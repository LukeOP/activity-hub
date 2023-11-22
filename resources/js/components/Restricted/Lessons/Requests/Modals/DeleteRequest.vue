<template>
  <div class="text-center">
    <HeaderLine heading="Delete Request?" center="true" />
    <p>Are you sure you wish to delete this Lesson Request?</p>
    <p>The cannot be undone.</p>
    <button class="btn btn-grey" @click="modal.close()">Cancel</button>
    <button class="btn btn-red" @click="deleteRequest">Delete</button>
  </div>
</template>

<script setup>
import axiosClient from '/resources/js/axios';
import HeaderLine from '../../../../Layouts/MainLayout/Elements/HeaderLine.vue'
import { useLessonsStore } from '/resources/js/stores/lessons';
import { useToastStore } from '/resources/js/stores/toast';
import { useRouter } from 'vue-router';
import { useModalStore } from '/resources/js/stores/modal';

const lessonStore = useLessonsStore()
const toast = useToastStore()
const router = useRouter()
const modal = useModalStore()

function deleteRequest(){
  axiosClient.delete('lesson-requests/' + lessonStore.getRequest.id).then(res => {
    toast.open('success', 'Request Deleted', 'The lesson request has been deleted.')
    modal.close()
    router.push({
      name: 'RequestsList'
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