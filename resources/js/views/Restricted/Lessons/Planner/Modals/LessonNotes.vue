<template>
    <div id="notes-section">
        <div id="current-notes">
            <h2>Lesson Notes - {{ currentLesson.student.full_name }} ({{ currentLesson.attributes.instrument }})</h2>
            <p>{{ formatDate(appStore.getItems.date) }}</p>
            <label>Planning Notes:
                <textarea rows="3" class="form-control" placeholder="Introduce cool new technique..." v-model="formData.planning_comment"></textarea>
            </label>
            <label>Progress Comment:
                <textarea rows="3" class="form-control" placeholder="Today we worked on..." v-model="formData.progress_comment"></textarea>
            </label>
            <label>Next Steps
                <textarea rows="3" class="form-control" placeholder="Next time focus on..." v-model="formData.next_steps_comment"></textarea>
            </label>
            <button class="btn btn-primary" @click="submitNotes()" :disabled="!notesEntered">{{ formData.attendance_id != null ? 'Edit Notes' : 'Submit Notes' }}</button>
            <hr />
        </div>
        <div id="previous-notes">
            <h3 style="width:100%">Previous Lesson Notes:</h3>
            <div v-if="previousLessonNotes">
                <div>{{ formatDate(previousLessonNotes.attendance.date) }} - <i>{{ previousLessonNotes.attendance.attendance }}</i></div>
                Planning
                <div id="comment">{{ previousLessonNotes.comments.planning }}</div>
                Progress
                <div id="comment">{{ previousLessonNotes.comments.progress }}</div>
                Next Steps
                <div id="comment">{{ previousLessonNotes.comments.next_steps }}</div>
            </div>
            <div v-else class="mb-3">
                <span>No previous lesson notes have been recorded.</span>
            </div>
            <button class="btn btn-outline-primary">View All Notes</button>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '../../../../../stores/lessons';
import moment from 'moment';
import useSorter from '../../../../../composables/useSorter';
import { computed, ref } from 'vue';
import { useAppStore } from '../../../../../stores/appStore';
import { useUserStore } from '../../../../../stores/user';
import useApi from '../../../../../composables/useApi';
import { useModalStore } from '../../../../../stores/modal';

    const router = useRouter()
    const lessonStore = useLessonsStore()
    const currentLesson = lessonStore.getLessonData
    const modal = useModalStore()
    const user = useUserStore()
    const appStore = useAppStore()
    const sorter = useSorter()
    const selectedDate = moment(appStore.getItems.date).format('YYYY-MM-DD')

    const formData = ref({
        lesson_id: lessonStore.getLessonData.id,
        user_id: user.attributes.id,
        tutor_id: lessonStore.getLessonData.tutor.id,
        attendance_id: null,
        planning_comment: '',
        progress_comment: '',
        next_steps_comment: '',
        date: selectedDate,
        time: lessonStore.getLessonData.attributes.start
    })

    const previousLessonNotes = computed(() => {
        let previous = lessonStore.getLessonNotesAndAttendance.filter(l => l.attendance.date < selectedDate)
        sorter.sort(previous, 'attendance.date', 'desc')
        if(previous.length > 0){
            return previous[0]
        } else {
            return null
        }
    })

    const notesEntered = computed(() => {
        if(formData.value.planning_comment != '' || formData.value.progress_comment != '' || formData.value.next_steps_comment != ''){
            return true
        } else return false
    })

    function getCurrentLessonNotes() {
        let currentNotes = lessonStore.getLessonNotesAndAttendance.find(l => l.attendance.date == selectedDate)
        if(currentNotes) {
            formData.value.attendance_id = currentNotes.attendance.id,
            formData.value.planning_comment = currentNotes.comments.planning,
            formData.value.progress_comment = currentNotes.comments.progress,
            formData.value.next_steps_comment = currentNotes.comments.next_steps
        }
    }
    getCurrentLessonNotes()

    function submitNotes(){
        const { data, fetchData } = useApi('lesson-notes', formData.value, 'POST')
        fetchData().then(()=>{
            lessonStore.updateLessonRecord(data.value.data)
            modal.close()
        })
    }


    function formatDate(date){
        return moment(date).format('Do MMM, YYYY')
    }

</script>

<style lang="scss" scoped>
label {
    width: 100%;
}
textarea {
    border: 1px solid $ah-primary-background;
    border-left: 0.375rem solid $ah-primary-light;
    border-radius: 0.375rem;
    resize: vertical;
    margin-bottom: 0.5rem;
    &:focus {
        box-shadow: none;
        border-color: $ah-primary-light;
    }
}
#previous-notes {
    margin-top: 1rem;
    #comment {
        color: $ah-grey-dark;
        border-left:4px solid $ah-primary-light;
        padding: 0px 10px;
        margin-bottom: 1rem;
    }
    #comment-info {
        color: $ah-grey-dark;
        font-style: italic;
    }
}
#notes-section {
    max-height: 80vh;
    overflow-y: scroll;
}
/* Hide scrollbar for Chrome, Safari and Opera */
#notes-section::-webkit-scrollbar {
    display: none;
}

/* Hide scrollbar for IE, Edge and Firefox */
#notes-section {
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */
}

</style>