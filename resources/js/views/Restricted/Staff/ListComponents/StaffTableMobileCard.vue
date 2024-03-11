<template>
  <div class="row" :class="{active: active}" @click="active = !active">
    <div class="col col-6">
      <p>{{staff.full_name}}</p>
    </div>
    <div class="col col-4">
      <p>{{isAdmin(staff)}}</p>
    </div>
    <div class="col col-2">
      <i class="fa-solid fa-magnifying-glass ms-2" :class="{active: active}" @click="StaffDetails"></i>
    </div>
  </div>
</template>

<script setup>
import moment from "moment"
import { useStaffStore } from "/resources/js/stores/staff"
import { ref } from "vue"
import { useRouter } from "vue-router"
const props = defineProps({staff:Object})

const router = useRouter()
const staffStore = useStaffStore()

const active = ref(false)

function StaffDetails(){
  staffStore.setStaff(props.staff)
  router.push({
    name: 'StaffDetails'
  })
}

function isAdmin(member){
  return member.permissions.find(m => m.type === 'Administrator') ? 'Admin' : ''
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