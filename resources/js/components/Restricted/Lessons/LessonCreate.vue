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
  
  <form v-if="!loading" @submit.prevent="">
    <div class="row">
      <div class="col col-12 col-sm-6">
        <label>Student:</label>
        <select name="studentName" class="form-control" required v-model="formData.student">
          <option v-for="student in data.students" :key="student.id" :value="student.id">{{student.first_name}} {{student.last_name}}</option>
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
        <input type="button" class="btn btn-primary form-control" value="Create Lesson" @click="handleSubmit">
      </div>
    </div>
    

  </form>
</div>
  
</template>

<script>
import { ref, watch, watchEffect } from 'vue'
import useApi from '../../../composables/useApi'
import { useUserStore } from '../../../stores/user'
import useSorter from '../../../composables/useSorter'
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue'

export default {
  components: {
    HeaderLine
  },
  setup() {
    const user = useUserStore()
    const sorter = useSorter()
    const schools = ref(user.permissions.filter(p => p.type === 'administrator'))
    const loading = ref(true)
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

        const { data: students, error: errorStudents, loading: loadingStudents, fetchData: fetchStudents } = useApi('school-students/' + school)
        const { data: tutors, error: errorUsers, loading: loadingUsers, fetchData: fetchTutors } = useApi('school-users/' + school)

        Promise.all([fetchStudents(), fetchTutors()]).then(() => {
          data.value.students = students
          data.value.tutors = tutors

          sorter.sort(students.value, 'last_name')

          loading.value = false
        })
      }
    })
    
    if(schools.value.length > 0){
      formData.value.school = schools.value[0].school_id
    }

    function handleSubmit(){
      console.log(formData.value)
    }

    return {
      data, 
      formData,
      schools, 
      loading, 
      handleSubmit
      }
    
  }

}
</script>

<style>

</style>