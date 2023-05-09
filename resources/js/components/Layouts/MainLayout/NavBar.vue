<template>
  <div class="menu-container">
    <div class="menu-toggle" @click="toggleMenu">
      <span class="btn btn-primary">
        <i class="fa-solid" :class="[getMenuIcon(), {rotate: !menuVisible}]"></i>
      </span>
    </div>
    <nav class="menu" :class="{ 'menu--visible': menuVisible }">
      
      <div id="sideBar">

    <img id="logo-img" src="/images/ActivityHub-Logo.png" alt="Activity Hub Logo">

    <div id="nav">
      <router-link v-for="item in navItems" :key="item" :to="item.to" class="link" @click="menuVisible = false" :class="{ active: isActive(item) }" @mouseover="item.showSubItems = true" @mouseleave="item.showSubItems = false">
        <span class="linkText"><i class="me-3 icon" :class="item.icon"></i>{{item.header}}</span>
          <div v-show="item.subItems && item.showSubItems">
            <router-link v-for="subItem in item.subItems" :key="subItem.header" :to="subItem.to" class="subLink" :class="{ active: isActive(subItem) }">
              {{ subItem.header}}
            </router-link>
          </div>
      </router-link>

    </div>

    <div id="settings">
      <!-- <p @click="handleSchools">Linked Schools</p> -->
      <p @click="handleLogout"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Logout</p>
    </div>

  </div>



    </nav>
    <div class="menu-overlay" v-if="menuVisible" @click="hideMenu"></div>
  </div>
</template>

<script>
import { ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRoute, useRouter } from 'vue-router'

import { useWindowSize } from '../../../composables/useWindowSize'
import axiosClient from '../../../axios'

export default {
  emits: ['setState'],
  props: ['state'],
  setup(props, context) {
    const router = useRouter()
    const route = useRoute()
    const user = useUserStore()
    const windowSize = useWindowSize()

    const navItems = ref([
      { header: 'Dashboard', to: { name: 'YourDay' }, showSubItems: false, icon: 'fa-solid fa-house'},
      { header: 'Lessons', to: { name: 'LessonsTable' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
    ])

    const isActive = (item) => {
      if (item.subItems) {
        return item.subItems.some(subItem => subItem.to.name === route.name)
      } else {
        return item.to.name === route.name
      }
    }

    watch(windowSize,(newSize, oldSize) => {
      if(newSize.width > 768) menuVisible.value = false
    })

    watch(() => props.state, (newValue, oldValue) => {
        if(newValue === 'action') menuVisible.value = false;
      }
    );

    const menuVisible = ref(false)

    const toggleMenu = () => {
      menuVisible.value = !menuVisible.value
      context.emit('setState', 'menu ' + menuVisible.value)
    }

    function getMenuIcon(){
      if(menuVisible.value === true) return 'fa-xmark'
      return 'fa-bars'
    }

    const hideMenu = () => {
      menuVisible.value = false
    }

    function handleLogout(){
      user.logout().then(()=>{
        router.push({
          name: 'home'
        })
      })
    }

    function handleSchools(){
      user.user.schools.forEach(school => {
        console.log(school.name)
      });
    }

    return {
      user: user.user,
      navItems,
      isActive,
      menuVisible,
      toggleMenu,
      getMenuIcon,
      hideMenu,
      handleLogout,
      handleSchools
    }
  },
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
      background-color: lighten($ah-primary, 60%);
      text-decoration: none;
      padding: 10px 20px;
      color: $ah-primary;

      &:hover {
        background-color: $ah-primary;
        color: lighten($ah-primary, 55%);
      }
    }
    .router-link-exact-active, .active {
      background-color: $ah-primary;
      border-left: 8px solid $ah-primary-light;
      color: lighten($ah-primary, 55%);
      font-weight: bold;
      .linkText {
        font-weight: bold;
        padding: 12px;
      }
    }
  }

  #settings {
  height: 150px;
  background-color: $ah-primary;
  padding-top: 10px;
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
.menu--visible {
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
