<template>
  <div class="menu-container">
    <nav class="menu" :class="{ 'menu-visible': navVisible }">
      
      <div id="sideBar">
        <img id="logo-img" src="/images/ActivityHub-Logo.png" alt="Activity Hub Logo">

        <div id="nav">
          <router-link v-for="item in navItems" :key="item" :to="item.to" class="link" @click="menu.navActive = false" :class="{ active: isActive(item) }">
            <span class="linkText"><i class="me-3 icon" :class="item.icon"></i>{{item.header}}</span>
              <div v-show="item.subItems && item.showSubItems" class="subItemContainer">
                <router-link v-for="subItem in item.subItems" :key="subItem.header" :to="subItem.to" class="subLink" :class="{ activeSub: isActive(subItem) }">
                  {{ subItem.header}}
                </router-link>
              </div>
          </router-link>
        </div>

        <div id="settings">
          <div v-if="navVisible">
            <span id="user-img" @click="handleProfile">
              <img v-if="userImage" :src="userImage" alt="Profile Image">
              <img v-else src="/storage/userImages/user.png" alt="Profile Image">
              <p>Profile</p>
            </span>
            <p @click="handleLogout"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Logout</p>
          </div>
          
        </div>

      </div>

    </nav>
    <div class="menu-overlay" v-if="navVisible" @click="menu.navActive = false"></div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useMenuStore } from '../../../stores/menu'
import { useRoute, useRouter } from 'vue-router'
import { useWindowSize } from '../../../composables/useWindowSize'
import { useFilterStore } from '../../../stores/filter'

const props = defineProps({state: String})
const emit = defineEmits(['setState'])

const router = useRouter()
const route = useRoute()
const user = useUserStore()
const menu = useMenuStore()
const windowSize = useWindowSize()
const userImage = ref(null)
const navVisible = ref(false)

function getUserImage(){
  let path = '/storage/userImages/'
  if(user.attributes.image != 'user.png'){
    userImage.value = path + user.attributes.image
  }
}
getUserImage()

function handleProfile(){
  router.push({
    name: 'Profile',
    params: {
      id: user.attributes.id
    }
  })
  hideMenu()
}

const navItems = ref([
  { header: 'Dashboard', to: { name: 'Dashboard' }, showSubItems: false, icon: 'fa-solid fa-house'},
])

const navOptions = [
  { header: 'Lessons', to: { name: 'LessonsList' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard', permission: 'LESSONS_V', additional_permission: 'LESSONS_R'},
  // { header: 'Events', to: { name: 'StudentsTable' }, showSubItems: false, icon: 'fa-solid fa-circle', permission: 'EVENTS_V'},
  // { header: 'Hires', to: { name: 'StudentsTable' }, showSubItems: false, icon: 'fa-solid fa-moon', permission: 'HIRES_V'},
  // { header: 'Rooms', to: { name: 'StudentsTable' }, showSubItems: false, icon: 'fa-solid fa-book', permission: 'ROOMS_V'},
  // { header: 'Instruments', to: { name: 'StudentsTable' }, showSubItems: false, icon: 'fa-solid fa-car', permission: 'INSTRUMENTS_V'},
  { header: 'Students', to: { name: 'StudentsTable' }, showSubItems: false, icon: 'fa-solid fa-children', permission: 'STUDENTS_V'},
  { header: 'Staff', to: { name: 'StaffList' }, showSubItems: false, icon: 'fa-solid fa-user-group', permission: 'STAFF_V'},
]
function setNavItems(){
  navOptions.forEach(option => {
    if(hasPermission(option.permission) || hasPermission(option.additional_permission)){
      if(!navItems.value.find(i => i.header === option.header)){
        navItems.value.push(option)
      }
    }
  });
}

function hasPermission(value){
  if(user.permissions.find(p => p.type === 'administrator')) return true
  return user.permissions.find(p => p.type === value)
}
setNavItems()
watch(() => user.permissions, () => {
setNavItems()
})

const isActive = (item) => {
  if (item.subItems) {
    return item.subItems.some(subItem => subItem.to.name === route.name)
  } else {
    return item.to.name === route.name
  }
}

watch(() => props.state, (newValue, oldValue) => {
    if(newValue === 'action' || newValue === 'filter') menu.navActive = false;
  }
);
watch(() => route.path, () => {
  resetNav()
  if(route.path.includes('lessons')){
    let item = navItems.value.filter(i => i.header === 'Lessons')
    item[0].showSubItems = true
  }
})

function resetNav(){
  navItems.value.forEach(item => {
    item.showSubItems = false
  });
}

watch(() => menu.navActive, (newValue) => {
  navVisible.value = newValue
  emit('setState', 'nav ' + navVisible.value)
})

function handleLogout(){
  user.logout().then(()=>{
    router.push({
      name: 'home'
    })
  })
}

function handleSchools(){
  user.attributes.schools.forEach(school => {
    console.log(school.name)
  });
}

</script>


<style lang="scss" scoped>
/* Menu container styles */
#sideBar {
  display: flex;
  flex-direction: column;
  height: 100vh;
  width: 250px;
  background-color: $ah-primary-dark;

  img {
    width: 100%;
    max-height: 200px;
  }

  #nav {
    flex-grow: 1;
    flex-shrink: 0;
    flex-basis: 100px;
    .link {
      display: block;
      color: lighten($ah-primary, 55%);
      width: 100%;
      text-decoration: none;
      padding: 10px 0px;
      font-size: 1rem;

      &:hover {
        background-color: $ah-primary;
        color: lighten($ah-primary, 55%);
      }

      .linkText {
        padding-left: 20px;
        .icon {
          width: 20px;
        }
      }
    }
    .subLink {
      display: block;
      text-decoration: none;
      padding: 10px 20px;
      color: white;
      font-weight: 400;

      &:hover {
        background: $ah-primary-light;
        font-weight: bold;
      }
    }
    .active {
      background-color: $ah-primary;
      border-left: 8px solid $ah-primary-light;
      color: lighten($ah-primary, 55%);
      font-weight: bold;
      .linkText {
        font-weight: bold;
        padding: 12px;
      }
    }
    .activeSub {
      font-weight: bold;
    }
  }

  #settings {
  height: 150px;
  background-color: $ah-primary;
  padding-top: 10px;

    #user-img {
      display: block;
      height: fit-content;
      width: 100%;
      border-bottom: 1px solid $ah-primary-dark;
      cursor: pointer;
      padding-bottom: 10px;
      margin-bottom: 10px;
      img{
        height: 40px;
        width: 40px;
        margin-left: 10px;
        border-radius: 50%;
      }
      p {
        display: inline;
      }
      
    }
    p {
      color: white;
      padding-left: 10px;
      margin: 0;
      &:hover {
        color: $ah-secondary-light;
        cursor: pointer;
      }
    }
  }
}
.menu-container {
  position: relative;
}

/* Menu button styles */ 
.menu-toggle {
  display: none;
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 1;
  span.btn {
    width: 38px;
    height: 38px;
    i{
      transition: transform 0.3s ease-out;
    }
  }
}

/* Menu styles */
.menu {
  position: fixed;
  top: 0;
  left: 0px; /* start position */
  width: 250px;
  height: 100%;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
}

/* Menu visible state */
.menu-visible {
  transform: translateX(260px); /* end position */
}
/* action toggle rotate */
.rotate {
  transform: rotate(-180deg);
}

/* Menu item styles */
.menu ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.menu li {
  margin-bottom: 20px;
}

.menu a {
  display: block;
  padding: 10px 20px;
  color: #000;
  text-decoration: none;
  transition: color 0.3s ease-out;
}

.menu a:hover {
  color: #333;
}

/* Overlay styles */
.menu-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.5);
  opacity: 1;
  transition: opacity 0.3s ease-out;
  z-index: -1;
}

/* Overlay visible state */
.menu--visible .menu-overlay {
  opacity: 1;
  pointer-events: auto;
}

.subItemContainer {
  background: $ah-primary;
  box-shadow: inset 5px 5px 10px $ah-primary-dark;
}

/* Styles for mobile */
@media (max-width: 768px) {
  .menu {
    left: -260px;
    transition: transform 0.3s ease-out;
  }
  .menu-toggle {
    display: block;
  }
}
</style>
