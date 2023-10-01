<template>
  <div class="row" :class="{active: active}" @click="active = !active">    
    <div class="col col-7">
      <p>{{student.full_name}}</p>
    </div>
    <div class="col col-3">
      <p v-if="!active">{{abbreviate(student.school.name)}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass" :class="{active: active}" @click="StudentDetails"></i>
    </div>
    
    <p v-if="active">School: {{student.school.name}}</p>
  </div>
</template>

<script setup>
import moment from "moment"
import { ref } from "vue"
import { useRouter } from "vue-router"
import useAbbreviator from '/resources/js/composables/useAbbreviator'
import { useStudentStore } from "/resources/js/stores/students"
const props = defineProps({student:Object})

const router = useRouter()
const { abbreviate } = useAbbreviator()
const studentStore = useStudentStore()

const active = ref(false)

function StudentDetails(){
  studentStore.setStudent(props.student)
  router.push({
    name: 'StudentDetails'
  })
}

</script>

<style lang="scss" scoped>

.fa-magnifying-glass {
  color: $ah-primary;
  padding: 5px;
  border: 1px solid $ah-primary;
  border-radius: 6px;
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