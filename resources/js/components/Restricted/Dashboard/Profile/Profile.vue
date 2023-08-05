<template>
<div>
  <h1>Your Profile:</h1>
  
  <div class="row">
    <div class="col col-12 col-md-4 d-flex align-items-center" id="user-image-container">
      <div id="user-img" @click="handleProfile">
        <span id="icon-text">{{initials}}</span>
      </div>
    </div>
    <div class="col col-12 col-md-8 d-flex flex-column justify-content-center">
      <div class="heading">Name: <span class="data">{{user.attributes.first_name}} {{user.attributes.last_name}}</span></div>
      <div class="heading">Email: <span class="data">{{user.attributes.email}}</span></div>
    </div>
    <div class="col col-12 col-md-8">
      <div class="heading">Associated Schools:</div>
      <div v-for="school in user.attributes.schools" :key="school.id">{{school.name}} <span class="admin" v-if="isAdmin(school)">{{isAdmin(school)}}</span><br></div>
    </div>
  </div>
</div>
  
</template>

<script setup>
import { computed, ref } from 'vue'
import { useUserStore } from '../../../../stores/user'

const user = useUserStore()

const initials = computed(()=>{
  if(user.attributes.first_name) return getFirstLetter(user.attributes.first_name) + getFirstLetter(user.attributes.last_name)
  return ''
})

function getFirstLetter(string){
  return string[0]
}

function isAdmin(school){
  if(user.permissions.find(p => p.school_id == school.id && p.type === 'administrator')) {
    return 'Admin'
    } 
  return null
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
    height: 200px;
    width: 200px;
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
  font-size: 8rem;
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