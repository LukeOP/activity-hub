<template>
    <div>
      <HeaderLine heading="New Lesson Request Form" />
      <form @submit.prevent="createTemplate()">
        <label>School
            <select class="form-control" v-model="formData.school_id" required>
                <option v-for="(school, index) in userPermissionSchools" :key="index" :value="school.school_id">{{school.name}}</option>
            </select>
        </label>
        <label>Form Title Description
          <input type="text" class="form-control" v-model="formData.description">
        </label>
        <input type="submit" class="btn btn-primary float-end mt-2" value="Create Form" :disabled="disabled">
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
import { useUserStore } from '../../../../../stores/user';
import { useLessonsStore } from '../../../../../stores/lessons';
  
  const lessonStore = useLessonsStore()
  const eventStore = useEventStore()
  const modal = useModalStore()
  const router = useRouter()
  const user = useUserStore()
  
  const formData = ref({
    school_id: '',
    description: ''
  })
  
  const disabled = computed(()=>{
    return formData.value.description.length > 3 ? false : true
  })

  const userPermissionSchools = computed(() => {
    let permissions = user.permissions.filter(p => (p.type == 'LESSON_FRM_C' || p.type == 'Administrator'));
    const uniqueSchools = permissions.reduce((acc, current) => {
        // Check if the school ID is already in the accumulator
        if (!acc.has(current.school_id)) {
            // If not, add it to the accumulator
            acc.set(current.school_id, { name: current.name, school_id: current.school_id });
        }
        return acc;
    }, new Map());

    // Convert the map back to an array
    const result = [...uniqueSchools.values()];
    return result
  })
  
  function createTemplate(){
    axiosClient.post('lesson-request-forms', formData.value).then((res)=>{
      lessonStore.setRequestForm(res.data)
      modal.close()
      router.push({
        name: 'RequestFormDetails'
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