<template>
    <section>
      <hr>
        <h3 style="width: 100%;">Term Dates:</h3>
        <label style="display: flex;">Year
          <select class="form-control editField" v-model="formData.year">
              <option v-for="year in [thisYear, nextYear]" :key="year" :value="year">{{ year }}</option>
          </select>
        </label>
        <form @submit.prevent="saveTerms">
            <table id="term-table">
                <tr style="background-color: #3B6580; color: white;">
                  <th>Term Description</th>
                  <th>Term Start Date</th>
                  <th>Term End Date</th>
                </tr>
                <tr v-for="index in parseInt(numOfTerms)" :key="index">
                  <td>Term {{ index }}, {{ formData.terms[index - 1].year }}</td>
                  <td><input type="date" class="form-control" v-model="formData.terms[index - 1].start_date" :min="formData.terms[index - 2] ? formData.terms[index - 2].end_date : thisYear + '-01-01'" required></td>
                  <td><input type="date" class="form-control" v-model="formData.terms[index - 1].end_date" :min="formData.terms[index - 1].start_date"required></td>
                </tr>
            </table>
            <button class="btn btn-primary mt-2 float-end">Save {{ formData.year }} Term Dates</button>
        </form>
        <!-- <pre>
          {{ currentTermData }}
        </pre>
        {{ formData }} -->
    </section>
  </template>
  
  <script setup>
  import { ref, watchEffect } from 'vue';
  import { useSchoolStore } from '../../../../../stores/schools';
  import moment from 'moment';
  import axiosClient from '../../../../../axios';
import useApi from '../../../../../composables/useApi';
  
  const schoolStore = useSchoolStore()
  
  const thisYear = moment().format('YYYY')
  const nextYear = moment(thisYear, 'YYYY').add(1, 'years').format('YYYY')
  
  const numOfTerms = ref(4)
  
  const formData = ref({
    school_id: schoolStore.getSchool.id,
    year: thisYear,
    terms: []
  })
  
  watchEffect(() => {
    formData.value.terms = Array.from({ length: numOfTerms.value}, () => ({
      start_date: '',
      end_date: ''
    }))
  })

  const currentTermData = ref([])
  watchEffect(()=>{
    currentTermData.value = schoolStore.getSchool.data.terms.filter(t => t.year == formData.value.year)
    if(currentTermData.value.length > 0) populateTermData(currentTermData.value)
    else formData.value.terms = [{ "start_date": "", "end_date": "" }, { "start_date": "", "end_date": "" }, { "start_date": "", "end_date": "" }, { "start_date": "", "end_date": "" } ]
  })

  function populateTermData(data){
    data.forEach(term => {
      let index = term.description.split(" ")[1]
      setSingleTermData(term, index)
    });
  }

  function setSingleTermData(data, index){
    formData.value.terms[index -1].start_date = data.start_date
    formData.value.terms[index -1].end_date = data.end_date
  }
  
  function saveTerms() {
    const {data, loading, fetchData} = useApi('school-terms', formData.value, 'POST', true)
    fetchData().then(() => {
      schoolStore.updateSchool(data.value.data)
    })
  }
  
  </script>  

<style lang="scss" scoped>
label {
  width: 25%;
  margin-bottom: 1rem;
  align-items: center;
  select {
    margin-left: 1rem;
  }
}
#term-table {
    tr td, tr th {
        padding: 10px;
    }
    border-bottom: 3px solid $ah-primary;
}
</style>