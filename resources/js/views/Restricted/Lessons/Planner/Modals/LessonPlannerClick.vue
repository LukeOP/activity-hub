<template>
    <div>
        <h2 class="text-center mb-3">Lesson Actions</h2>
        <div class="actions">
            <div v-for="action in actions" :key="action" class="action" @click="handleClick(action)">
                <div class="icon-image"><i :class="action.icon" /></div>
                <div class="title">{{ action.title}}</div>
            </div>
        </div>
    </div>
</template>

<script setup>
import moment from 'moment';
import { useRouter } from 'vue-router';
import { useModalStore } from '../../../../../stores/modal';
import { useLessonsStore } from '../../../../../stores/lessons';
import { useAppStore } from '../../../../../stores/appStore';

    const router = useRouter()
    const modal = useModalStore()
    const lessonStore = useLessonsStore()
    const appStore = useAppStore()
    const currentDate = moment(appStore.getItems.date).format('YYYY-MM-DD')
    const today = moment().format('YYYY-MM-DD')
    const actions = [
        {title: 'View Lesson Details', route: 'LessonDetails', modal: null, icon: 'fa-regular fa-file-lines'},
        {title: 'Lesson Notes', route: null, modal: 'LessonNotes', icon: 'fa-regular fa-pen-to-square'},
    ]
    if(currentDate <= today && !attendanceAlreadyExists()){
        actions.unshift({title: 'Attendance', route: null, modal: 'LessonRecordAttendance', icon: 'fa-solid fa-list-check'})
    }
    if(currentDate <= today && attendanceAlreadyExists()){
        actions.unshift({title: 'Attendance', route: null, modal: 'LessonEditAttendance', icon: 'fa-solid fa-list-check'})
    }

    function attendanceAlreadyExists() {
        let lesson = lessonStore.getLessonData.attendance.filter(a => a.date === currentDate)
        return lesson.length > 0
    }

    function handleClick(action){
        if(action.route != null){
            router.push({
                name: action.route
            })
            modal.close()
        }
        else if(action.modal){
            modal.open(action.modal)
        }
    }

</script>

<style lang="scss" scoped>
.actions {
    display: flex;
    justify-content: space-between;
}
.action {
    text-align: center;
    box-shadow: 5px 5px 10px lightgray;
    border-radius: 0.25rem;
    width: 50%;
    margin: 0.5rem;
    &:hover {
        cursor: pointer;
        background-color: $ah-primary-light;
        color: white;
        .icon-image {
            color: $ah-primary;
        }
    }
    &:first-of-type {
        margin-left: 1rem;
    }
    &:last-of-type {
        margin-right: 1rem;
    }
    .icon-image {
        height: 150px;
        color: $ah-primary;
        font-size: 6em;
        background-color: $ah-primary-background;
        i {
            margin: auto;
        }
    }
    .title {
        padding: 10px;
        // border-top: 1px solid $ah-primary;
    }
}
@media (max-width: 768px){
    .actions {
        max-height: 80vh;
        display:block;
        width: 100%;
        .action {
            width: 85%;
            margin: 0 auto;
            margin-bottom: 1rem;
            .icon-image {
                height: 100px;
                color: $ah-primary;
                background-color: $ah-primary-background;
                font-size: 5em;
                i {
                    margin: auto;
                }
            }
        }
    }
}

</style>