<template>
  <div class="text-center">
    <h1>School Setup</h1>
    <p>To get started using Activity Hub you're going to need to be associated with a school. <br>
      A school hosts students who can sign up for lessons and events.</p>
    <p>If you are joining an existing school use the code sent to you or speak with the school administrator. <br>
      Alternatively, you can create your own school.</p>
    <button class="btn btn-secondary m-2" @click="handleLink">Link to Existing School</button>
    <button class="btn btn-primary m-2" @click="handleCreate">Create Your Own School</button>
  </div>
</template>

<script setup>
import { useModalStore } from '../../../../../stores/modal';

const modal = useModalStore()

function handleLink(){
  modal.open('InviteCodeEntryOnBoarding')
}
function handleCreate(){
  modal.open('CreateSchool')
}

</script>

<style lang="scss" scoped>

</style>