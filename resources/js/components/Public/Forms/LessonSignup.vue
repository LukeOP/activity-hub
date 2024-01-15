<template>
  <div class="container" v-if="form">
    <section id="header" class="row">
      <img v-if="form.inputs.logo && form.school.logo" id="logo-img" :src="form.school.logo" alt="Activity Hub Logo">
      <img v-else id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
      <span id="header-span" >
        <h1 id="heading">{{ form.content.heading }}</h1>
        <h2 id="school-name" v-if="form.inputs.school_name">{{ form.school.name }}</h2>
        <p>{{ form.content.header_content }}</p>
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
                <option v-for="instrument in SubjectsArray" :key="instrument" :value="instrument">{{ instrument }}</option>
              </select>
            </label>
            <label v-if="form.inputs.tutor == 1 && formData.instrument != ''">{{ form.field_labels.tutor }}
              <select class="form-control" v-model="formData.tutor" required>
                <option v-for="staff in tutorArray" :key="staff" :value="staff.tutor.id">{{ staff.tutor.full_name }}</option>
              </select>
            </label>
            <label v-if="form.inputs.type == 1">{{ form.field_labels.lesson_type }}
              <select class="form-control" v-model="formData.funding_type" required>
                <option value=""></option>
              </select>
            </label>
          </div>
          <div class="col col-12 col-md-6">
            <label v-if="form.inputs.experience">{{ form.field_labels.experience }}
              <textarea rows="5" class="form-control" v-model="formData.experience" required></textarea>
            </label>
          </div>
        </section>

        <section>
          <p>{{ form.content.footer_content }}</p>
          <input type="submit" class="btn btn-primary" value="Send Request">
        </section>

      </form>
      
      
      <section id="footer">
        <!-- <span v-html="" class="icon fill-white"></span> -->
        <p>Powered by Activity Hub {{ moment().format('YYYY') }}</p>
      </section>
      
    </div>
    <div v-else class="text-center">
      <p>Your Lesson Request has been submitted.<br>
        A tutor will be in touch once your application has been reviewed.</p>
      <button class="btn btn-primary" @click="resetForm()">Submit another request</button>
    </div>

  </div>
    <!-- <pre>{{tutorArray}}</pre> -->
    <!-- <pre>{{ form }}</pre> -->
    <!-- <pre>{{ staffList }}</pre>
    <pre>{{ formData }}</pre> -->
    <!-- <pre>{{ route.params.id }}</pre> -->
</template>

<script setup>
import { computed, ref } from 'vue';
import useApi from '/resources/js/composables/useApi';
import { useRoute } from 'vue-router';
import moment from 'moment';
import axiosClient from '/resources/js/axios';

const route = useRoute()

const staffList = ref([])
const submitted = ref(false)

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
  school_id: ''
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
    school_id: ''
  }
  submitted.value = false
}

const { data: form, fetchData: fetchFormData } = useApi('lesson-request-form/' + route.params.id)
fetchFormData().then(()=>{
  formData.value.school_id = form.value.school.id
  // Fetch school staff from database and add to store
  const { data: staff, fetchData: fetchStaff } = useApi('user-subjects-available/' + form.value.school.id)
  fetchStaff().then(() => {
    staffList.value = staff.value
  })
})


// Function to filter subjects and remove duplicates
const getUniqueSubjects = (item) => {
  const uniqueTitles = new Set();

  return item
    .filter((subject) => {
      // Check if the title is already in the Set, if not, add it and return true
      if (!uniqueTitles.has(subject.subject)) {
        uniqueTitles.add(subject.subject);
        return true;
      }
      return false;
    })
    .map((subject) => subject.subject);
};

// Create a new array of unique subjects
const SubjectsArray = computed(() => {
  if(staffList.value) {
    return getUniqueSubjects(staffList.value);
  } else return []
})

const tutorArray = computed(() => {
    return staffList.value.filter(s => s.subject === formData.value.instrument)
})

function submitForm(){
  axiosClient.post('lesson-request-form/create-public-request', formData.value).then(res => {
    axiosClient.post('email-lesson-request-received').then(res => {
      if(res.data.response === "success"){
        submitted.value = true
      } else {
        console.log(res.data.response.message);
      }
    })
  })
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

</style>
