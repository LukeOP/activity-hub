<template>
    <h2>Log In To Your Account</h2>
    <form @submit.prevent="handleLogin">
      <input type="email" class="form-control my-2" v-model="login.email" placeholder="email" required>
      <input type="password" class="form-control" v-model="login.password" placeholder="password" required>
      <ButtonLoading buttonClass="btn-primary w-100 my-3" inputmode="submit" :loading="loading">Continue</ButtonLoading>

      <p class="ah-link" @click="routeChange({name: 'RecoverAccount'})">Forgot your password?</p>
      <p class="ah-link" @click="routeChange({name: 'Register'})">Not yet registered?</p>
      <div v-if="error" class="error">{{error}}</div>
      <ButtonLoading v-if="verification" buttonClass="btn-primary w-100 my-3" @btnClick="sendVerificationEmail" :loading="loading">Send Verification Email</ButtonLoading>
    </form>

</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../../stores/user'
import axiosClient from '/resources/js/axios';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import ButtonLoading from '../../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';

const user = useUserStore()
const router = useRouter()
const error = ref('')
const verification = ref(false)
const verification_email = ref('')
const loading = ref(false)

const login = ref({
  email: '',
  password: ''
})

function handleLogin(){
  error.value = ''
  loading.value = true
  verification.value = false
  user.login({
    email: login.value.email,
    password: login.value.password,
    remember: true,
  }).then(() => {
    router.push({
      name: 'Dashboard'
    })
  }).catch(err => {
    error.value = setError(err.response)
    loading.value = false
  })
}

function setError(error){
  let statusVal = error.status
  if(statusVal === 401) return 'Credentials Are Invalid.'
  if(statusVal === 403) {
    verification.value = true
    verification_email.value = login.value.email
    return error.data.message
  }
  if(statusVal === 422) return 'All fields are required'
  if(statusVal === 500) return 'Error in fetching user'
  return 'An unexpected error has occured'
}

function routeChange(route){
  router.push(route)
}

function sendVerificationEmail(){
  loading.value = true
  axiosClient.post('user-email-verify', {email: verification_email.value} ).then(res => {
    loading.value = false
    verification.value = false
    error.value = 'Please check your email shortly for a verification link.'
  })
}
</script>

<style lang="scss" scoped>
h2 {
  font-size: 1.35rem;
}
.error {
  max-width: 300px;
  padding: 5px;
  margin: 1rem auto;
}
form {
  max-width: 300px;
  margin: 0 auto;
}

#demo-btn {
  position: relative;
  top: 50px;
}
@media (max-width: 768px) {
  #demo-btn {
    top: 0;
    margin: 0 auto;
  }
}
</style>