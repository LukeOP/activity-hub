<template>
<div>
  <HeaderLine heading="Create Lesson" />
  <div class="row" v-if="schools.length > 0">
    <div class="col col-12 col-md-6">
      <label>School:</label>
      <select name="school" class="form-control" v-model="formData.school" required>
        <option v-for="school in schools" :key="school.id" :value="school.school_id">{{school.name}}</option>
      </select>
    </div>
  </div>
  <div v-else>You must be an administrator to create lessons</div>
  
  <form v-if="!loading" @submit.prevent="handleSubmit">
    <div class="row">
      <div class="col col-12 col-sm-6">
        <label>Student:</label>
        <select name="studentName" class="form-control" required v-model="formData.student">
          <option v-for="student in data.students" :key="student.id" :value="student.id">{{student.last_name}}, {{ student.first_name }}
              <span v-if="student.year_level || student.tutor_group">(
                <span v-if="student.year_level">Year {{ student.year_level }}</span>
                <span v-if="student.year_level || student.tutor_group">,</span>
                <span v-if="student.tutor_group"> Tutor {{ student.tutor_group }}</span>
              )</span>
          </option>
        </select>
      </div>

      <div class="col col-12 col-sm-6">
      </div>

    </div>

    <div class="row">
      <div class="col col-12 col-sm-6">
        <label>Tutor:</label>
        <select name="tutorName" class="form-control" required v-model="formData.tutor">
          <option v-for="tutor in data.tutors" :key="tutor.id" :value="tutor">{{tutor.first_name}} {{tutor.last_name}}</option>
        </select>
      </div>
      <div class="col col-12 col-sm-6" v-if="formData.tutor">
        <label>Instrument:</label>
        <select name="tutorName" class="form-control" required v-model="formData.instrument">
          <option v-for="subject in formData.tutor.subjects" :key="subject.title" :value="subject.title">{{subject.title}}</option>
        </select>
      </div>  
    </div>

    <div class="row">
      <div class="col col-12 col-sm-6 mt-3">

      <button type="submit" aria-label="submit" class="form-control btn btn-primary" :disabled="submitting">Create Lesson
        <LoadingSpinner :isLoading="submitting" />
      </button>
      </div>
    </div>
    

  </form>
  <LoadingSpinner :isLoading="loading" :loadingText="true" color="primary" />
</div>
  
</template>

<script setup>
import { ref, watch, watchEffect } from 'vue'
import useApi from '../../../composables/useApi'
import { useUserStore } from '../../../stores/user'
import useSorter from '../../../composables/useSorter'
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import axiosClient from '/resources/js/axios'
import router from '/resources/js/router/router'
import LoadingSpinner from '../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue'

  const user = useUserStore()
  const sorter = useSorter()
  const schools = ref(user.permissions.filter(p => p.type === 'Administrator'))
  const loading = ref(false)
  const submitting = ref(false)
  const data = ref({
    students: null,
    tutors: null,
  })

  const formData = ref({
    school: "",
    student: "",
    tutor: "",
    instrument: ""
  })

  watchEffect(() => {
    const school = formData.value.school

    if (school) {
      loading.value = true

      const { data: students, fetchData: fetchStudents } = useApi('school-students/' + school)
      const { data: tutors, fetchData: fetchTutors } = useApi('school-users/' + school)

      Promise.all([fetchStudents(), fetchTutors()]).then(() => {
        data.value.students = students.value.data
        data.value.tutors = tutors.value.data

        sorter.sort(data.value.students, 'last_name')

        loading.value = false
      })
    }
  })
  
  if(schools.value.length > 0){
    formData.value.school = schools.value[0].school_id
  }

  function handleSubmit(){
    submitting.value = true
    const {fetchData} = useApi('lessons', {student_id: formData.value.student, instrument: formData.value.instrument, user_id: formData.value.tutor.id}, 'POST', true)
    fetchData().then(()=>{
      submitting.value = false
      router.push({
        name: 'LessonsList'
      })
    })
  }
</script>

<style>

</style>