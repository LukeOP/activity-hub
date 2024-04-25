<template>
  <div>
    <section>
      <h3 v-if="hire.attributes.returned_date">NOTE: This hire concluded on {{ moment(hire.attributes.returned_date).format('MMMM Do, YYYY') }}.</h3>
    </section>
    <section class="row">
      <h2>Details</h2>
      <div class="col col-12 col-md-6">
        <div><h3>Instrument: <span class="value hover" @click="viewInstrument">{{ hire.instrument.attributes.name }}</span></h3></div>
        <div><h3>Hirer: <span class="value hover" @click="viewStudent">{{ hire.student.full_name }}</span></h3></div>
      </div>
      <div class="col col-12 col-md-6">
        <div><h3>Hire commenced: <span class="value">{{ formatDate(hire.attributes.start_date) }}</span></h3></div>
        <div><h3>Expected Return: <span class="value">{{ formatDate(hire.attributes.return_date) }}</span></h3></div>
        <div><h3>Returned: <span v-if="hire.attributes.returned_date" class="value">{{ formatDate(hire.attributes.returned_date) }}</span></h3></div>
      </div>
      <h3>Notes: <span class="value">{{ hire.attributes.notes }}</span></h3>
    </section>
    <DetailsHireAgreement :hire="hire" />
      
  </div>
</template>

<script setup>
import moment from 'moment';
import { useStudentStore } from '/resources/js/stores/students';
import { useRouter } from 'vue-router';
import { ref, watch } from 'vue';
import { useHireStore } from '/resources/js/stores/hires';
import DetailsHireAgreement from './DetailsHireAgreement.vue';

// const props = defineProps({hire: Object})
const hireStore = useHireStore()
const hire = ref(hireStore.getHire)
const router = useRouter()
const studentStore = useStudentStore()
const refresh = ref(0)


function formatDate(date){
  return moment(date).format('DD-MM-YYYY')
}

function viewInstrument(){
  router.push({
    name: 'InstrumentDetails'
  })
}
function viewStudent(){
  studentStore.setStudent(hire.value.student.id)
  router.push({
    name: "StudentDetails"
  })
}

watch(() => hireStore.getHire, (newValue) => {
  hire.value = hireStore.getHire
  refresh.value++
}, {deep: true})

</script>

<style lang="scss" scoped>
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
section {
  border-bottom: 1px dashed $ah-primary;
  padding: 1rem 0;
  &:last-of-type, &:first-of-type {
    border: none;
  }
}

</style>
