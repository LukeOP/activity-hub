<template>
  <div v-if="!hideMenu" id="profile-container" @mouseenter="showDropDown = true" @mouseleave="showDropDown = false">
    <img v-if="userImage" id="user-img" :src="userImage" alt="Profile Image" @click="handleProfile">
    <img v-else id="user-img" src="/storage/userImages/user.png" alt="Profile Image" @click="handleProfile">
    <div id="profile-drop-down" v-if="showDropDown">
      <div class="drop-down-item" @click="handleProfile">Profile</div>
      <div class="drop-down-item" @click="handleLogout">Log Out</div>
    </div>
  </div>
</template>

<script>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRouter } from 'vue-router'
import { useWindowSize } from '../../../composables/useWindowSize'
export default {
  setup(){
    const router = useRouter()
    const user = useUserStore()
    const userImage = ref(null)
    const showDropDown = ref(false)
    const windowSize = useWindowSize()

    function getUserImage(){
      let path = '/storage/userImages/'
      if(user.user.image != 'user.png'){
        userImage.value = path + user.user.image
      }
    }
    getUserImage()

    function handleProfile(){
      router.push({
        name: 'Profile',
        params: {
          id: user.user.id
        }
      })
    }

    function handleLogout(){
      user.logout().then(()=>{
        router.push({
          name: 'home'
        })
      })
    }

    const hideMenu = ref(true)
    if(windowSize.value.width > 768) hideMenu.value = false
    
    watch(windowSize,(newSize, oldSize) => {
      if(newSize.width > 768) hideMenu.value = false
      else hideMenu.value = true
    })

    

    return { userImage, showDropDown, handleProfile, handleLogout, hideMenu }
  }

}
</script>

<style lang="scss" scoped>
    #user-img {
      position: absolute;
      height: 40px;
      width: 40px;
      top: 10px;
      right: 40px;
      border-radius: 50%;
      cursor: pointer;
    }
    #profile-drop-down {
      position: absolute;
      right: 20px;
      top: 50px;
      width: 130px;
      min-height: fit-content;
      background-color: white;
      box-shadow: 0px 0px 5px grey;
      border-radius: 0.25rem;

      .drop-down-item {
        padding: 5px 10px;
        color: $ah-primary;

        &:hover {
          cursor: pointer;
          text-decoration: underline;
        }
      }
    }
</style>