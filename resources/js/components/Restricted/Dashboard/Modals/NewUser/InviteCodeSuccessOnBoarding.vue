<template>
  <div class="d-flex text-center" style="flex-direction:column; align-items:center">
    <h2 class=" text-green">Success!!!</h2>
    <div style="font-size:1.25rem">You are now connected with {{schoolStore.getSchool.name}}</div>
    <div>We will let an administrator know so they can get you all set up!</div>
    <button class="btn btn-green mx-2" @click="close">Go to dashboard!</button>
  </div>
</template>

<script setup>
import { useModalStore } from "../../../../../stores/modal";
import { useSchoolStore } from "../../../../../stores/schools";
import { useUserStore } from "../../../../../stores/user";
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