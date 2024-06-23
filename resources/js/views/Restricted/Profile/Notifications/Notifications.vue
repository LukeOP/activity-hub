<template>
    <section id="notifications">
        <HeaderLine heading="Notifications" />
        <div class="notifications-group">
            <div class="notification-tile" v-for="(notification, index) in notifications" :key="index">
                <NotificationTile :notification="notification" />
            </div>
        </div>
    </section>
</template>

<script setup>
import HeaderLine from '@/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import NotificationTile from '@/components/Layouts/MainLayout/TopBarElements/NotificationTile.vue';
import { notifications } from '../../../../components/Layouts/MainLayout/TopBarElements/demoNotifications';
import useSorter from '../../../../composables/useSorter';

const sorter = useSorter()
sorter.sort(notifications, 'created_at', 'desc')

</script>

<style lang="scss" scoped>
.notifications-group {
    display: flex;
    flex-direction: column;
    max-height: calc(100vh - 220px);
    overflow: hidden;
    overflow-y: auto;
    // background-color: white;
    // box-shadow: 0 0 20px $ah-grey-light;
    .notification-tile {
        padding: 10px;
        border-radius: 0.5rem;
    }
}
</style>