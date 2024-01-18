<template>
  <h2>Recover Your Account</h2>
  <p>Set a new password for your account.</p>
  <form @submit.prevent="resetPassword" >
      <div>{{ formData.email }}</div>
  <input type="password" class="form-control my-2" v-model="formData.password" placeholder="new password" required>
  <input type="password" class="form-control my-2" v-model="formData.password_confirmation" placeholder="confirm password" required>
  <p v-show="passwordTooShort">Password must be at least 8 characters.</p>
  <button :disabled="!passwordsMatch || processing" class="btn btn-primary my-3 form-control">Reset Password</button>
  </form>
  <div v-if="error" class="error">{{error}}</div>
  <div v-if="message" class="message">{{message}}</div>
</template>

<script setup>
import axiosClient from '/resources/js/axios';
import { ref, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const route = useRoute()
const router = useRouter()

const error = ref('')
const message = ref('')
const processing = ref(false)
const formData = ref({
    email: route.query.email,
    password: '',
    password_confirmation: '',
    token: route.query.token
})

const passwordsMatch = computed(()=> {
    return (formData.value.password == formData.value.password_confirmation && formData.value.password.length > 7)
})
const passwordTooShort = computed(() => {
    return formData.value.password.length > 0 && formData.value.password.length < 8
})

function resetPassword(){
    processing.value = true
    axiosClient.post('user-reset-password', formData.value).then(res => {
        processing.value = false
        if(res.data == 'success') {
            message.value = 'Password reset! redirecting you to the Login page.'
            setTimeout(()=> {
                router.push({ name: 'Login'})
            }, 2000)
        } else error.value = 'There was an error in setting your new password.'
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
.message {
  max-width: 300px;
  color: $ah-primary;
  background: $ah-primary-background;
  border: 1px solid $ah-primary;
  padding: 5px;
  margin: 1rem auto;
}
form {
  max-width: 300px;
  margin: 0 auto;
}

</style>