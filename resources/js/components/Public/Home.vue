<template>
<div>
  <div id="loginContainer" class="center">
    <img id="logo-img" src="/images/ActivityHub-Logo.png" alt="Activity Hub Logo">
    <h2>Login</h2>
    <form @submit.prevent="handleLogin">
      <input type="text" class="form-control my-2" v-model="login.email" placeholder="email">
      <input type="password" class="form-control" v-model="login.password" placeholder="password">
      <button class="btn btn-primary my-3 form-control" @click="handleLogin">Continue</button>
    </form>
    <div v-if="error" class="error">{{error}}</div>

  </div>
  <button class="btn btn-primary" style="position:fixed; bottom:20px; left:40%" @click="loginTutor">Log In Tutor</button>
  <button class="btn btn-secondary" style="position:fixed; bottom:20px; left:20%" @click="loginUser">Log In User/Admin</button>
  <button class="btn btn-primary" style="position:fixed; bottom:20px; right:20%" @click="loginAdmin">Log In Admin</button>
</div>
</template>

<script>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../stores/user'
import Calendar from '../Calendar.vue'

import {useToast} from 'vue-toast-notification';

export default {
  components: {
    Calendar
  },
  setup(){
    const user = useUserStore()
    const router = useRouter()
    const error = ref('')

    const login = ref({
      login: '',
      password: ''
    })

    function handleLogin(){
      error.value = ''
      user.login({
        email: login.value.email,
        password: login.value.password,
        remember: true,
      }).then(() => {
        router.push({
          path: '/manage/your-day'
        })
      }).catch(err => {
        error.value = setError(err.response)
      })
    }

    function setError(statusVal){
      if(statusVal === 401) return 'Invalid login'
      if(statusVal === 422) return 'All fields are required'
      if(statusVal === 500) return 'Error in fetching user'
      else return 'An unexpected error has occured'
    }

    function loginUser(){
      login.value.email = 'j.smith@this.com'
      login.value.password = 'Test1234!'
      handleLogin()
    }

    function loginAdmin(){
      login.value.email = 'l.williams@this.com'
      login.value.password = 'Test1234!'
      handleLogin()
    }

    function loginTutor(){
      login.value.email = 't.tutor@this.com'
      login.value.password = 'Test1234!'
      handleLogin()
    }

    return { 
      handleLogin, 
      login, 
      loginUser,
      loginAdmin,
      loginTutor,
      error}
  }

}
</script>

<style lang="scss" scoped>
#loginContainer {
  width: 300px;
  padding: 10px;
  // border: 1px solid black;
  border-radius: 10px;
  text-align: center;

  #logo-img {
    width: 100%;
    margin-top: 2rem;
    margin-bottom: 3rem;
  }
  .error {
    max-width: 280px;
    color: rgb(166, 0, 0);
    background: rgba(166, 0, 0, 0.1);
    border: 1px solid rgb(166, 0, 0);
    padding: 5px;
    position: fixed;
    margin-left: auto;
    margin-right: auto;
  }
}

.center {
  position: fixed; /* Set the position of the div to absolute */
  top: 30%; /* Set the top to 50% */
  left: 50%; /* Set the left to 50% */
  transform: translate(-50%, -50%); /* Use the transform property to center the div */
}
</style>