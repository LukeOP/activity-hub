<template>
    <div class="text-center">
        <h1>Congratulations!</h1>
        <p>Your new school has been created!</p>
        <button @click="modal.close()" class="btn btn-primary">Let's get into it!</button>
    </div>
</template>

<script setup>
import { useModalStore } from '/resources/js/stores/modal';

const modal = useModalStore()

</script>

<style lang="scss" scoped>

</style>