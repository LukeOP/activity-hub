<template>
  <div class="text-center">
    <h1>School Setup</h1>
    <p>To get started using Activity Hub you're going to need to be associated with a school.</p>
    <p>Use a code to link up with an existing school or create your own.</p>
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
  modal.open()
}

</script>

<style lang="scss" scoped>

</style>