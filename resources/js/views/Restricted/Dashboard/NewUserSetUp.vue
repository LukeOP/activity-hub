<template>
  <div>
  </div>
</template>

<script setup>
import { watch } from 'vue';
import { useModalStore } from '../../../stores/modal';

const modal = useModalStore()
modal.open('NewUserWelcome')

watch(()=> modal.type, (newValue) => {
  if(newValue === ''){
    modal.open('NewUserWelcome')
  }
})

</script>

<style lang="scss" scoped>

</style>