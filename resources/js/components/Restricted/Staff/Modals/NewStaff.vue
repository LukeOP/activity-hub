<template>
  <div>
    <div class="text-center">{{currentSchool.name}}</div>
    <h2 class="text-center mb-3">Invite New Staff Member</h2>
    <form class="d-flex justify-content-center w-100" style="flex-wrap:wrap" @submit.prevent="handleInvite">
      <p class="text-center">Send an email invitation to link a new staff member with {{currentSchool.name}}.<br>
      You will be able to track the invitation status on the Staff list page.</p>
      <input type="text" class="invite-field text-center" placeholder="Reference... (e.g., Name...)" v-model="formData.reference" required>
      <input type="email" class="invite-field text-center"
      placeholder="Email..." v-model="formData.email" required>
      <button class="form-control mt-1 btn btn-secondary">Send Invitation</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import axiosClient from "../../../../axios";
import { useModalStore } from "../../../../stores/modal";
import { useSchoolStore } from "../../../../stores/schools";
import { useStaffStore } from "../../../../stores/staff";

const schoolStore = useSchoolStore()
const currentSchool = schoolStore.getSchool
const staffStore = useStaffStore()
const modal = useModalStore()

const formData = ref({
  reference: '',
  email: '',
  school_id: currentSchool.id
})

function handleInvite(){
  axiosClient.post('school-invitations', formData.value).then(res =>{
    staffStore.updateSchoolInvites(res.data.data.school_id)
    modal.close()
  })
}


</script>

<style lang="scss" scoped>
.invite-field {
  background: #EFF2F5;
  width: 350px;
  max-width: 100%;
  padding: 10px;
  border-radius: 3rem;
  border: none;
  margin-bottom: 1rem;
}
h2 {
  padding-bottom: 1rem;
  border-bottom: 2px solid $ah-primary;
}
button {
  width: 350px;
  max-width: 100%;
}
</style>