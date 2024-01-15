<template>
<div style="width: 100%;">
  <div id="loginContainer" class="my-5">
    <img id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
    <h2>Register</h2>
    <form @submit.prevent="handleRegister">
      <input type="text" class="form-control my-2" v-model="register.first_name" placeholder="First Name">
      <input type="text" class="form-control my-2" v-model="register.last_name" placeholder="Last Name">
      <input type="text" class="form-control my-2" v-model="register.email" placeholder="Email">
      <input type="password" class="form-control my-2" v-model="register.password" placeholder="Password">
      <input type="password" class="form-control" v-model="register.password_confirmation" placeholder="Confirm Password">
      <button type="submit" class="btn btn-primary my-3 form-control">Continue</button>
    </form>
    <router-link :to="{name: 'Login'}" class="ah-link">Or login to an existing account.</router-link>
    <div v-if="error" class="error">{{error}}</div>
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
h2 {
  font-size: 1.35rem;
}
#loginContainer {
  position: relative;
  max-width: 500px;
  padding: 10px;
  // border: 1px solid black;
  border-radius: 10px;
  text-align: center;

  #logo-img {
    position: relative;
    width: 100%;
    max-width: 250px;
    margin: 0 auto;
    margin-top: 2rem;
    margin-bottom: 1rem;
  }
  .error {
    max-width: 300px;
    color: rgb(166, 0, 0);
    background: rgba(166, 0, 0, 0.1);
    border: 1px solid rgb(166, 0, 0);
    padding: 5px;
    margin: 1rem auto;
  }
  #login-btn {
    color: $ah-primary;
    text-decoration: none;
  }
}
form {
  max-width: 300px;
  margin: 0 auto;
}

</style>