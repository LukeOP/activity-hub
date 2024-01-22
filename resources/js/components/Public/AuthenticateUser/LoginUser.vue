<template>
    <h2>Log In To Your Account</h2>
    <form @submit.prevent="handleLogin">
      <input type="email" class="form-control my-2" v-model="login.email" placeholder="email">
      <input type="password" class="form-control" v-model="login.password" placeholder="password">
      <button class="btn btn-primary my-3 form-control" @click="handleLogin">Continue</button>
      <p class="ah-link" @click="routeChange({name: 'RecoverAccount'})">Forgot your password?</p>
      <p class="ah-link" @click="routeChange({name: 'Register'})">Not yet registered?</p>
      <div v-if="error" class="error">{{error}}</div>
      <div v-if="verification" id="verification" class="btn btn-primary form-control" @click="sendVerificationEmail">Send Verification Email</div>
    </form>
    <button id="demo-btn" class="btn btn-outline-primary mt-3" @click="loginUser">Log In Demo User</button>

</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../../stores/user'
import axiosClient from '/resources/js/axios';

const user = useUserStore()
const router = useRouter()
const error = ref('')
const verification = ref(false)
const verification_email = ref('')

const login = ref({
  email: '',
  password: ''
})

function handleLogin(){
  error.value = ''
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

function loginUser(){
  login.value.email = 'j.smith@this.com'
  login.value.password = 'Test1234!'
  handleLogin()
}

function sendVerificationEmail(){
  axiosClient.post('user-email-verify', {email: verification_email.value} ).then(res => {
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
    left: 1rem;
  }
}
</style>