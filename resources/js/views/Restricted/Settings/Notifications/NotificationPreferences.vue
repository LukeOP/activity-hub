<template>
    <div id="notifications-header">
        <div class="description"></div>
        <div class="school-column" v-for="(school, index) in user.getSchools" :key="index">
            <img :src="school.logo" />
        </div>
    </div>
    <div v-for="(section, index) in notificationSections" :key="index" v-if="notificationOptions">
        <h3>{{ section }} Notifications</h3>
        <NotificationPreference v-for="(notification, index) in notificationsInSection(section)" :key="index" :notification="notification"/>
    </div>
    <!-- <NotificationPreference v-for="(notification, index) in notificationOptions" :key="index" :notification="notification"/> -->
</template>

<script setup>
import { useUserStore } from '../../../../stores/user';
import NotificationPreference from './NotificationPreference.vue';
// import { notificationOptions } from './NotificationOptions';
import useApi from '../../../../composables/useApi';
import useSorter from '../../../../composables/useSorter';

const user = useUserStore()
const sorter = useSorter()

const {data: notificationOptions, fetchData} = useApi('notification-options');
fetchData().then(()=>{
    sorter.sort(notificationOptions.value, 'type')
})

function notificationsInSection(section){
    return notificationOptions.value.filter(o => o.type == section.toLowerCase())
}

const notificationSections = [
    'Lesson',
    'Event',
    'Hire',
    'User'
]



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
h3 {
    margin-top: 1rem;
    border-bottom: 1px solid $ah-grey;
}
</style>