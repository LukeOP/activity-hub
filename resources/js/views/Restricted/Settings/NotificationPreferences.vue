<template>
    <div>
        <HeaderLine heading="Notification Preferences" />

        <section id="notifications">
            <h2 class="text-primary mt-2">In-App Notification Preferences</h2>
            <NotificationPreferences />
        </section>
    </div>
</template>

<script setup>
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import NotificationPreferences from '../Profile/Notifications/NotificationPreferences.vue';


</script>

<style lang="scss" scoped>

</style>