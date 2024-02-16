<template>
  <div>
    <section id="table-header-section">
      <table>
        <thead>
          <tr>
            <th>Hirer:</th>
            <th>Hire Date:</th>
            <th>Expected Return:</th>
            <th>Returned:</th>
            <th>Form Signed:</th>
          </tr>
        </thead>
      </table>
    </section>

    <section id="table-body-section" style="overflow-y:auto" v-if="hires.length > 0">
      <table>
        <tbody>
          <tr v-for="hire in hires" :key="hire.id" @click="viewHire(hire)">
            <td>{{ hire.student.full_name }}</td>
            <td>{{ formatDate(hire.attributes.start_date) }}</td>
            <td>{{ formatDate(hire.attributes.return_date) }}</td>
            <td>{{ formatDate(hire.attributes.returned_date) }}</td>
            <td>{{ hire.attributes.upload_id == null ? 'No' : 'Yes' }}</td>
          </tr>
        </tbody>
      </table>
    </section>

  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useHireStore } from '/resources/js/stores/hires';
import moment from 'moment';

const hireStore = useHireStore()
const router = useRouter()

const props = defineProps({hires:Array})

function formatDate(date){
  let formattedDate = moment(date).format('MMM Do, YYYY');
  if(formattedDate != 'Invalid date'){
    return formattedDate
  } return '-'
}

function viewHire(hire){
  hireStore.setHire(hire)
  router.push({
    name: 'HireDetails'
  })
}

</script>

<style lang="scss" scoped>

</style>