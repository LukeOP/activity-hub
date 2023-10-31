<template>
  <section class="row">
    <div class="col col-12 col-md-6">
      <h2>Instrument: <span class="value hover" @click="viewInstrument">{{ hire.instrument.attributes.name }}</span></h2>
      <h2>Hirer: <span class="value hover" @click="viewStudent">{{ hire.student.full_name }}</span></h2>
      <h2>Form Signed: <span :class="{warning: hire.attributes.form_signed === 0}" class="value">{{ formatForm(hire.attributes.form_signed) }}</span></h2>
    </div>
    <div class="col col-12 col-md-6">
      <h2>Hire commenced: <span class="value">{{ formatDate(hire.attributes.start_date) }}</span></h2>
      <h2>Expected Return: <span class="value">{{ formatDate(hire.attributes.return_date) }}</span></h2>
    </div>
    <h2>Notes: <span class="value">{{ hire.attributes.notes }}</span></h2>
  </section>
</template>

<script setup>
import moment from 'moment';
import { useStudentStore } from '/resources/js/stores/students';
import { useRouter } from 'vue-router';

const props = defineProps({hire: Object})
const router = useRouter()
const studentStore = useStudentStore()

function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

function formatForm(value){
  return value === 0 ? 'No' : 'Yes'
}

function viewInstrument(){
  router.push({
    name: 'InstrumentDetails'
  })
}
function viewStudent(){
  studentStore.setStudent(props.hire.student)
  router.push({
    name: "StudentDetails"
  })

}

</script>

<style lang="scss" scoped>
h2 {
  color: $ah-primary-dark;
  font-weight: bold;
  font-size: 1rem;
  margin-right: 0.3rem;
}
.value {
  color: #212529;
  font-weight:400;
}
.warning {
  color: red;
}
.hover:hover {
  cursor: pointer;
  text-decoration: underline;
}

</style>