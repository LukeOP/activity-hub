<template>
  <div>
    <section>
      <h3 v-if="hire.attributes.returned_date">NOTE: This hire concluded on {{ moment(hire.attributes.returned_date).format('MMMM Do, YYYY') }}.</h3>
    </section>
    <section class="row">
      <h2>Details</h2>
      <div class="col col-12 col-md-6">
        <div><h3>Instrument: <span class="value hover" @click="viewInstrument">{{ hire.instrument.attributes.name }}</span></h3></div>
        <div><h3>Hirer: <span class="value hover" @click="viewStudent">{{ hire.student.full_name }}</span></h3></div>
      </div>
      <div class="col col-12 col-md-6">
        <div><h3>Hire commenced: <span class="value">{{ formatDate(hire.attributes.start_date) }}</span></h3></div>
        <div><h3>Expected Return: <span class="value">{{ formatDate(hire.attributes.return_date) }}</span></h3></div>
        <div><h3>Returned: <span v-if="hire.attributes.returned_date" class="value">{{ formatDate(hire.attributes.returned_date) }}</span></h3></div>
      </div>
      <h3>Notes: <span class="value">{{ hire.attributes.notes }}</span></h3>
    </section>

    <section>
      <h2>Hire Agreement</h2>
      <h3 class="w-100">Agreement Uploaded: <span :class="{warning: hire.attributes.upload_id === null}" class="value">{{ formatForm(hire.attributes.upload_id) }}</span></h3>
      <div v-if="!hire.attributes.upload_id" class="btn btn-primary" @click="uploadAgreement" >Upload Hire Agreement</div>

      <a v-if="hire.attributes.upload_id" :href="URLString" target="_blank" class="btn btn-primary">Download Agreement</a><br>

      <span v-if="hire.attributes.upload_id" class="ah-link" style="width: fit-content; margin-right: 2rem;" @click="uploadAgreement" >Replace Agreement File</span>
      <span v-if="hire.attributes.upload_id" class="ah-link" style="width: fit-content;" @click="deleteAgreement" >Delete Agreement File</span>
    </section>
      
      <!-- <DownloadDocument v-if="hire.attributes.agreement" :id="hire.attributes.agreement" label="Download Agreement" :key="refresh" /> -->
  </div>
</template>

<script setup>
import moment from 'moment';
import { useStudentStore } from '/resources/js/stores/students';
import { useRouter } from 'vue-router';
import { useModalStore } from '/resources/js/stores/modal';
import DownloadDocument from '/resources/js/components/Layouts/MainLayout/Elements/DownloadDocument.vue';
import { ref, watch, onMounted, computed } from 'vue';
import { useHireStore } from '/resources/js/stores/hires';
import LoadingSpinner from '../../../../Layouts/MainLayout/Elements/LoadingSpinner.vue';
import useApi from '../../../../../composables/useApi';
import axiosClient from '../../../../../axios';

// const props = defineProps({hire: Object})
const hireStore = useHireStore()
const hire = ref(hireStore.getHire)
const router = useRouter()
const studentStore = useStudentStore()
const modal = useModalStore()
const refresh = ref(0)

const URLString = computed(() => {
  let url = ''
  if(import.meta.env.VITE_ENV === 'production') url = 'https://activityhub.co.nz/'
  else url = 'http://localhost:8000/'
  return url + 'download?document=' + hire.value.attributes.upload_id
})

function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

function formatForm(value){
  return value === null ? 'No' : 'Yes'
}

function viewInstrument(){
  router.push({
    name: 'InstrumentDetails'
  })
}
function viewStudent(){
  studentStore.setStudent(props.hire.student)
  router.push({
    name: "StudentDetails"
  })
}

function uploadAgreement(){
  modal.open('UploadHireAgreement')
}

function deleteAgreement(){
  modal.open('DeleteHireAgreement')
}

watch(() => hireStore.getHire, (newValue) => {
  hire.value = hireStore.getHire
  refresh.value++
}, {deep: true})

</script>

<style lang="scss" scoped>
.value {
  color: #212529;
  font-weight:400;
}
.warning {
  color: red;
}
.hover:hover {
  cursor: pointer;
  text-decoration: underline;
}
section {
  border-bottom: 1px dashed $ah-primary;
  padding: 1rem 0;
  &:last-of-type, &:first-of-type {
    border: none;
  }
}

</style>