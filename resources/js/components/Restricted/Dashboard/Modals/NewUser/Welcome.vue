<template>
  <div class="text-center">
    <h1>Welcome {{user.attributes.first_name}}!</h1>
    <p>Let's take a few moments to get things setup.</p>
    <button class="btn btn-grey mx-2" @click="logout">Log out</button>
    <button class="btn btn-primary mx-2" @click="switchModal">Continue</button>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useModalStore } from '../../../../../stores/modal';
import { useUserStore } from '../../../../../stores/user';

const modal = useModalStore()
const user = useUserStore()
const router = useRouter()

function switchModal(){
  modal.open('CreateOrJoin')
}
function logout(){
  user.logout().then(()=>{
    router.push({
      name: 'Login'
    })
  })
}

</script>

<style lang="scss" scoped>

</style>