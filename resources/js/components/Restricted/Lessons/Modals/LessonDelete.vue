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
import axiosClient from '/resources/js/axios';
import { useLessonsStore } from '/resources/js/stores/lessons';
import { useToastStore } from '/resources/js/stores/toast';
import { useRouter } from 'vue-router';

const modal = useModalStore()
const lessonStore = useLessonsStore()
const toast = useToastStore()
const router = useRouter()

function deleteLesson(){
  axiosClient.delete('lessons/' + lessonStore.getLessonData.id).then(()=>{
    toast.open('success', 'Lesson Deleted', 'The lesson has been successfully deleted')
    router.push({
      name: 'LessonsList'
    })
    modal.close()
  })
}

</script>

<style lang="scss" scoped>
.btn {
  width: 100px;
}

</style>