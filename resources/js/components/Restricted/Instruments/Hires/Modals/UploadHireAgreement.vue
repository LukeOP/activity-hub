<template>
    <div>
        <HeaderLine heading="Upload Signed Hire Agreement" center="true" />
        <div style="max-width: 400px; margin: 0 auto;">
            <p>Keep track of your documentation by uploading it here.<br>
                You can then download it anytime it is needed.</p>
            <input class="form-control" type="file" ref="fileInput" @change="handleFileChange"  id="fileInput"/>
            <button class="btn btn-primary form-control mt-2" @click="uploadFile" :disabled="uploading">Upload Hire Agreement
            <LoadingSpinner :isLoading="uploading" /></button>
        </div>
    </div>
  </template>
  
<script setup>
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref } from 'vue';
import axiosClient from '/resources/js/axios';
import { useToastStore } from '/resources/js/stores/toast';
import { useModalStore } from '/resources/js/stores/modal';
import { useHireStore } from '/resources/js/stores/hires';
import LoadingSpinner from '../../../../Layouts/MainLayout/Elements/LoadingSpinner.vue';

const hireStore = useHireStore()
const toast = useToastStore()
const modal = useModalStore()
const uploading = ref(false)
const file = ref(null);

const handleFileChange = (event) => {
    file.value = event.target.files[0];
};

const uploadFile = () => {
    uploading.value = true;
    const formData = new FormData();
    formData.append('file', file.value);
    formData.append('school_id', hireStore.getHire.instrument.school.id);
    formData.append('category', "HireAgreements");

    axiosClient
        .post('document/upload', formData)
        .then((response) => {
            axiosClient.patch('hires/' + hireStore.getHire.id, {upload_id: response.data.document_id}).then(res => {
                hireStore.updateHire(res.data.hire)
                uploading.value = false
                toast.open('success', response.data.message, 'Hire agreement uploaded.')
                modal.close()
            })
        })
        .catch((error) => {
            console.error('Error uploading file:', error)
            uploading.value = false
            toast.open('error', 'Error During Upload', error.response.data.message)
            modal.close()
        })
    };
</script>
  
<style lang="scss" scoped>
  
</style>