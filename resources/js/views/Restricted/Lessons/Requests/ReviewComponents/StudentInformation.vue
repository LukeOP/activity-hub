<template>
    <section>
        <div class="row">
        <div class="col col-12 col-md-6">
            <h4 class="mt-2">Student Information:</h4>
            <label for="provided-student">Name of Student:
            <input type="text" id="provided-student" class="form-control" v-model="request.student.name" disabled>
            </label> 
        </div>
        <div class="col col-12 col-md-6">
            <h4 class="mt-2">Reviewed Student Information:</h4>
            <label for="reviewed-student">Name of Student:
                <span style="display:flex">
                <select id="reviewed-student" class="form-control" v-model="selectedStudent" @change="updateStudentDetails" required>
                    <option v-for="student in studentStore.getStudents" :key="student.id" :value="student">
                    {{student.last_name}}, {{ student.first_name }}
                    <span v-if="student.tutor_group"> - {{ student.tutor_group }}</span>
                    <span v-if="student.age"> - {{ student.age }}</span>
                    </option>
                </select>
                </span>
            </label>
        </div>
        </div>

        <div class="row" v-for="field in studentDetailsArray" :key="field">
        <div class="col col-12 col-md-6">
            <label v-if="field.if">{{ field.label }}
            <input :type="field.type" class="form-control" :value="field.value" disabled>
            </label>
        </div>
        <div v-if="selectedStudent" class="col col-12 col-md-6">
            <label v-if="field.if && field.contact">{{ field.label }}
            <span>
                <input :type="field.type" class="form-control" v-model="selectedStudent.contacts.student[field.item]" :disabled="field.disabled">
                <span v-if="!field.disabled" class="copy-btn" @click="copyField(field.label)">copy provided</span>
            </span>
            </label>
            <label v-if="field.if && !field.contact">{{ field.label }}
            <span>
                <input :type="field.type" class="form-control" v-model="selectedStudent[field.item]" :disabled="field.disabled">
                <span v-if="!field.disabled" class="copy-btn" @click="copyField(field.label)">copy provided</span>
            </span>
            </label>
        </div>
        </div>
        <hr />
    </section>
</template>

<script setup>
import useApi from '../../../../../composables/useApi';
import { onMounted, ref, watch } from 'vue';
import { useStudentStore } from '../../../../../stores/students';

const props = defineProps({request: Object})
const emit = defineEmits(['selectedStudent'])
const studentStore = useStudentStore()

// Load student lists
const { data, fetchData:fetchStudents } = useApi('school-students/' + props.request.school.id)

const studentDetailsArray = ref(null)
const selectedStudent = ref(null)

// Populating the data arrays for user input
function refreshStudentDetails(){
    studentDetailsArray.value = [
        {if: props.request.student.email, label: 'Student Email', contact: true, item: 'email', type: 'email', value: props.request.student.email},
        {if: props.request.student.phone, label: 'Student Phone', contact: true, item: 'mobile', type: 'phone', value: props.request.student.phone},
        {if: props.request.student.year, label: 'Year Level', item: 'year_level', type: 'text', value: props.request.student.year, disabled: true},
        {if: props.request.student.age, label: 'Age', item: 'age', type: 'text', value: props.request.student.age, disabled: true},
        {if: props.request.student.date_of_birth, label: 'Date of Birth', item: 'date_of_birth', type: 'date', value: props.request.student.date_of_birth, disabled: true},
    ]
}

// Copy data from request to student data.
function copyField(label){
  if(label === 'Student Email') selectedStudent.value.contacts.student.email = props.request.student.email
  if(label === 'Student Phone') selectedStudent.value.contacts.student.mobile = props.request.student.phone
}

watch(() => selectedStudent.value, (newStudent) => {
    refreshStudentDetails()
    if(selectedStudent.value.contacts == null){
        selectedStudent.value.contacts = {
            student: {email: null, mobile: null}, 
            pc: {name: null, email: null, mobile: null}, 
            sc: {name: null, email: null, mobile: null}}
    }
    emit('selectedStudent', newStudent)
})

onMounted(()=>{
    fetchStudents().then(()=>{
        if(data.value.data != studentStore.getStudents){
            studentStore.setStudents(data.value.data)
        }
    })
})

</script>

<style lang="scss" scoped>
label, input, select {
  margin-bottom: 0.5rem;
  width: 100%;
  span {
    display: flex;
    .form-control {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
    }
    .copy-btn {
      max-height: 37.03px;
      // border: 1px solid $ah-primary;
      background-color: $ah-primary;
      color: white;
      padding: 0.375rem 0.75rem;
      border-radius: 0 0.375rem 0.375rem 0;
      min-width: fit-content;
      &:hover {
        cursor: pointer;
        background-color: $ah-primary-dark;
      }
    }
  }
}
</style>