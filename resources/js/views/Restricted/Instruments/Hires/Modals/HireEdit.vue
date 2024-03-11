<template>
    <div>
      <HeaderLine heading="Edit Instrument Hire" />
      <form @submit.prevent="updateHire">
  
        <div class="row mt-2">
          <div class="col col-12 col-md-6">
            <label for="student">Student</label>
            <input type="text" class="form-control" :value="currentHire.student.full_name" disabled>
          </div>
          <div class="col col-12 col-md-6">
            <label for="instrument">Instrument</label>
            <input type="text" class="form-control" :value="currentHire.instrument.attributes.name" disabled>
          </div>
        </div>
  
        <div class="row mt-2">
        <div class="col col-12 col-md-6">
            <label for="expected_end">Start Date</label>
            <input type="date" name="expected_end" class="form-control" v-model="formData.start_date" required>
        </div>
        <div class="col col-12 col-md-6">
            <label for="expected_end">Expected Return Date</label>
            <input type="date" name="expected_end" class="form-control" v-model="formData.return_date" :min="formData.start" required>
        </div>
        <div class="col col-12 col-md-6 mt-2" v-if="formData.returned_date != null">
            <label for="expected_end">Returned Date</label>
            <input type="date" name="expected_end" class="form-control" v-model="formData.returned_date" :min="formData.start" required>
        </div>
        </div>
  
        <label for="notes" class="mt-2">Hire Notes</label>
        <textarea name="notes" class="form-control" cols="30" rows="3" v-model="formData.notes"></textarea>
  
        <input type="submit" aria-label="submit" class="form-control btn btn-primary mt-2" value="Update Hire">
      </form>
    </div>
  </template>
  
  <script setup>
  import { computed, ref } from 'vue';
  import HeaderLine from '../../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import { useUserStore } from '/resources/js/stores/user';
  import { useInstrumentStore } from '/resources/js/stores/instruments';
  import { useStudentStore } from '/resources/js/stores/students';
  import { useHireStore } from '/resources/js/stores/hires';
  import axiosClient from '/resources/js/axios';
  import moment from 'moment';
  import { useModalStore } from '/resources/js/stores/modal';
import { useToastStore } from '/resources/js/stores/toast';
  
  // Initiate Stores
  const modal = useModalStore()
  const toast = useToastStore()
  const hireStore = useHireStore()
  const currentHire = hireStore.getHire
  
  const returnedValue = computed(()=>{
    return moment(currentHire.attributes.returned_date).format('yyyy-MM-DD') != 'Invalid date' ? moment(currentHire.attributes.returned_date).format('yyyy-MM-DD') : null
  })
  const formData = ref({
    start_date: moment(currentHire.attributes.start_date).format('yyyy-MM-DD'),
    return_date: moment(currentHire.attributes.return_date).format('yyyy-MM-DD'),
    returned_date: returnedValue.value,
    notes: currentHire.attributes.notes
  })


  function updateHire(){
    axiosClient.patch('hires/' + currentHire.id, formData.value).then(res => {
        hireStore.updateHire(res.data.hire)
        toast.open('success', 'Hire Details Updated', 'Hire details have been successfully updated.')
        modal.close()
    })
  }
  
  
  </script>
  
  <style lang="scss" scoped>
  
  </style>