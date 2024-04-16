<template>
    <div class="text-center">
        <HeaderLine heading="Delete Invitation" center="true" />
        <p>Are you sure you wish to delete the following invitation?</p>
        <p>{{ appStore.getItems.reference }} ({{ appStore.getItems.email }})</p>
      <div style="display:  flex; justify-content: center;">
        <button class="btn btn-grey" @click="modal.close()">Cancel</button>
        <ButtonLoading buttonClass="btn-red" @btnClick="deleteInvitation" :loading="loading">Delete</ButtonLoading>
      </div>
    </div>
      
    </template>
    
    <script setup>
    import HeaderLine from '@/components/Layouts/MainLayout/Elements/HeaderLine.vue'
    import ButtonLoading from '/resources/js/components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue'
    import useApi from '@/composables/useApi'
    import { useModalStore } from '@/stores/modal';
    import { useStaffStore } from '@/stores/staff';
    import { useAppStore } from '@/stores/appStore';
    
    const staffStore = useStaffStore()
    const modal = useModalStore()
    const appStore = useAppStore()
    
    const {data, loading, fetchData} = useApi('school-invitations/' + appStore.getItems.id, null, 'DELETE', true)

    function deleteInvitation(){
        fetchData().then(()=>{
            staffStore.setSchoolInvites(data.value.data)
            modal.close()
        })
    }
    
    </script>
    
    <style lang="scss" scoped>
    button {
        margin: 0.5rem;
    }
    
    </style>