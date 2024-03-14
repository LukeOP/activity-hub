<template>
  <div :class="{background: showDropDown || loggingOut}" @click.self="showDropDown = false">
    <div v-if="!mobileFormat" id="profile-container" @click="showDropDown = !showDropDown">
      <div id="user-img" @click.self="showDropDown = true">
        <span id="icon-text">{{initials}}</span>
      </div>

      <div id="profile-drop-down" v-if="showDropDown">
        <div id="triangle"></div>
        <div class="drop-down-item" @click="handleProfile">Profile</div>
        <div class="drop-down-item" @click="routerChange('Settings')">Settings</div>
        <div class="drop-down-item" @click="handleLogout">Log Out</div>
      </div>
    </div>
  </div>
  
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRouter } from 'vue-router'
import { useWindowSize } from '../../../composables/useWindowSize'

const router = useRouter()
const user = useUserStore()
const showDropDown = ref(false)
const loggingOut = ref(false)
const { mobileFormat } = useWindowSize()

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

function routerChange(path_name){
  router.push({
    name: path_name
  })
}

function handleLogout(){
  loggingOut.value = true
  user.logout().then(()=>{
    routerChange('Login')
    // router.push({
    //   name: 'Login'
    // })
  })
}

</script>

<style lang="scss" scoped>
.background {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  position: fixed;
  top: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.05);
}
#user-img {
  position: absolute;
  height: 46px;
  width: 46px;
  top: 10px;
  right: 40px;
  border-radius: 50%;
  cursor: pointer;
  background: $ah-primary;
  border: 3px solid white;
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
  top: 65px;
  width: 130px;
  min-height: fit-content;
  background-color: white;
  box-shadow: 0px 0px 5px grey;
  border-radius: 0.25rem;

  #triangle {
    position: relative;
    right: 25px;
    width: 20px;
    height: 15px;
    float: right;
    border-bottom: solid 15px white;
    border-left: solid 15px transparent;
    border-right: solid 15px transparent;
    transform: translateY(-15px);
  }
}

.drop-down-item {
  padding: 5px 10px;
  color: $ah-primary;

  &:hover {
    cursor: pointer;
    text-decoration: underline;
  }
}
</style>