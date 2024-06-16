<template>
    <i class="fa-2x" :class="{'fa-square-check fa-solid': state, 'fa-square fa-regular': !state}" @click="changeState(!state)"></i>
</template>

<script setup>

const props = defineProps({state: Boolean})
const emit = defineEmits(['newState'])

function changeState(state){
    emit('newState', state)
}

</script>

<style lang="scss" scoped>
.fa-2x {
    color: $ah-primary;
    cursor: pointer;
}

</style>