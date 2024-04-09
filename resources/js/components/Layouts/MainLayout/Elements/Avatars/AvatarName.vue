<template>
    <div style="display: flex; align-items: center;">
        <Avatar :user="user" :hover="hover" class="avatar" />
        <div style="margin-left: 0.5rem;" :class="{mouseHover: hover}">{{ user.attributes.first_name }} {{ user.attributes.last_name }}</div>
    </div>
</template>

<script setup>
import Avatar from './Avatar.vue'
const props = defineProps({user: Object, hover:Boolean})

</script>

<style lang="scss" scoped>
.mouseOver {
    text-decoration: line-through;
    cursor: pointer;
}

</style>