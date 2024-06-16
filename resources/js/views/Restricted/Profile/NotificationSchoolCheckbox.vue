<template>
    <div class="school-column">
        <span v-if="user.hasPermissionFromArray(notification.requiresPermission, school.id) || notification.requiresPermission.includes('all')">
            <CheckBox :state="userNotificationState" @newState="setState" />
        </span>
        <span v-else>
            <i class="fa-solid fa-square fa-2x disabled"></i>
        </span>
    </div>
</template>

<script setup>
import CheckBox from './CheckBox.vue';
import { useUserStore } from '../../../stores/user';
import { computed } from 'vue';

const props = defineProps({school:Object, notification: Object})

const user = useUserStore()

const userNotificationState = computed(() => {
    return user.notifications.find(n => (n.school_id == props.school.id && n.description == props.notification.id))?.app
})

function setState(value){
    let notificationToggle = user.notifications.find(n => (n.school_id == props.school.id && n.description == props.notification.id))
    if(notificationToggle) {
        notificationToggle.app = value
        console.log('TODO add API call to update notification record.');
    }
    else {
        //TODO add API call to create new notification record.
        console.log('TODO add API call to create new notification record.');
    }
}

</script>

<style lang="scss" scoped>
.school-column {
    min-width: 100px;
    text-align: center;
    .disabled {
        color: $ah-grey-lightest;
        cursor: not-allowed;
    }
}
</style>