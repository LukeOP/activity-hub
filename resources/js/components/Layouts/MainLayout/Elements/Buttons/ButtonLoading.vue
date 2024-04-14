<template>
    <button class="btn" :class="buttonClass" style="display: flex;" :style="{ justifyContent: textLeft ? 'flex-start' : 'center' }" :disabled="loading" @click="$emit('btnClick')">
        <slot></slot>
      <LoadingSpinner :isLoading="loading" style="margin-left: 1rem;" />
    </button>
</template>

<script setup>
import LoadingSpinner from '../LoadingSpinner.vue';

const props = defineProps({loading: Boolean, buttonClass: String, textLeft: Boolean})
const emit = defineEmits(['btnClick'])


</script>

<style lang="scss" scoped>

</style>