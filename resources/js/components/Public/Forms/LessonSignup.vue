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

    <form @submit.prevent="">
    
    <section id="contact-details" class="row">
      <h2>Contact Information:</h2>
      <p>{{ form.content.contact_details_content }}</p>
      <div class="col col-12 col-md-6">
        <label>{{ form.field_labels.student_name }}
          <input type="text" class="form-control" v-model="formData.student_name">
        </label>
        <label v-if="form.inputs.student_email">{{ form.field_labels.student_email }}
          <input type="email" class="form-control" v-model="formData.student_email">
        </label>
        <label v-if="form.inputs.student_phone">{{ form.field_labels.student_phone }}
          <input type="number" class="form-control" v-model="formData.student_phone">
        </label>
        <label v-if="form.inputs.student_age">{{ form.field_labels.student_age }}
          <input type="number" class="form-control" v-model="formData.student_age">
        </label>
        <label v-if="form.inputs.student_year">{{form.field_labels.student_year}}
          <input type="text" class="form-control" v-model="formData.student_year">
        </label>
      </div>

      <div class="col col-12 col-md-6">
        <label v-if="form.inputs.pc_name">{{ form.field_labels.pc_name }}
          <input type="text" class="form-control" v-model="formData.pc_name">
        </label>
        <label v-if="form.inputs.pc_phone">{{ form.field_labels.pc_phone }}
          <input type="number" class="form-control" v-model="formData.pc_phone">
        </label>
        <label v-if="form.inputs.pc_email">{{ form.field_labels.pc_email }}
          <input type="email" class="form-control" v-model="formData.pc_email">
        </label>
      </div>
    </section>
    
    <section id="lesson-details" class="row">
      <h2>Lesson Information:</h2>
      <p>{{ form.content.lesson_details_content }}</p>
      <div class="col col-12 col-md-6">
        <label>{{ form.field_labels.instrument }}
          <select class="form-control" v-model="formData.instrument">
            <option value=""></option>
          </select>
        </label>
        <label v-if="form.inputs.tutor">{{ form.field_labels.tutor }}
          <select class="form-control" v-model="formData.tutor">
            <option value=""></option>
          </select>
        </label>
        <label v-if="form.inputs.type">{{ form.field_labels.lesson_type }}
          <select class="form-control" v-model="formData.funding_type">
            <option value=""></option>
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
      <input type="submit" class="btn btn-primary" value="Send Request">
    </section>

  </form>
    
    <section id="footer">
      <p>{{ form.content.footer_content }}</p>
    </section>
    
    <!-- <pre>{{ form }}</pre> -->
    <!-- <pre>{{ route.params.id }}</pre> -->
  </div>
</template>

<script setup>
import { ref } from 'vue';
import useApi from '/resources/js/composables/useApi';
import { useRoute } from 'vue-router';

const route = useRoute()

const formData = ref({
  student_name: '',
  student_email: '',
  student_phone: '',
  student_age: '',
  student_year: '',
  pc_name: '',
  pc_email: '',
  pc_phone: '',
  instrument: '',
  tutor: '',
  funding_type: '',
  experience: '',
})

const { data: form, fetchData: fetchFormData } = useApi('lesson-request-form/' + route.params.id)
fetchFormData()
let primary = '#abc123'

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

</style>