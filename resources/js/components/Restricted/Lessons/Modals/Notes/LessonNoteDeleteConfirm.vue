<template>
  <div class="text-center">
    <h2>Delete Note</h2>
    <div class="mb-2">Are you sure you want to delete this note? This cannot be undone!</div>
    <button class="btn btn-grey mx-2" @click="modal.close()">Cancel</button>
    <button class="btn btn-red mx-2" @click="deleteNote">Delete</button>

  </div>
</template>

<script setup>
import { useModalStore } from '@/stores/modal';
import axiosClient from '@/axios';
import { useToast } from 'vue-toast-notification';
import { useLessonsStore } from '@/stores/lessons';

const modal = useModalStore()
const lessonStore = useLessonsStore()
const toast = useToast()

function deleteNote(){
  const note = modal.getData
  axiosClient.delete('/lesson-notes/' + note.id)
  .then(()=>{
    toast.open({ message: 'Lesson Note Deleted', duration: 5000, dismissible: true, type: 'success'})
    lessonStore.deleteNote(note)
    modal.close()
  })
}

</script>

<style lang="scss" scoped>

</style>