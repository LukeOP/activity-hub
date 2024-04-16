<template>
    <section>
      <h2>Hire Agreement</h2>
      <h3 class="w-100">Agreement Uploaded: <span :class="{warning: hire.attributes.upload_id === null}" class="value">{{ formatForm(hire.attributes.upload_id) }}</span></h3>
      <div v-if="!hire.attributes.upload_id" class="btn btn-primary" @click="uploadAgreement" >Upload Hire Agreement</div>

      <a v-if="hire.attributes.upload_id" :href="URLString" target="_blank" class="btn btn-primary">Download Agreement</a><br>

      <span v-if="hire.attributes.upload_id" class="ah-link" style="width: fit-content; margin-right: 2rem;" @click="uploadAgreement" >Replace Agreement File</span>
      <span v-if="hire.attributes.upload_id" class="ah-link" style="width: fit-content;" @click="deleteAgreement" >Delete Agreement File</span>
    </section>
</template>

<script setup>
import { useModalStore } from '@/stores/modal'
import { computed } from 'vue';

const props = defineProps({hire:Object})
const modal = useModalStore()

const URLString = computed(() => {
  return import.meta.env.VITE_URL + '/download?document=' + props.hire.attributes.upload_id
})

function formatForm(value){
  return value === null ? 'No' : 'Yes'
}

function uploadAgreement(){
  modal.open('UploadHireAgreement')
}

function deleteAgreement(){
  modal.open('DeleteHireAgreement')
}

</script>

<style lang="scss" scoped>

</style>