<template>
<div>
  <HeaderLine heading="Profile Information" />
  
  <section id="details" class="d-flex mb-3">
    <!-- <div class="justify-content-center" id="user-image-container">
      <div id="user-img" @click="handleProfile">
        <span id="icon-text">{{initials}}</span>
      </div>
    </div> -->
    <div class="mt-2">
      <h2 class="text-primary">Your Details:</h2>
      <h3 class="heading">Name: </h3><span>{{user.attributes.first_name + ' ' + user.attributes.last_name}}</span><br/>
      <h3 class="heading">Login Email: </h3><span class="data">{{user.attributes.email}}</span><br/>
      <h3 class="heading">Phone: </h3><span class="data">{{user.attributes.phone}}</span>
    </div>
  </section>

  <section id="schools">
    <div class="col col-12">
      <h2 class="text-primary mt-2">Associated Schools:</h2>
      <div class="associated-schools">
        <div v-for="school in user.attributes.schools" :key="school.id" class="associated-school user-element">
          <div class="school-logo"><img :src="school.logo" /></div>
          <div class="school-details">
            <div class="school-name">{{school.name}}</div> 
            <div class="admin-flag" v-if="isAdmin(school)">{{isAdmin(school)}}</div>
          </div>
          <!-- <i class="fa-solid fa-trash"></i> -->
        </div>
      </div>
      <!-- <div class="add-school user-element" style="color: #FCFCFC;" @click="handleInviteCodeClick">Use school invite code</div> -->
    </div>
    <hr>
  </section>

  <section id="notifications">
    <h2 class="text-primary mt-2">In-App Notification Preferences</h2>
    <span>(In Development)</span>
    <NotificationPreferences />
  </section>

</div>
  
</template>

<script setup>
import { computed, ref } from 'vue'
import { useModalStore } from '../../../stores/modal'
import { useUserStore } from '../../../stores/user'

import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue'
import NotificationPreferences from './Notifications/NotificationPreferences.vue'
import { useActionsStore } from '../../../stores/actions'

const user = useUserStore()
const modal = useModalStore()
const actions = useActionsStore()

actions.setItems([
  { header: 'Use School Code', to: { name: 'Profile' }, modal: 'InviteCodeEntry', icon: 'fa-solid fa-plus'}
])

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

</script>

<style lang="scss" scoped>
.heading {
  font-weight: bold;
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
.associated-schools {
  display: flex;
  .associated-school {
    display: flex;
    min-height: 50px;
    min-width: 200px;
    width: 100%;
    max-width: 400px;
    margin-bottom: 1rem;
    margin-right: 1rem;
    .school-logo {
      width: 100px;
      img {
        width: 100%;
      }
    }
    .school-details {
      padding: 10px;
      flex-grow: 1;
    }
    .fa-trash {
      color: $ah-grey;
      padding: 10px;
      height: fit-content;
      &:hover {
        color: $ah-red;
        cursor: pointer;
      }
    }
  }
}
.add-school {
  min-height: fit-content;
  min-width: 200px;
  width: 100%;
  max-width: 400px;
  margin-bottom: 1rem;
  margin-right: 1rem;
  background-color: $ah-primary;
  color: white;
  text-align: center;
  &:hover {
    background-color: $ah-primary-dark;
    cursor: pointer;
  }
}

/* Styles for mobile */
@media (max-width: 768px) {
  #user-image-container {
    display: flex;
    justify-content: center;
  }
  .associated-schools {
    display:block;
  }
}
</style>