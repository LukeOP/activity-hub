<template>
    <div class="hire-card" :class="{deleted: hire.timestamps.deleted != null}" @click="goToHire">
      <div class="row">
        <div class="col col-6">
          <div id="instrument-name">{{ hire.instrument.attributes.name }}</div>
          <div>Hired: {{ formatDate(hire.attributes.start_date) }}</div>
        </div>
        <div class="col col-6 text-end">
          <div :class="{overdue: overDueDate(hire.attributes.return_date)}">Expected Return: {{ formatDate(hire.attributes.return_date) }}</div>
          <div>Form Signed: {{ hire.attributes.form_signed == 0 ? 'No' : 'Yes' }}</div>
        </div>
      </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useHireStore } from '/resources/js/stores/hires';
import moment from 'moment';

const props = defineProps({hire:Object})
const router = useRouter()
const hireStore = useHireStore()

function formatDate(date){
  return moment(date).format('DD MMM YYYY')
}

function overDueDate(date){
  return moment(date).isBefore(moment())
}

function goToHire(){
  hireStore.setHire(props.hire)
  router.push({
    name: 'HireDetails'
  })
}

</script>

<style lang="scss" scoped>
.hire-card {
  min-height: 50px;
  padding: 10px;
  border: 1px solid $ah-grey;
  border-left: 5px solid $ah-primary;
  border-radius: 0.25rem;
  margin-bottom: 0.5rem;
  &:hover {
    cursor: pointer;
    border-color: $ah-primary-light;
    box-shadow: 5px 5px 10px $ah-primary-background;
  }
}
#instrument-name {
  font-size: 1.25rem;
  color: $ah-primary-dark;
}
.overdue {
  color: red;
}
.deleted {
  background-color: lighten($ah-grey-background, 2%);
  border: 1px solid $ah-red;
  border-left: 5px solid $ah-red;
  &:hover {
    box-shadow: 5px 5px 10px $ah-primary-background;
    border-color: $ah-grey-light;
  }
}

</style>