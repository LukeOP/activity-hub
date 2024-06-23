<template>
    <div id="notifications-header">
        <div class="description"></div>
        <div class="school-column" v-for="(school, index) in user.getSchools" :key="index">
            <img :src="school.logo" />
        </div>
    </div>
    <NotificationPreference v-for="(notification, index) in notificationOptions" :key="index" :notification="notification"/>
</template>

<script setup>
import { useUserStore } from '../../../../stores/user';
import NotificationPreference from './NotificationPreference.vue';
import { notificationOptions } from './NotificationOptions';

const user = useUserStore()

</script>

<style lang="scss" scoped>
img {
    max-width: 50px;
}
#notifications-header {
    display: flex;
    margin-bottom: 2rem;
    .description {
        min-width: 500px;
    }
    .school-column {
        min-width: 100px;
        text-align: center;
    }
}
</style>