<template>
    <h2>Register</h2>
    <form @submit.prevent="handleRegister">
      <input type="text" class="form-control my-2" v-model="register.first_name" placeholder="First Name">
      <input type="text" class="form-control my-2" v-model="register.last_name" placeholder="Last Name">
      <input type="text" class="form-control my-2" v-model="register.email" placeholder="Email">
      <input type="password" class="form-control my-2" v-model="register.password" placeholder="Password">
      <input type="password" class="form-control" v-model="register.password_confirmation" placeholder="Confirm Password">
      <button type="submit" class="btn btn-primary my-3 form-control" :disabled="loading">Continue
        <loading-spinner :isLoading="loading" class="float-end" />
      </button>
    </form>
    <router-link :to="{name: 'Login'}" class="ah-link">Or login to an existing account.</router-link>
    <div v-if="error" class="error">{{error}}</div>
</template>

<script>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../../stores/user'
import Calendar from '../../Restricted/Dashboard/Calendar.vue'
import LoadingSpinner from '../../Layouts/MainLayout/Elements/LoadingSpinner.vue'


export default {
  components: {
    Calendar,
    LoadingSpinner
},
  setup(){
    const user = useUserStore()
    const router = useRouter()
    const error = ref('')
    const loading = ref(false)

    const register = ref({
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      password_confirmation: ''
    })

    function handleRegister(){
      error.value = ''
      loading.value = true
      user.register(register.value).then((res) => {
        router.push({
          name: 'RegisterConfirm'
        })
      }).catch(err => {
        error.value = err.response.message
        loading.value = false
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

form {
  max-width: 300px;
  margin: 0 auto;
}

</style>