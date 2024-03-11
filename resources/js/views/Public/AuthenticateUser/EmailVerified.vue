<template>
    <div v-if="verified">
        <h2>Success!</h2>
        <p>Your email has been verified and you may now log in.</p>
        <button style="max-width: 300px;" class="btn btn-primary my-3 form-control"
        @click="router.push({name:'Login'})">Log In</button>
    </div>
    <div v-if="error">
        <h2>Error!</h2>
        <p>{{ error }}</p>
    </div>
    <div v-if="!error && !verified">
        <h2>Verifying...</h2>
    </div>
</template>

<script setup>
import axiosClient from '/resources/js/axios';
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
const router = useRouter()
const route = useRoute()
const verified = ref(false)
const error = ref('')
function checkEmailToken(){
    axiosClient.post('user-email-verify-check', {
        email: route.query.email,
        token: route.query.token
    }).then(res => {
        verified.value = true
    }).catch(err => {
        error.value = err.message
    })
}

onMounted(() => {
    checkEmailToken()
})
</script>

<style lang="scss" scoped>
h2 {
  font-size: 1.35rem;
}

</style>