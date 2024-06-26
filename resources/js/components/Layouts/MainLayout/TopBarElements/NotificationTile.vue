<template>
    <div class="notification" @click="handleClick">
        <span class="icon"><i :class="notification.icon"></i></span>
        <span class="info">
            <span class="header">
                <div class="text-primary">{{ notification.header }}</div>
            </span>
            <span class="details">{{ notification.details }}</span>
            <div class="date">{{ moment(notification.created_at).fromNow() }}</div>
        </span>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '../../../../stores/lessons';
import { useEventStore } from '../../../../stores/events';
import moment from 'moment';
import useApi from '../../../../composables/useApi';
import { useUserStore } from '../../../../stores/user';

const props = defineProps({notification:Object})
const router = useRouter()
const lessonStore = useLessonsStore()
const eventStore = useEventStore()
const user = useUserStore()

async function handleClick(){
    markAsRead()
    await setStoreData()
    router.push({
        name: props.notification.route
    })
}

function markAsRead(){
    useApi('notifications/' + props.notification.id, {seenStatus: 1}, 'PATCH')
    .fetchData()
    .then(()=>{
        user.markNotificationAsRead(props.notification.id)
    })
}

async function setStoreData(){
    switch (props.notification.dataType) {
        case 'lesson':
            lessonStore.setLesson(props.notification.dataId)
            break;
        case 'lessonRequest':
            const {data, fetchData} = useApi('lesson-requests')
            fetchData().then(()=>{
                lessonStore.setRequests(data.value.data)
                lessonStore.setRequest(props.notification.dataId)
            })
            break;
        case 'event':
            eventStore.setEvent(props.notification.dataId)
            break;
        default:
            break;
    }
}

</script>

<style lang="scss" scoped>
.notification {
    padding: 10px 20px;
    display: flex;
    min-height: 70px;
    border-radius: 0.5rem;
    .icon {
        padding-top: 10px;
        display: flex;
        font-size: 1.5rem;
        min-width: 45px;
    }
    .info {
        display: flex;
        flex-direction: column;
        width: 100%;
        width: calc(100% - 45px);
        .header {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
        }
        .date {
            color: $ah-grey;
            margin-right: 10px;
        }
    }
    &:hover {
        background-color: $ah-primary-light-background;
    }
}
</style>