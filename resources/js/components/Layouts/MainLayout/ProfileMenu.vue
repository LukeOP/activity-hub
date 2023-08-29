<template>
  <div v-if="!hideMenu" id="profile-container" @mouseenter="showDropDown = true" @mouseleave="showDropDown = false">
    <div id="user-img" @click="handleProfile">
      <span id="icon-text">{{initials}}</span>
    </div>

    <div id="profile-drop-down" v-if="showDropDown">
      <div class="drop-down-item" @click="handleProfile">Profile</div>
      <div class="drop-down-item" @click="handleLogout">Log Out</div>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRouter } from 'vue-router'
import { useWindowSize } from '../../../composables/useWindowSize'
import useApi from '../../../composables/useApi'

const router = useRouter()
const user = useUserStore()
const showDropDown = ref(false)
const windowSize = useWindowSize()

const initials = computed(()=>{
  if(user.attributes.first_name) return getFirstLetter(user.attributes.first_name) + getFirstLetter(user.attributes.last_name)
  return ''
})

function getFirstLetter(string){
  return string[0]
}

function handleProfile(){
  router.push({
    name: 'Profile',
    params: {
      id: user.attributes.id
    }
  })
}

function handleLogout(){
  user.logout().then(()=>{
    router.push({
      name: 'Login'
    })
  })
}

const hideMenu = ref(true)
if(windowSize.value.width > 768) hideMenu.value = false

watch(windowSize,(newSize, oldSize) => {
  if(newSize.width > 768) hideMenu.value = false
  else hideMenu.value = true
})

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
      background: $ah-primary;
    }
    #icon-text {
      display: block;
      position: relative;
      font-size: 1.25rem;
      width: 40px;
      color: white;
      text-align: center;
      top: 50%;
      transform: translateY(-50%);
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