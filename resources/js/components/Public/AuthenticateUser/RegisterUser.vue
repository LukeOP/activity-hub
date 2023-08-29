<template>
<div>
  <div id="loginContainer" class="center">
    <img id="logo-img" src="/images/ActivityHub-Logo.png" alt="Activity Hub Logo">
    <h2>Register</h2>
    <form @submit.prevent="handleRegister">
      <input type="text" class="form-control my-2" v-model="register.first_name" placeholder="First Name">
      <input type="text" class="form-control my-2" v-model="register.last_name" placeholder="Last Name">
      <input type="text" class="form-control my-2" v-model="register.email" placeholder="Email">
      <input type="password" class="form-control my-2" v-model="register.password" placeholder="Password">
      <input type="password" class="form-control" v-model="register.password_confirmation" placeholder="Confirm Password">
      <button type="submit" class="btn btn-primary my-3 form-control">Continue</button>
    </form>
    <div v-if="error" class="error">{{error}}</div>
    <router-link :to="{name: 'Login'}" id="login-btn">Or login to an existing account.</router-link>
  </div>
</div>
</template>

<script>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../../stores/user'
import Calendar from '../../Restricted/Dashboard/Calendar.vue'


export default {
  components: {
    Calendar
  },
  setup(){
    const user = useUserStore()
    const router = useRouter()
    const error = ref('')

    const register = ref({
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      password_confirmation: ''
    })

    function handleRegister(){
      error.value = ''
      user.register(register.value).then((res) => {
        user.login({
        email: register.value.email,
        password: register.value.password,
        remember: false})
          .then(() => {
            router.push({
              name: 'Dashboard'
          })})
          .catch(err => {
            error.value = setError(err.response)
          })
      }).catch(err => {
        error.value = setError(err.response)
      })
    }

    return { 
      handleRegister, 
      register, 
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
  #login-btn {
    color: $ah-primary;
    text-decoration: none;
  }
}

.center {
  position: fixed; /* Set the position of the div to absolute */
  top: 30%; /* Set the top to 50% */
  left: 50%; /* Set the left to 50% */
  transform: translate(-50%, -50%); /* Use the transform property to center the div */
}
</style>