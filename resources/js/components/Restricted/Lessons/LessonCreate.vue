<template>
<div>
  <h1>Create Lesson</h1>
  <form v-if="!loadingStudents && !loadingUsers">
    <div class="row">
      <div class="col col-12 col-sm-6">
        <label>Student Name:</label>
        <select name="studentName" class="form-control">
          <option v-for="student in students.data" :key="student.id" :value="student.id">{{student.first_name}} {{student.last_name}}</option>
        </select>
        <label>Tutor:</label>
        <select name="studentName" class="form-control">
          <option v-for="tutor in tutors.data" :key="tutor.id" :value="tutor.id">{{tutor.first_name}} {{tutor.last_name}}</option>
        </select>
      </div>
      <div class="col col-12 col-sm-6">
      </div>
    </div>
    <pre>
      {{tutors}}
    </pre>

  </form>
</div>
  
</template>

<script>
import useApi from '../../../composables/useApi'

export default {
  setup() {
    const { data: students, error: errorStudents, loading: loadingStudents, fetchData: fetchStudents } = useApi('students')
    fetchStudents()
    const { data: tutors, error: errorUsers, loading: loadingUsers, fetchData: fetchTutors } = useApi('users')
    fetchTutors()

    return { students, loadingStudents, tutors, loadingUsers }
    
  }

}
</script>

<style>

</style>