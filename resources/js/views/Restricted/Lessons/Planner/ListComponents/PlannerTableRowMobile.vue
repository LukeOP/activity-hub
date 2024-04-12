<template>
    <div class="planner-item" :class="{active: showDetails}">
        <div class="planner-visible">
            <div class="planner-details" @click="showDetails = !showDetails">
                <div>{{ formatTime(lesson.attributes.start) }} - {{ formatTime(lesson.attributes.end) }} | {{ lesson.attributes.instrument }}</div>
                <div>{{ lesson.student.full_name }}</div>
            </div>
            <AttendanceIcon :lesson="lesson" :date="date" />
        </div>
        <div class="planner-hidden" v-if="showDetails" @click="showDetails = !showDetails">
            <div>Tutor: {{ lesson.tutor.full_name }}</div>
            <div v-if="lesson.school.room">Room: {{ lesson.school.room }}</div>
            <div>{{ lesson.school.name }}</div>
        </div>
    </div>
</template>

<script setup>
import moment from 'moment';
import { ref } from 'vue';
import AttendanceIcon from './AttendanceIcon.vue';

    const props = defineProps({lesson: Object, date: Object})
    const showDetails = ref(false)

    function formatTime(date){
        return moment(date, 'hh:mm:ss').format('hh:mma')
    }

</script>

<style lang="scss" scoped>
.planner-item {
    .planner-visible {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        .planner-details {
    
        }
        .planner-status-icon {
            width: 45px;
        }
    }
    .planner-hidden {
        padding: 10px;
    }
    &:nth-child(odd){
        background-color: $ah-primary-background;
    }
}
.active {
    background-color: $ah-primary-light !important;
    color: white;
    border-bottom: 1px solid $ah-grey;
}
</style>