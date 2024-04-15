<template>
    <div class="row">
        <div class="co col-12 col-md-6">
            <label for="student-email" v-if="checkEmailExists('student')">
                <input type="checkbox" id="student-email" name="student-email" v-model="email.student" style="width: fit-content;"> Email update to student.
            </label><br>
            <label for="pc-email" v-if="checkEmailExists('pc')">
                <input type="checkbox" id="pc-email" name="pc-email" v-model="email.pc" style="width: fit-content;"> Email update to Primary Caregiver.
            </label><br>
            <label for="sc-email" v-if="checkEmailExists('sc')">
                <input type="checkbox" id="sc-email" name="sc-email" v-model="email.sc" style="width: fit-content;"> Email update to Secondary Caregiver.
            </label>
        </div>
        <div class="co col-12 col-md-6">
            <ButtonLoading buttonClass="btn-primary w-100 mt-4" inputmode="submit" :loading="assigningLesson" :disabled="!formCompleted">Create Lesson</ButtonLoading>
        </div>
    </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue';
import ButtonLoading from '../../../../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';

const props = defineProps({selectedStudent: Object, lessonDetails: Object, assigningLesson: Boolean})
const emit = defineEmits(['emailCheckboxes'])

const email = ref({
    student: false,
    pc: false,
    sc: false
})

watch(()=> email.value, () => {
    emit('emailCheckboxes', email.value)
}, {deep:true})

const formCompleted =computed(()=>{
    if(props.lessonDetails.user_id != null && props.lessonDetails.student_id != null & props.lessonDetails.instrument != null) return true
    return false
})

function checkEmailExists(person) {
    const email = props.selectedStudent.contacts[person].email;
    return email !== null && email !== '';
}


</script>

<style lang="scss" scoped>

</style>