<template>
  <section v-if="!mobileFormat" id="profile-container" @click="handleIconClick">
    <Avatar v-if="user.attributes.first_name != ''" :user="user.getUser" :hover="true" class="avatar" />

    <div id="profile-drop-down" v-if="showDropDown">
      <div class="triangle-container">
        <div id="triangle"></div>
      </div>
      <div class="drop-down-content unselectable">
        <header id="profile-header">
            <h1>Account</h1>
            <!-- <i class="fa-solid fa-ellipsis options"></i> -->
        </header>
        <div class="profile-body">
          <div class="drop-down-item" @click="handleProfile">Profile</div>
          <div class="drop-down-item" @click="routerChange('Settings')">Settings</div>
          <div class="drop-down-item" @click="handleLogout">Log Out</div>
        </div>
      </div>
    </div>
  </section>
  
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../../stores/user'
import { useRouter } from 'vue-router'
import { useWindowSize } from '../../../../composables/useWindowSize'
import Avatar from '../Elements/Avatars/Avatar.vue'

const props = defineProps({backgroundStatus:Boolean})
const emit = defineEmits(['setBackground'])

const router = useRouter()
const user = useUserStore()
const loggingOut = ref(false)
const { mobileFormat } = useWindowSize()

const showDropDown = ref(false)

function handleIconClick(){
  showDropDown.value = !showDropDown.value
  emit('setBackground', !props.backgroundStatus)
}

watch(() => props.backgroundStatus, () => {
  props.backgroundStatus ? null : showDropDown.value = false
})

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
  })
}

</script>

<style lang="scss" scoped>
  #profile-container {
    #profile-drop-down {
      position: absolute;
      right:  18px;
      top: 65px;
      width: 200px;
      max-height: 80vh;
      min-height: fit-content;
      background-color: white;
      box-shadow: 0px 0px 10px 3px $ah-grey;
      border-radius: 0.5rem;

      .triangle-container {
        position: relative;
        height: 20px;
        top: -20px;
        right: 22px;
        overflow: hidden;
          #triangle {
            position: relative;
            top: 15px;
            width: 40px;
            height: 40px;
            float: right;
            background-color: white;
            transform:rotate(45deg);
            box-shadow: 0px 0px 10px 3px $ah-grey;
          }
      }
      .drop-down-content {
          max-height: 80vh;
          #profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 37px;
            padding: 0px 20px;
            h1 {
                font-size: 1.5rem;
            }
            .options {
                font-size: 1.5rem;
            }
          }
          .profile-body {
              overflow: hidden;
              overflow-y: auto;
              max-height: calc(80vh - 157px);
              -ms-overflow-style: none;  /* IE and Edge */
              scrollbar-track-color: transparent;  /* Firefox */
              &::-webkit-scrollbar-track {
                  display: none; /* Chrome, Safari and Opera */
              }
              .drop-down-item {
                padding: 5px 20px;
                font-size: 1rem;
                &:hover {
                  cursor: pointer;
                  background-color: $ah-primary-light-background;
                }
              }
              
            }
      }

    }
  }



</style>