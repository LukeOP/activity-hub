<template>
  <div>
    <HeaderLine heading="New Instrument Hire" />
    <form @submit.prevent="createHire">

      <div class="row mt-2">
        <div class="col col-12 col-md-6">
          <label for="school">School</label>
          <select name="school" class="form-control" v-model="formData.school" required>
            <option v-for="school in schools" :key="school.id" :value="school.school_id">{{school.name}}</option>
          </select>
        </div>
        <div class="col col-12 col-md-6">
          <label for="student">Student</label>
          <select name="student" class="form-control" v-model="formData.student" required>
            <option v-for="student in schoolStudents" :key="student.id" :value="student.id">{{student.full_name}}</option>
          </select>
        </div>
      </div>

      <div class="row mt-2">
        <div class="col col-12 col-md-6">
          <label for="instrument">Instrument</label>
          <select name="instrument" class="form-control" v-model="formData.instrument" required>
            <option v-for="instrument in schoolInstruments" :key="instrument.id" :value="instrument.id">{{instrument.attributes.name}}</option>
          </select>
        </div>
        <div class="col col-12 col-md-6">
          <label for="expected_end">Expected End Date</label>
          <input type="date" name="expected_end" class="form-control" v-model="formData.end" :min="formData.start" required>
        </div>
      </div>

      <label for="notes" class="mt-2">Hire Notes</label>
      <textarea name="notes" class="form-control" cols="30" rows="3" v-model="formData.notes"></textarea>

      <input type="submit" aria-label="submit" class="form-control btn btn-primary mt-2" value="Create Hire">
    </form>
  </div>
</template>

<script setup>
import { computed, ref } from 'vue';
import HeaderLine from '../../../../Layouts/MainLayout/Elements/HeaderLine.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useInstrumentStore } from '/resources/js/stores/instruments';
import { useStudentStore } from '/resources/js/stores/students';
import { useHireStore } from '/resources/js/stores/hires';
import axiosClient from '/resources/js/axios';
import moment from 'moment';
import { useModalStore } from '/resources/js/stores/modal';

// Initiate Stores
const user = useUserStore()
const instrumentStore = useInstrumentStore()
const studentStore = useStudentStore()
const hireStore = useHireStore()
const modal = useModalStore()

// Get User Schools
const schools = ref(user.permissions.filter(p => (p.type === 'Administrator' || p.type === 'INSTRUMENTS_C')))

// Get Available instruments in selected school (that is instruments with state = 1)
const instruments = ref(instrumentStore.getInstruments.filter(i => i.attributes.state.id === 1))

// set student list to existing list if available, otherwise fetch new students list and store in studentStore.
const students = ref(studentStore.getStudents)
if (students.value.length == 0) {
  axiosClient.get('students').then(res => {
    studentStore.setStudents(res.data)
  })
}

const formData = ref({
  school: schools.value[0].school_id,
  student: '',
  instrument: '',
  start: moment().format('YYYY-MM-DD'),
  end: '',
  notes: ''
})

const schoolStudents = computed(() => {
  let schoolStud = studentStore.getStudents.filter(s => s.school.id === formData.value.school)
  return schoolStud
})

const schoolInstruments = computed(() => {
  let schoolInst = instruments.value.filter(i => i.school.id === formData.value.school)
  return schoolInst
})

function createHire(){
  axiosClient.post(`hires`, formData.value).then(res =>{
    hireStore.addHire(res.data)
    instrumentStore.instruments.find(i => i.id === formData.value.instrument).attributes.state = {description: 'Hired Out', id: 2}
  })
  modal.close()
}


</script>

<style lang="scss" scoped>

</style>