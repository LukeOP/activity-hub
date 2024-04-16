<template>
    <div class="text-center">
        <h1>Create A New School</h1>
        <p>Get started quickly with a basic school account.</p>
        <form class="text-start" @submit.prevent="createSchool">
            <label>School Name:
                <input type="text" class="form-control" v-model="school.name" required>
                <button type="submit" class="btn btn-primary float-end mt-2">Create School</button>
            </label>
        </form>
    </div>
</template>

<script setup>
import { useUserStore } from '/resources/js/stores/user';
import axiosClient from '/resources/js/axios';
import { ref } from 'vue';
import { useSchoolStore } from '/resources/js/stores/schools';
import { useModalStore } from '/resources/js/stores/modal';

const user = useUserStore()
const schoolStore = useSchoolStore()
const modal = useModalStore()

const school = ref({
    name: '',
    subscription: 'Basic'
})

function createSchool(){
    axiosClient.post('schools', school.value).then(res => {
        handleJoin(res.data)
    })
}

async function handleJoin(school){
    let error = 0

    // Link user with the school
    await axiosClient.post('user-school', {user_id: user.attributes.id, school_id: school.id})
    .then(response => {
        // Do something with the response, if needed
        // console.log('user school success')
    })
    .catch(error => {
        // console.log(error.message)
        // console.log('user school error')
        error++
    });

    if(error === 0){
    // Assign user a basic position at the newly assigned school
    await axiosClient.post('user-position', {user_id: user.attributes.id, school_id: school.id})
        .then(response => {
        // Do something with the response, if needed
        // console.log('user postion success')
        })
        .catch(error => {
        // console.log(error.message)
        // console.log('user position error')
        error++
        });
    }
    
    if(error === 0){
    // Assign user a basic permission at the newly assigned school
    await axiosClient.post('user-permissions', {user_id: user.attributes.id, school_id: school.id, permission_type: 'Administrator'})
        .then(response => {
        // Do something with the response, if needed
        // console.log('user permission success')
        })
        .catch(error => {
        // console.log(error.message)
        // console.log('user permission error')
        });
    }

    if(error === 0){
        schoolStore.setSchool(school.id)
        user.resetUserWithToken()
        modal.open('NewSchoolSuccess')
    }
}

</script>

<style lang="scss" scoped>
label {
    width: 100%;
}

</style>