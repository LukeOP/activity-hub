<template>
  <LoadingSpinner :isLoading="loadingForm" :loadingText="true" />
  <div class="container" style="background-color: white; box-shadow: 0 0 10px grey; padding: 40px; min-height: 100vh;" v-if="!loadingForm">
    <section id="header" class="row">
      <img v-if="form.inputs.logo && form.school.logo" id="logo-img" :src="form.school.logo" alt="Activity Hub Logo">
      <img v-else id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
      <span id="header-span" >
        <h1 id="heading">{{ form.content.heading }}</h1>
        <h2 id="school-name" v-if="form.inputs.school_name">{{ form.school.name }}</h2>
        <span v-if="!submitted">
          <p style="white-space: pre-line;">{{ form.content.header_content }}</p>
          <hr />
        </span>
      </span>
    </section>

    <div v-if="!submitted">
      <form @submit.prevent="submitForm">
      
        <section id="contact-details" class="row">
          <h2>Contact Information:</h2>
          <p>{{ form.content.contact_details_content }}</p>
          <div class="col col-12 col-md-6">
            <label>{{ form.field_labels.student_name }}
              <input type="text" name="name" class="form-control" v-model="formData.student_name" required>
            </label>
            <label v-if="form.inputs.student_email == 1">{{ form.field_labels.student_email }}
              <input type="email" name="email" class="form-control" v-model="formData.student_email" required>
            </label>
            <label v-if="form.inputs.student_phone == 1">{{ form.field_labels.student_phone }}
              <input type="phone" name="phone" class="form-control" v-model="formData.student_phone" required>
            </label>
            <label v-if="form.inputs.student_age == 1">{{ form.field_labels.student_age }}
              <input type="number" name="age" class="form-control" v-model="formData.student_age" required>
            </label>
            <label v-if="form.inputs.student_year == 1">{{form.field_labels.student_year}}
              <input type="text" name="year" class="form-control" v-model="formData.student_year" required>
            </label>
          </div>

          <div class="col col-12 col-md-6">
            <label v-if="form.inputs.pc_name == 1">{{ form.field_labels.pc_name }}
              <input type="text" name="name" class="form-control" v-model="formData.parent_name" required>
            </label>
            <label v-if="form.inputs.pc_email == 1">{{ form.field_labels.pc_email }}
              <input type="email" name="email" class="form-control" v-model="formData.parent_email" required>
            </label>
            <label v-if="form.inputs.pc_phone == 1">{{ form.field_labels.pc_phone }}
              <input type="phone" name="phone" class="form-control" v-model="formData.parent_phone" required>
            </label>
          </div>
        </section>
        
        <section id="lesson-details" class="row">
          <h2>Lesson Information:</h2>
          <p>{{ form.content.lesson_details_content }}</p>
          <div class="col col-12 col-md-6">
            <label>{{ form.field_labels.instrument }}
              <select class="form-control" v-model="formData.instrument" required>
                <option v-for="instrument in form.available_instruments" :key="instrument" :value="instrument">{{ instrument }}</option>
              </select>
            </label>
            <label v-if="form.inputs.tutor == 1 && formData.instrument != ''">{{ form.field_labels.tutor }}
              <select class="form-control" v-model="formData.tutor" required>
                <option v-for="staff in tutorArray" :key="staff" :value="staff.tutor.id">{{ staff.tutor.full_name }}</option>
              </select>
            </label>
            <label v-if="form.inputs.funding_type == 1 && formData.instrument != ''">{{ form.field_labels.funding_type }}
              <select class="form-control" v-model="formData.funding_type" required>
                <option v-for="type in form.available_funding" :key="type" :value="type">{{ type }}</option>
              </select>
            </label>
          </div>
          <div class="col col-12 col-md-6">
            <label v-if="form.inputs.experience">{{ form.field_labels.experience }}
              <textarea rows="5" class="form-control" v-model="formData.experience"></textarea>
            </label>
          </div>
        </section>

        <section>
          <p>{{ form.content.footer_content }}</p>
          <ButtonLoading inputmode="submit" buttonClass="btn-primary float-end" :loading="submittingForm">Send Request</ButtonLoading>
        </section>

      </form>
      
      
      <section id="footer" class="mt-4">
        <img style="max-width: 30px; margin-right: 0.5rem" src="/images/ActivityHub_01.png" alt="Activity Hub Logo Icon">
        <span>Powered by <a href="https://activityhub.co.nz" class="link" target="_blank">Activity Hub</a> {{ moment().format('YYYY') }}</span>
      </section>
      
    </div>
    <div v-else class="text-center">
      <p>Your Lesson Request has been submitted.<br>
        A tutor will be in touch once your application has been reviewed.</p>
      <button class="btn btn-primary" @click="resetForm()">Submit another request</button>
    </div>
    <!-- <pre>{{ formData }}</pre> -->

  </div>
</template>

<script setup>
import { computed, ref } from 'vue';
import useApi from '/resources/js/composables/useApi';
import { useRoute } from 'vue-router';
import moment from 'moment';
import axiosClient from '/resources/js/axios';
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import ButtonLoading from '../../../components/Layouts/MainLayout/Elements/Buttons/ButtonLoading.vue';

const route = useRoute()

const staffList = ref([])
const submitted = ref(false)
const submittingForm = ref(false)

const formData = ref({
  student_name: '',
  student_email: '',
  student_phone: '',
  student_age: '',
  student_year: '',
  parent_name: '',
  parent_email: '',
  parent_phone: '',
  instrument: '',
  tutor: '',
  funding_type: '',
  experience: '',
  form_id: route.params.id
})

function resetForm(){
  formData.value = {
    student_name: '',
    student_email: '',
    student_phone: '',
    student_age: '',
    student_year: '',
    parent_name: '',
    parent_email: '',
    parent_phone: '',
    instrument: '',
    tutor: '',
    funding_type: '',
    experience: '',
    school_id: form.value.school.id,
    form_id: route.params.id
  }
  submitted.value = false
}

const { data: form, loading:loadingForm, fetchData: fetchFormData } = useApi('lesson-request-form/' + route.params.id)
fetchFormData().then(()=>{
  formData.value.school_id = form.value.school.id
  // Fetch school staff from database and add to store
  const { data: staff, fetchData: fetchStaff } = useApi('user-subjects-available/' + form.value.school.id)
  fetchStaff().then(() => {
    staffList.value = staff.value
  })
})

const tutorArray = computed(() => {
    let staff = staffList.value.filter(s => s.subject === formData.value.instrument)
    if(staff.length > 1) return [{tutor: {full_name: 'No Preference', id: 0}}, ...staff]
    return staff
})

function submitForm(){
  submittingForm.value = true
  const {data:requestData, error: requestError, fetchData: sendRequest} = useApi('lesson-request-form/create-public-request', formData.value, 'POST')
  sendRequest().then(()=>{
    if(!requestError.value){
      submitted.value = true
      console.log(requestData.value);
      const {fetchData: sendEmail} = useApi('email-lesson-request-received/' + form.value.id, requestData.value.data, 'POST')
      sendEmail()
    } else console.error(requestError.value);
  })
  submittingForm.value = false
}

</script>

<style lang="scss" scoped>
#header {
  justify-content: center;
  text-align: center;

  #logo-img {
    max-width: 300px;
  }

  #header-span {
    padding: 10px;
    #school-name {
      font-size: 1.25rem;
    }
    #heading {
      width: 100%;
    }
  }
}
section {
  margin-top: 2rem;
  &:first-of-type {
    margin-top: 0;
  }
}
label {
  width: 100%;
  margin-top: 1rem;
}
p {
  font-size: 1rem;
}
a {
  color: $ah-primary;
  text-decoration: none;
  &:hover {
    text-decoration: underline;
  }
}


</style>
