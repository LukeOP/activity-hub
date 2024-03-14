<template>
<div style="text-align:center">
  <h2 class="text-red"> Delete {{staff.getSubject.title}}?</h2>
  <p>{{staff.getSubject.title}} will be removed from {{staff.getStaff.first_name}}'s assignable lessons at {{staff.getSubject.school.name}}.</p>
  <div>
    <button class="btn btn-grey" @click="cancel">Cancel</button>
    <button class="btn btn-red ms-3" @click="deleteSubject">Delete</button>
  </div>
</div>
  
</template>

<script setup>
import axiosClient from "../../../../../axios";
import { useModalStore } from "../../../../../stores/modal";
import { useStaffStore } from "../../../../../stores/staff";

const staff = useStaffStore()
const modal = useModalStore()

function deleteSubject(){
  axiosClient.delete('user-subjects/' + staff.getSubject.id).then(()=>{
    let subjectIndex = staff.getStaff.subjects.findIndex(s => s.id === staff.getSubject.id)
    staff.getStaff.subjects.splice(subjectIndex, 1)
    modal.close()
  })
}
function cancel(){
  modal.close()
}

</script>

<style lang="scss" scoped>
.subject {
  font-weight: bold;
  color: $ah-primary;
}

</style>