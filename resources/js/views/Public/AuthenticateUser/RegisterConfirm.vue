<template>
    <h2>Register</h2>
    <p>Welcome aboard! Look out for an email to complete your registration. </p>
    <p class="ah-link" @click="router.push({name: 'Login'})">Back to login page</p>
</template>

<script>
import { useRouter } from 'vue-router';



export default {
  setup(){
    const router = useRouter()
    return { router }
  }

}
</script>

<style lang="scss" scoped>
h2 {
  font-size: 1.35rem;
}

</style>