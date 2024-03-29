<template>
    <div>
        <h2>Record Attendance - {{ lesson.student.full_name }}</h2>
        <form @submit.prevent="addRecord">
            <div class="attributes">
                <label>Lesson Occured On:
                    <input type="date" class="form-control" v-model="attendanceForm.date" :max="moment().format('YYYY-MM-DD')" disabled>
                </label>
                <label>At:
                    <input type="time" class="form-control" v-model="attendanceForm.time" required>
                </label>
            </div>
            <div style="display: flex; justify-content: space-evenly;">
                <button type="submit" class="btn btn-outline-red" @click.prevent="addRecord('absent')" :disabled="loading">Absent</button>
                <button type="submit" class="btn btn-outline-secondary" @click.prevent="addRecord('late')" :disabled="loading">Late</button>
                <button type="submit" class="btn btn-primary" @click.prevent="addRecord('present')" :disabled="loading">Present</button>
            </div>
        </form>
    </div>
</template>

<script setup>
import moment from 'moment';
import { ref } from 'vue';
import { useLessonsStore } from '../../../../../stores/lessons';
import useApi from '../../../../../composables/useApi';
import { useUserStore } from '../../../../../stores/user';
import { useModalStore } from '../../../../../stores/modal';
import { useAppStore } from '../../../../../stores/appStore';

    const lessonStore = useLessonsStore()
    const user = useUserStore()
    const lesson = lessonStore.getLessonData
    const appStore = useAppStore()
    const lessonDate = moment(appStore.getItems.date).format('YYYY-MM-DD')
    const modal = useModalStore()
    const loading = ref(false)

    const attendanceForm = ref({
        lesson_id: lesson.id,
        tutor_id: user.attributes.id,
        attendance: 'present',
        date: moment(lessonDate).format('YYYY-MM-DD'),
        time: lesson.attributes.start
    })

    function addRecord(submitOption){
        loading.value = true
        attendanceForm.value.attendance = submitOption
        const {data, fetchData} = useApi('lesson-attendance', attendanceForm.value, 'POST')
        fetchData().then(()=>{
            lessonStore.updateLessonRecord(data.value.data)
            modal.close()
        }).catch(()=>{
            modal.close()
        })
    }

</script>

<style lang="scss" scoped>
.attributes {
    display: flex;
    margin-bottom: 1rem;
    label {
        width: 100%;
        max-width: 50%;
        margin: 0 1rem;
    }
}
button {
    width: 150px;
}

</style>