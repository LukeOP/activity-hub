<template>
    <div class="text-center">
        <HeaderLine :heading="`Unlink From ${schoolStore.getSchool.name} `" center="true" />
        <p>Are you sure you wish to unlink {{staffStore.getStaff.full_name}} from {{schoolStore.getSchool.name}}?</p>
        <p>{{ staffStore.getStaff.first_name }} will no longer be able to access any data from this school.</p>
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
    import { useSchoolStore } from '../../../../../stores/schools';
    
    const staffStore = useStaffStore()
    const schoolStore = useSchoolStore()
    const modal = useModalStore()
    
    // const {data, loading, fetchData} = useApi(??????, null, 'DELETE', true)

    function deleteInvitation(){
        // TODO unlink Staff
    }
    
    </script>
    
    <style lang="scss" scoped>
    button {
        margin: 0.5rem;
    }
    
    </style>