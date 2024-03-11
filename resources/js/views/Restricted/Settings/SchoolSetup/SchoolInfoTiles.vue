<template>
    <div>
        <h2>Schools you are an Administrator for:</h2>
        <div class="user-element school-tile" v-for="(school, index) in adminSchools" :key="index">{{ school.name }}</div>
    </div>
</template>

<script setup>
import { computed } from 'vue';
import { useUserStore } from '/resources/js/stores/user';

const user = useUserStore()

const adminSchools = computed(() => {
    return user.getPermissions.filter(p => p.type == 'Administrator')
})

</script>

<style lang="scss" scoped>
.school-tile {
    min-height: 100px;
    max-width: 50%;
    &:hover {
        cursor: pointer;
        box-shadow: 0 5px 10px $ah-grey
    }
}
@media (max-width: 768px) {
    .school-tile {
        max-width: 100%;
        margin-bottom: 1rem;
    }
}

</style>