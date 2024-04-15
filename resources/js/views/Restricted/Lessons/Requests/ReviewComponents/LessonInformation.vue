<template>
    <section>
        <div class="row">
          <h2 class="text-primary">Lesson Details:</h2>
  
          <div class="col col-12 col-md-6">
            <label>Requested Instrument
              <input type="text" class="form-control" :value="request.attributes.requested_instrument" disabled>
            </label>
            <label>Requested Tutor
              <input type="text" class="form-control" :value="getTutor(request.attributes.requested_tutor)" disabled required>
            </label>
            <label v-if="fundingOptions.length">Requested Funding
              <input type="text" class="form-control" :value="request.attributes.funding_type" disabled>
            </label>
            <label>Previous Experience
              <input type="text" class="form-control" :value="request.attributes.experience || 'None provided'" disabled>
            </label>
          </div>
  
          <div class="col col-12 col-md-6 mb-5">
            <label>Instrument
              <input type="text" class="form-control" :value="request.attributes.requested_instrument" disabled>
            </label>
            <label for="tutor">Assigned Tutor:
              <select v-if="filteredTutors.length > 0" name="tutor" class="form-control" v-model="lessonData.user_id" >
                <option v-for="tutor in filteredTutors" :key="tutor.id" :value="tutor.id">{{tutor.first_name}} {{tutor.last_name}}</option>
              </select>
              <p v-else class="error">You don't have any {{request.attributes.requested_instrument.toLowerCase()}} tutors registered at {{request.school.name}}!<br>
                You can edit tutor subjects in the staff menu.</p>
            </label>
            <label for="funding" v-if="fundingOptions.length">Funding Type:
              <select name="funding" class="form-control" v-model="lessonData.funding_type">
                <option v-for="option in fundingOptions" :key="option" :value="option.value">{{option.value}}</option>
              </select>
            </label>
          </div>
        </div>
        <hr />
      </section>
</template>

<script setup>
import { computed, ref, watch } from 'vue';
import { useStaffStore } from '../../../../../stores/staff';
import { useSchoolStore } from '../../../../../stores/schools';

const staffStore = useStaffStore()
const schoolStore = useSchoolStore()

const props = defineProps({request: Object, selectedStudent: Object})
const emit = defineEmits(['lessonData'])

const lessonData = ref({
    user_id: null,
    student_id: props.selectedStudent.id,
    instrument: props.request.attributes.requested_instrument,
    experience: props.request.attributes.experience,
    funding_type: props.request.attributes.funding_type
})

watch(()=> lessonData.value, (newLessonData) => {
    emit('lessonData', newLessonData)
}, {deep:true})

// Array of funding options
const fundingOptions = schoolStore.getSchool.data.funding

function getTutor(tutor_id){
  let selectedStaff = staffStore.getStaffList.find(s => s.id == tutor_id)
  if(selectedStaff) return selectedStaff.full_name
  else return "No Preference"
}

const filteredTutors = computed(()=>{
    return staffStore.getStaffList.filter(s => s.subjects.some(subject => subject.title === props.request.attributes.requested_instrument))
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
.error {
  color: $ah-red;
}
</style>