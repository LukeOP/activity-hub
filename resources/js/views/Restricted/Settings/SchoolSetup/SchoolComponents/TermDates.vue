<template>
    <section>
        <h3>Term Dates:</h3>
        <div class="label-group" style="display: flex;">
            <label>Year
            <select class="form-control editField" v-model="formData.year">
                <option v-for="year in yearSelect" :key="year" :value="year">{{ year }}</option>
            </select>
            </label>
            <label>Number of Terms
            <select class="form-control editField" v-model="numOfTerms">
                <option v-for="term in termSelect" :key="term" :value="term">{{ term }}</option>
            </select>
            </label>
        </div>
        <form @submit.prevent="saveTerms">
            <table id="term-table">
                <tr style="background-color: #3B6580; color: white;">
                <th>Term Description</th>
                <th>Term Start Date</th>
                <th>Term End Date</th>
                </tr>
                <tr v-for="index in parseInt(numOfTerms)" :key="index">
                <td>Term {{ index }}, {{ formData.terms[index - 1].year }}</td>
                <td><input type="date" class="form-control" v-model="formData.terms[index - 1].startDate" required></td>
                <td><input type="date" class="form-control" v-model="formData.terms[index - 1].endDate" required></td>
                </tr>
            </table>
            <button class="btn btn-primary mt-2 float-end">Save {{ formData.year }} Term Dates</button>
        </form>
        {{ currentTermData }}
        {{ formData }}
    </section>
  </template>
  
  <script setup>
  import { ref, watchEffect } from 'vue';
  import { useSchoolStore } from '../../../../../stores/schools';
  import moment from 'moment';
import axiosClient from '../../../../../axios';
  
  const schoolStore = useSchoolStore()
  
  const thisYear = moment().format('YYYY')
  const yearSelect = [
    moment(thisYear, 'YYYY').format('YYYY'),
    moment(thisYear, 'YYYY').add(1, 'years').format('YYYY'),
    moment(thisYear, 'YYYY').add(2, 'years').format('YYYY'),
    moment(thisYear, 'YYYY').add(3, 'years').format('YYYY'),
    moment(thisYear, 'YYYY').add(4, 'years').format('YYYY')
  ]
  
  const termSelect = ['1', '2', '3', '4', '5']
  const numOfTerms = ref(4)
  
  const formData = ref({
    school_id: schoolStore.getSchool.id,
    year: thisYear,
    terms: []
  })
  
  watchEffect(() => {
    formData.value.terms = Array.from({ length: numOfTerms.value}, () => ({
      startDate: '',
      endDate: ''
    }))
  })

  const currentTermData = ref([])
  watchEffect(()=>{
    currentTermData.value = schoolStore.getSchool.data.terms.filter(t => t.year == formData.year)
    console.log(formData.year, currentTermData.value);
  })
  
  function saveTerms() {
    axiosClient.post('school-terms', formData.value).then(res => {
        console.log(res.data);
    })
  }
  
  </script>  

<style lang="scss" scoped>

label {
    width: 100%;
}
.label-group {
    label {
        &:first-of-type {
            margin-right: 1rem;
        }
        &:last-of-type {
            margin-left: 1rem;
        }
    }
}
#term-table {
    margin-top: 2rem;
    tr td, tr th {
        padding: 10px;
    }
    border-bottom: 3px solid $ah-primary;
}
</style>