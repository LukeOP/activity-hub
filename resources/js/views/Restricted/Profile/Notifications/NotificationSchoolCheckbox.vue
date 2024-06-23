<template>
    <div class="school-column">
        <span v-if="user.hasPermissionFromArray(JSON.parse(notification.requires_permission), school.id) || JSON.parse(notification.requires_permission).includes('all')">
            <CheckBox :state="userNotificationState" @newState="setState" />
        </span>
        <span v-else>
            <ToolTip tip="Your access permissions prevent this option.">
                <i class="fa-solid fa-square fa-2x disabled"></i>
            </ToolTip>
        </span>
    </div>
</template>

<script setup>
import CheckBox from '../CheckBox.vue';
import { useUserStore } from '../../../../stores/user';
import { computed } from 'vue';
import useApi from '../../../../composables/useApi';
import ToolTip from '../../../../components/Layouts/MainLayout/Elements/ToolTip.vue';

const props = defineProps({school:Object, notification: Object})

const user = useUserStore()

const userNotificationState = computed(() => {
    return user.notifications.preferences.find(n => (n.school_id == props.school.id && n.option_id == props.notification.id))?.app
})

function setState(value){
    let notificationToggle = user.notifications.preferences.find(n => (n.school_id == props.school.id && n.option_id == props.notification.id))
    if(notificationToggle) {
        const {data, fetchData} = useApi('notifications/' + notificationToggle.id,{
            app: value
        }, 'PATCH')
        fetchData()
        .then(()=>{
            user.updateNotificationPreference(data.value.data)
        })
    }
    else {
        // API call to create new notification record.
        const {data, fetchData} = useApi('notifications',{
            user_id: user.getUser.attributes.id,
            school_id: props.school.id,
            option_id: props.notification.id,
            app: value ? 1 : 0
        }, 'POST')
        fetchData()
        .then(()=>{
            user.addNotificationPreference(data.value.data)
        })
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