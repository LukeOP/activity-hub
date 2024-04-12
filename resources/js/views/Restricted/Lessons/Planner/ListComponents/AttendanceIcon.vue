<template>
    <div class="planner-status-icon" @click="lessonClick()">
        <StatusIconSVG :status="getLessonAttendance(lesson.attendance)" />
    </div>
</template>

<script setup>
import moment from 'moment';
import StatusIconSVG from '../../../../../components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import { useAppStore } from '../../../../../stores/appStore';
import { useLessonsStore } from '../../../../../stores/lessons';
import { useModalStore } from '../../../../../stores/modal';

    const props = defineProps({lesson: Object, date: Object})
    const appStore = useAppStore()
    const lessonStore = useLessonsStore()
    const modal = useModalStore()

    function getLessonAttendance(attendanceArray){
        let response = 'pending'
        let currentDate = moment(props.date).format('YYYY-MM-DD')
        if(attendanceArray.length > 0){
            attendanceArray.find(a => a.date === currentDate) 
            ? response = attendanceArray.find(a => a.date === currentDate).attendance 
            : response = 'pending'
        }
        if(currentDate > moment().format('YYYY-MM-DD')) response = 'pending'
        return response
    }

    function lessonClick(){
        appStore.setItems({date: props.date})
        lessonStore.setLesson(props.lesson)
        modal.open('LessonPlannerClick')
    }

</script>

<style lang="scss" scoped>

</style>