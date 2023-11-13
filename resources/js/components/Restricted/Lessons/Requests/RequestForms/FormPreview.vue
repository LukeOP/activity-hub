<template>
  <div class="container" v-if="formData">
    <HeaderLine heading="Form Preview" link1="Back to Details" @link1="backToDetails"/>
    <section id="header" class="row">
      <img v-if="formData.logo_cb" id="logo-img" :src="formData.logo" :alt="formData.school_name + ' logo'">
      <img v-else id="logo-img" src="/images/ActivityHub_Logo_Main.png" alt="Activity Hub Logo">
      <span id="header-span" >
        <h1 id="heading">{{ formData.heading }}</h1>
        <h2 id="school-name" v-if="formData.school_name_cb">{{ formData.school_name }}</h2>
        <p v-if="formData.header_content_cb">{{ formData.header_content }}</p>
      </span>
    </section>
    
    <form @submit.prevent="">
      
      <section id="contact-details" class="row">
      <h2>Contact Information:</h2>
      <p v-if="formData.contact_content_cb">{{ formData.contact_content }}</p>
      <div class="col col-12 col-md-6">
        <label>{{ formData.student_name }}
          <input type="text" class="form-control" v-model="inputData.student_name">
        </label>
        <label v-if="formData.student_email_cb">{{ formData.student_email }}
          <input type="email" class="form-control" v-model="inputData.student_email">
        </label>
        <label v-if="formData.student_phone_cb">{{ formData.student_phone }}
          <input type="number" class="form-control" v-model="inputData.student_phone">
        </label>
        <label v-if="formData.student_age_cb">{{  formData.student_age }}
          <input type="number" class="form-control" v-model="inputData.student_age">
        </label>
        <label v-if="formData.student_year_cb">{{  formData.student_year }}
          <input type="text" class="form-control" v-model="inputData.student_year">
        </label>
      </div>
      
      <div class="col col-12 col-md-6">
        <label v-if="formData.pc_name_cb">{{ formData.pc_name }}
          <input type="text" class="form-control" v-model="inputData.pc_name">
        </label>
        <label v-if="formData.pc_phone_cb">{{ formData.pc_phone }}
          <input type="number" class="form-control" v-model="inputData.pc_phone">
        </label>
        <label v-if="formData.pc_email_cb">{{ formData.pc_email }}
          <input type="email" class="form-control" v-model="inputData.pc_email">
        </label>
      </div>
    </section>
    
    <section id="lesson-details" class="row">
      <h2>Lesson Information:</h2>
      <p v-if="formData.lesson_content_cb">{{ formData.lesson_content }}</p>
      <div class="col col-12 col-md-6">
        <label>{{ formData.instrument }}
          <select class="form-control" v-model="inputData.instrument">
            <option v-for="instrument in SubjectsArray" :key="instrument" :value="instrument">{{ instrument }}</option>
          </select>
        </label>
        <label v-if="formData.tutor_cb">{{ formData.tutor }}
          <select class="form-control" v-model="inputData.tutor">
            <option v-for="staff in tutorArray" :key="staff" :value="staff.tutor.id">{{ staff.tutor.full_name }}</option>
          </select>
        </label>
        <label v-if="formData.funding_type_cb">{{ formData.funding_type }}
          <select class="form-control" v-model="inputData.funding_type">
            <option value=""></option>
          </select>
        </label>
      </div>
      <div class="col col-12 col-md-6">
        <label v-if="formData.experience_cb">{{ formData.experience }}
          <textarea rows="5" class="form-control" v-model="inputData.experience"></textarea>
        </label>
      </div>
    </section>
    
    <section id="footer">
      <p v-if="formData.footer_content_cb">{{ formData.footer_content }}</p>
    </section>

    <section>
      <input type="submit" class="btn btn-primary submit-btn" value="Send Request" disabled>
    </section>
    
  </form>
  
  <!-- <pre>{{ staff }}</pre> -->
  <!-- <pre>{{ SubjectsArray }}</pre> -->
  <!-- <pre>{{ formData }}</pre> -->
  <!-- <pre>{{ route.params.id }}</pre> -->
</div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useLessonsStore } from '/resources/js/stores/lessons';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import useApi from '/resources/js/composables/useApi';
import { useStaffStore } from '/resources/js/stores/staff';
import { computed, ref } from 'vue';

const lessonStore = useLessonsStore()
const staffStore = useStaffStore()
const router = useRouter()

const formData = lessonStore.getFormPreview
const inputData = ref({
  student_name: '',
  student_email: '',
  student_phone: null,
  student_age: null,
  student_year: null,
  pc_name: '',
  pc_email: '',
  pc_phone: null,
  instrument: '',
  tutor: '',
  funding_type: '',
  experience: ''
})

// Fetch school staff from database and add to store
const { data: staff, fetchData: fetchStaff } = useApi('user-subjects-available/' + lessonStore.getRequestForm.school.id)
fetchStaff().then(() => {
  staffStore.setStaffList(staff.value)
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
  if(staff.value) {
    return getUniqueSubjects(staff.value);
  } else return []
})

const tutorArray = computed(() => {
  return staffStore.getStaffList.filter(s => s.subject === inputData.value.instrument)
})


function backToDetails(){
  router.push({
    name: 'RequestFormDetails'
  })
}

</script>

<style lang="scss" scoped>
#back-btn {
  color: $ah-primary;
  margin-top: 10px;
  &:hover {
    color: $ah-primary-dark;
    cursor: pointer;
  }
}
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
.submit-btn {
  width: 150px;
  float:right;
  margin-bottom: 3rem;
}

</style>