<template>
    <div>
        <HeaderLine heading="Delete Hire Agreement" center="true" />
        <div style="max-width: 400px; margin: 0 auto;">
            <p>Are you sure you wish to delete the associated hire agreement?</p>
            <p>The cannot be undone.</p>
            <button class="btn btn-grey form-control mt-2" style="width: 100px; margin: 0 2rem 0 0;" @click="modal.close()">Cancel</button>
            <button class="btn btn-red form-control mt-2" style="width: 100px; margin: 0 2rem 0 0;" @click="deleteAgreement">Delete</button>
        </div>
    </div>
  </template>
  
<script setup>
import axiosClient from '/resources/js/axios';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useModalStore } from '/resources/js/stores/modal';
import { useHireStore } from '/resources/js/stores/hires';

const modal = useModalStore()
const hireStore = useHireStore()

function deleteAgreement(){
    axiosClient.delete('document/delete/' + hireStore.getHire.attributes.upload_id)
    .then(()=> {
        axiosClient.patch('hires/' + hireStore.getHire.id, {upload_id: null}).then(res => {
            hireStore.updateHire(res.data.hire)
            modal.close()
        })
    })
}


</script>
  
<style lang="scss" scoped>
  
</style>