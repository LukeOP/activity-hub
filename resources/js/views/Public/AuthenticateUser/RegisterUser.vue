<template>
    <h2>Register</h2>
    <form @submit.prevent="handleRegister">
      <input type="text" class="form-control my-2" v-model="register.first_name" placeholder="First Name" required>
      <input type="text" class="form-control my-2" v-model="register.last_name" placeholder="Last Name" required>
      <input type="text" class="form-control my-2" v-model="register.email" placeholder="Email" required>
      <input type="password" class="form-control my-2" v-model="register.password" placeholder="Password" required>
      <input type="password" class="form-control" v-model="register.password_confirmation" placeholder="Confirm Password" required>

      <ButtonLoading buttonClass="btn-primary w-100 my-3" :loading="loading" inputmode="submit">Register</ButtonLoading>
      <!-- <button type="submit" class="btn btn-primary my-3 form-control" :disabled="loading">Continue
        <loading-spinner :isLoading="loading" class="float-end" />
      </button> -->
    </form>
    <router-link :to="{name: 'Login'}" class="ah-link">Or login to an existing account.</router-link>
    <div v-if="error" class="error">{{error}}</div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '../../../stores/user'
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'
import ButtonLoading from '../../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';


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