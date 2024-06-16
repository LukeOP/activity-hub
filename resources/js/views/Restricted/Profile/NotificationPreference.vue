<template>
    <div class="notification-row">
        <div class="description">{{ notification.description }}</div>
        <template v-for="(school, index) in user.getSchools" :key="index">
            <NotificationSchoolCheckBox :school="school" :notification="notification" />
        </template>
        <!-- <div class="school-column" v-for="(school, index) in user.getSchools" :key="index">
            <span v-if="user.hasPermissionFromArray(notification.requiresPermission, school.id)">
                <CheckBox :state="toggleState" @newState="setState" />
            </span>
            <span v-else>
                <i class="fa-solid fa-square fa-2x disabled"></i>
            </span>
        </div> -->
    </div>
    <!-- <div id="notification-preference" v-if="user.hasPermissionFromArray(notification.requiresPermission, school.id)">
        <Toggle :state="toggleState" @newState="setState" />
        
        {{ notification.description }}
    </div> -->
</template>

<script setup>
import { computed, ref } from 'vue';
import Toggle from './Toggle.vue';
import CheckBox from './CheckBox.vue';
import NotificationSchoolCheckBox from './NotificationSchoolCheckBox.vue';
import { useUserStore } from '../../../stores/user';

const props = defineProps({notification: Object, school:Object})
const user = useUserStore()

const toggleState = ref(user.notifications.some(n => (n.school_id === 1 && n.description == props.notification.id)))

function setState(state){
    console.log('clicked');
    return getNotificationState()
    // toggleState.value = state
}

function getNotificationState(school_id){
    console.log(user.notifications.filter(n => n.school_id === 1))
    return user.notifications.some(n => (n.school_id === 1 && n.description == props.notification.id))
    // if(school.name != 'Middleton Grange School') notificationList = swdNotifcations
    // return notificationList.some(n => n.description == props.notification.id)
}

const notificationState = computed((school_id) => {
    return true
})

</script>

<style lang="scss" scoped>
    // #notification-preference{
    //     display: flex;
    //     align-items: center;
    //     gap: 1rem;
    // }
    .notification-row {
        display: flex;
        .description {
            min-width: 500px;
        }
    }
</style>