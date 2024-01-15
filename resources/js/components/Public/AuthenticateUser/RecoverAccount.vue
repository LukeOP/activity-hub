<template>
  <div style="width: 100%;">
    <div id="loginContainer" class="my-5">
      <img id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
      <h2>Recover Your Account</h2>
      <p>Provide your account email to reset your password.</p>
      <form @submit.prevent="sendRecoveryInfo" >
        <input type="email" class="form-control my-2" v-model="formData.email" placeholder="email" required>
        <button :disabled="processing" class="btn btn-primary my-3 form-control">Send Recovery Details</button>
        <p class="ah-link" @click="returnToLoginPage">Back to login page</p>
      </form>
      <div v-if="error" class="error">{{error}}</div>
      <div v-if="response != ''" class="response">{{ response }}</div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import axiosClient from '/resources/js/axios';
import { ref } from 'vue';

const router = useRouter()
const error = ref('')
const formData = ref({
    email: ''
})
const processing = ref(false)
const response = ref('')

function sendRecoveryInfo(){
  processing.value = true
  axiosClient.post('user-forgot-password', formData.value).then(res => {
    formData.value.email = ''
    processing.value = false
    response.value = 'If a user profile exists with the provided email, you will receive an email shortly.'
  })
}

function returnToLoginPage(){
  router.push({name: 'Login'})
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
  border-radius: 10px;
  text-align: center;

  #logo-img {
    width: 100%;
    max-width: 250px;
    margin: 0 auto;
    margin-top: 2rem;
    margin-bottom: 1rem;
  }
  form {
    max-width: 300px;
    margin: 0 auto;
  }
  .error {
    max-width: 300px;
    color: rgb(166, 0, 0);
    background: rgba(166, 0, 0, 0.1);
    border: 1px solid rgb(166, 0, 0);
    padding: 5px;
    margin: 1rem auto;
  }
  .response {
    max-width: 300px;
    color: $ah-primary;
    background: $ah-primary-background;
    border: 1px solid $ah-primary;
    padding: 5px;
    margin: 1rem auto;
  }
}
</style>