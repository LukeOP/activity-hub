<template>
    <div>
        <HeaderLine heading="Delete Hire Agreement" center="true" />
        <div style="max-width: 400px; margin: 0 auto;">
            <p>Are you sure you wish to delete the associated hire agreement?</p>
            <p>The cannot be undone.</p>
            <button class="btn btn-grey form-control mt-2" style="width: 100px; margin: 0 2rem 0 0;" @click="modal.close()">Cancel</button>
            <button class="btn btn-red form-control mt-2" style="width: 100px; margin: 0 2rem 0 0;" @click="deleteAgreement" :disabled="deleting">{{ deleteText }}
            <LoadingSpinner :isLoading="deleting" class="float-end ps-2" /></button>
        </div>
    </div>
  </template>
  
<script setup>
import axiosClient from '/resources/js/axios';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useModalStore } from '/resources/js/stores/modal';
import { useHireStore } from '/resources/js/stores/hires';
import { ref } from 'vue';
import LoadingSpinner from '/resources/js/components/Layouts/MainLayout/Elements/LoadingSpinner.vue';

const modal = useModalStore()
const hireStore = useHireStore()
const deleteText = ref('Delete')
const deleting = ref(false)

function deleteAgreement(){
    deleting.value = true
    deleteText.value = "Deleting..."
    axiosClient.delete('document/delete/' + hireStore.getHire.attributes.upload_id)
    .then(()=> {
        axiosClient.patch('hires/' + hireStore.getHire.id, {upload_id: null}).then(res => {
            deleting.value = false
            deleteText.value = "Delete"
            hireStore.updateHire(res.data.hire)
            modal.close()
        })
    })
}


</script>
  
<style lang="scss" scoped>
  
</style>