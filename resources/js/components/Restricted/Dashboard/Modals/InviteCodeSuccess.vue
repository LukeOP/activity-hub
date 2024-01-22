<template>
  <div class="d-flex" style="flex-direction:column; align-items:center">
    <h2 class="text-center text-green">Success!</h2>
    <div class="text-center" style="font-size:1.25rem">You are now connected with {{schoolStore.getSchool.name}}</div>
    <div class="text-center">We will let the administrator know so they can get you all set up!</div>
    <button class="btn btn-green" @click="close">Let's Go!</button>
  </div>
</template>

<script setup>
import { useModalStore } from "../../../../stores/modal";
import { useSchoolStore } from "../../../../stores/schools";
import { useUserStore } from "../../../../stores/user";
const schoolStore = useSchoolStore()
const modal = useModalStore()
const user = useUserStore()

function close(){
  user.resetUserWithToken()
  modal.close()
}

</script>

<style lang="scss" scoped>
button {
  margin-top: 2rem;
  min-width: 120px;
}

</style>