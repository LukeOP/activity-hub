<template>
  <h1>Your Profile:</h1>
  
  <div class="row">
  <div class="col col-12 col-md-4 d-flex align-items-center" id="user-image-container">
    <img v-if="userImage" id="user-img" :src="userImage" alt="Profile Image">
    <img v-else id="user-img" src="/storage/userImages/user_256.png" alt="Profile Image">
  </div>
  <div class="col col-12 col-md-8 d-flex flex-column justify-content-center">
    <div class="heading">Name: <span class="data">{{user.user.first_name}} {{user.user.last_name}}</span></div>
    <div class="heading">Email: <span class="data">{{user.user.email}}</span></div>
  </div>
  <div class="col col-12 col-md-8">
    <div class="heading">Associated Schools:</div>
    <div v-for="school in user.user.schools" :key="school.id">{{school.name}} <span class="admin" v-if="isAdmin(school)">{{isAdmin(school)}}</span><br></div>
  </div>
</div>


  
  <!-- <pre>
    {{user}}
  </pre> -->
</template>

<script>
import { ref } from 'vue'
import { useUserStore } from '../../../../stores/user'
export default {
  setup(){
    const user = useUserStore()
    const userImage = ref(null)

    function getUserImage(){
      let path = '/storage/userImages/'
      if(user.user.image != 'user.png'){
        userImage.value = path + user.user.image
      }
    }
    getUserImage()

    function isAdmin(school){
      if(user.permissions.find(p => p.school_id == school.id && p.type === 'administrator')) {
        return 'Admin'
       } 
      return null
    }

    return {
      user, userImage, isAdmin
    }
  }

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