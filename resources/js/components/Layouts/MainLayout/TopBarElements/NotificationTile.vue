<template>
    <div class="notification" @click="handleClick">
        <span class="icon"><i :class="notification.icon"></i></span>
        <span class="info">
            <span class="header">
                <span class="text-primary">{{ notification.header }}</span>
                <span class="date">{{ moment(notification.created_at).fromNow() }}</span>
            </span>
            <span class="details">{{ notification.details }}</span>
        </span>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '../../../../stores/lessons';
import { useEventStore } from '../../../../stores/events';
import moment from 'moment';

const props = defineProps({notification:Object})
const router = useRouter()
const lessonStore = useLessonsStore()
const eventStore = useEventStore()

function handleClick(){
    setStoreData()
    router.push({
        name: props.notification.route
    })
}

function setStoreData(){
    switch (props.notification.dataType) {
        case 'lesson':
            lessonStore.setLesson(props.notification.dataId)
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
    padding: 10px 0px;
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
        width: calc(100% - 45px);
        .header {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
            .date {
                color: $ah-grey;
                margin-right: 10px;
            }
        }
    }
    &:hover {
        background-color: $ah-primary-light-background;
    }
}
</style>