<template>
    <div class="notification-row">
        <div class="description">{{ notification.description }}</div>
        <template v-for="(school, index) in user.getSchools" :key="index">
            <NotificationSchoolCheckBox :school="school" :notification="notification" />
        </template>
    </div>
</template>

<script setup>
import NotificationSchoolCheckBox from './NotificationSchoolCheckBox.vue';
import { useUserStore } from '../../../../stores/user';

const props = defineProps({notification: Object, school:Object})
const user = useUserStore()

</script>

<style lang="scss" scoped>
    .notification-row {
        display: flex;
        .description {
            min-width: 500px;
        }
    }
</style>