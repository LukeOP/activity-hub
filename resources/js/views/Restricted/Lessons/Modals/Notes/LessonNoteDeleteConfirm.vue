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
import { useLessonsStore } from '@/stores/lessons';
import { useToastStore } from '/resources/js/stores/toast';

const modal = useModalStore()
const lessonStore = useLessonsStore()
const toast = useToastStore()

function deleteNote(){
  const note = modal.getData
  axiosClient.delete('/lesson-notes/' + note.id)
  .then(()=>{
    toast.open( 'success', 'Lesson Note Deleted', 'The Lesson note has been deleted.')
    lessonStore.deleteNote(note)
    modal.close()
  })
}

</script>

<style lang="scss" scoped>

</style>