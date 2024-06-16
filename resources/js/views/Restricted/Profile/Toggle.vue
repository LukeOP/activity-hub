<template>
    <i class="fa-solid fa-2x" :class="{'fa-toggle-on': state, 'fa-toggle-off': !state}" @click="changeState(!state)"></i>
</template>

<script setup>

const props = defineProps({state: Boolean})
const emit = defineEmits(['newState'])

function changeState(state){
    emit('newState', state)
}

</script>

<style lang="scss" scoped>
.fa-solid {
    color: $ah-primary;
    cursor: pointer;
}

</style>