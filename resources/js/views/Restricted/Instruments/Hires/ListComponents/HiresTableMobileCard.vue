<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-10">
      <p>{{hire.instrument.attributes.name}}</p>
      <p>{{hire.student.full_name}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="HireDetails"></i>
    </div>
    <p v-if="active">Started: {{formatDate(hire.attributes.start_date)}}</p>
    <p v-if="active">Expected Return: {{formatDate(hire.attributes.return_date)}}</p>
  </div>
</template>

<script setup>
import moment from "moment";
import { ref } from "vue"
import { useRouter } from "vue-router"
import { useHireStore } from "../../../../../stores/hires";
const props = defineProps({hire:Object})

const hireStore = useHireStore()

const router = useRouter()
const active = ref(false)

function formatDate(date){
  return moment(date).format('MMMM Do, YYYY')
}

function HireDetails(){
  hireStore.setHire(props.hire)
  router.push({
    name: 'HireDetails'
  })
}

</script>

<style lang="scss" scoped>

.fa-magnifying-glass {
  color: $ah-primary;
  padding: 5px;
  border: 1px solid $ah-primary;
  border-radius: 6px;
  margin-top: 7px;
}
.row {
  padding: 10px;
}
.active {
  background-color: $ah-primary-light;
  color: lighten($ah-primary-light, 50%);
  border-bottom: 1px solid $ah-grey;
  .fa-magnifying-glass {
    border-color: lighten($ah-primary-light, 50%);
  }
}
p {
  margin: 0;
}


</style>