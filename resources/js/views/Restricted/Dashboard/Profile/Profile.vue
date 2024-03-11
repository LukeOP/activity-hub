<template>
<div>
  <HeaderLine :heading="user.attributes.first_name + ' ' + user.attributes.last_name + ' Profile'" />
  
  <div class="d-flex mb-3">
    <!-- <div class="justify-content-center" id="user-image-container">
      <div id="user-img" @click="handleProfile">
        <span id="icon-text">{{initials}}</span>
      </div>
    </div> -->
    <div class="mt-2">
      <h2 class="text-primary">Your Details:</h2>
      <div class="heading">Name: <span class="data">{{user.attributes.first_name}} {{user.attributes.last_name}}</span></div>
      <div class="heading">Email: <span class="data">{{user.attributes.email}}</span></div>
      <div class="heading">Phone: <span class="data">{{user.attributes.phone}}</span></div>
    </div>
  </div>
  <div>
    <div class="col col-12 col-md-8">
      <h2 class="text-primary mt-2">Associated Schools:</h2>
      <div v-for="school in user.attributes.schools" :key="school.id">{{school.name}} <span class="admin" v-if="isAdmin(school)">{{isAdmin(school)}}</span><br></div>
      <button class="btn btn-secondary" @click="handleInviteCodeClick">Use school invite code</button>
    </div>
  </div>
</div>
  
</template>

<script setup>
import { computed, ref } from 'vue'
import { useModalStore } from '../../../../stores/modal'
import { useUserStore } from '../../../../stores/user'

import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'

const user = useUserStore()
const modal = useModalStore()

const initials = computed(()=>{
  if(user.attributes.first_name) return getFirstLetter(user.attributes.first_name) + getFirstLetter(user.attributes.last_name)
  return ''
})

function getFirstLetter(string){
  return string[0]
}

function isAdmin(school){
  if(user.permissions.find(p => p.school_id == school.id && p.type === 'Administrator')) {
    return 'Admin'
    } 
  return null
}

function handleInviteCodeClick(){
  modal.open('InviteCodeEntry')
}
</script>

<style lang="scss" scoped>
.heading {
  font-weight: bold;
}
.data {
  font-weight: 400;
}
#user-image-container {
  min-width: 220px;
  justify-content: center;
  #user-img {
    height: 150px;
    width: 150px;
    border-radius: 50%;
  }
}

#user-img {
  border-radius: 50%;
  cursor: pointer;
  background: $ah-primary;
}
#icon-text {
  display: block;
  position: relative;
  font-size: 6rem;
  width: 100%;
  color: white;
  text-align: center;
  top: 50%;
  transform: translateY(-50%);
}
.admin {
  color: red;
  margin-left: 1rem;
  border: 1px solid red;
  padding: 0px 5px;
}
/* Styles for mobile */
@media (max-width: 768px) {
  #user-image-container {
    display: flex;
    justify-content: center;
  }
}
</style>