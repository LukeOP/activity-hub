<template>
    <div>
        <h2>Edit Attendance - {{ lesson.student.full_name }}</h2>
        <form @submit.prevent="addRecord">
            <div class="attributes">
                <label>Lesson Occured On:
                    <input type="date" class="form-control" v-model="attendanceForm.date" :max="moment().format('YYYY-MM-DD')" required disabled>
                </label>
                <label>At:
                    <input type="time" class="form-control" v-model="attendanceForm.time" required>
                </label>
            </div>
            <div style="display: flex; justify-content: space-evenly;" id="attendance-buttons">
                <button type="submit" class="btn" :class="attendance.attendance === 'cancelled' ? 'btn-darkGrey' : 'btn-outline-darkGrey'" @click.prevent="addRecord('cancelled')" :disabled="loading">No Lesson</button>
                <button type="submit" class="btn" :class="attendance.attendance === 'absent' ? 'btn-red' : 'btn-outline-red'" @click.prevent="addRecord('absent')" :disabled="loading">Absent</button>
                <button type="submit" class="btn" :class="attendance.attendance === 'late' ? 'btn-secondary' : 'btn-outline-secondary'" @click.prevent="addRecord('late')" :disabled="loading">Late</button>
                <button type="submit" class="btn" :class="attendance.attendance === 'present' ? 'btn-primary' : 'btn-outline-primary'" @click.prevent="addRecord('present')" :disabled="loading">Present</button>
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
    const attendance = lesson.attendance.find(a => a.date === lessonDate)
    const modal = useModalStore()
    const loading = ref(false)

    const attendanceForm = ref({
        attendance: attendance.attendance,
        date: lessonDate,
        time: attendance.time
    })

    function addRecord(submitOption){
        loading.value = true
        attendanceForm.value.attendance = submitOption
        const {data, fetchData} = useApi('lesson-attendance/' + attendance.id, attendanceForm.value, 'PATCH')
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
    width: 130px;
}

@media (max-width: 768px) {
    .attributes {
        label {
            margin: 0;
        }
    }
    #attendance-buttons {
        flex-direction: column-reverse;
        button {
            margin-bottom: 1rem;
            width: 100%;
            &:first-of-type {
                margin-bottom: 0;
            }
        }
    }
}

</style>