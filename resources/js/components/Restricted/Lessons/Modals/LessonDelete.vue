<template>
  <div class="text-center">
    <h2>Delete Lesson?</h2>
    <div class="mb-4">Are you sure you want to delete this lesson and all related data?</div>
    <button class="btn btn-grey mx-2" @click="modal.close()">Cancel</button>
    <button class="btn btn-red mx-2" @click="deleteLesson">Delete</button>
  </div>
</template>

<script setup>
import { useModalStore } from '@/stores/modal';

const modal = useModalStore()

function deleteLesson(){
  console.log('TODO: deleting...')
  // TODO handle lesson delete
  modal.close()
}

</script>

<style lang="scss" scoped>
.btn {
  width: 100px;
}

</style>