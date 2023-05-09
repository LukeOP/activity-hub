<template>
  <div class="action-container" v-if="navItems.length > 0">
    <div class="action-toggle" @click="toggleAction" >
      <span class="btn btn-secondary" id="action-button">
        <span v-if="windowSize.width > 768" class="mx-auto">{{ actionVisible ? 'Cancel' : 'Actions' }}</span>
        <i class="fa-solid float-end mt-1" :class="[getActionIcon(), {rotate: !actionVisible}]"></i>
      </span>
    </div>
    <nav class="action" :class="{ 'action--visible': actionVisible }">
      
    <div id="sideBar">

    <div id="header" class="pt-5 pb-2">
      <h1>Actions</h1>
    </div>

    <div id="action-nav">
      <router-link v-for="item in navItems" :key="item" :to="item.to" class="link" @click="actionVisible = false" :class="{additional: item.additional}" @mouseover="item.showSubItems = true" @mouseleave="item.showSubItems = false">
        <span class="linkText"><i class="me-3 icon" :class="item.icon"></i>{{item.header}}</span>
          <div v-show="item.subItems && item.showSubItems">
            <router-link v-for="subItem in item.subItems" :key="subItem.header" :to="subItem.to" class="subLink" @click="hideAction">
              {{ subItem.header}}
            </router-link>
          </div>
      </router-link>

    </div>

    <div id="settings">
    </div>

  </div>



    </nav>
    <div class="action-overlay" v-if="actionVisible" @click="hideAction"></div>
  </div>
</template>

<script>
import { computed, ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRoute } from 'vue-router'
import { useWindowSize } from '../../../composables/useWindowSize'
import { useGeneralStore } from '../../../stores/general'

export default {
  emits: ['setState'],
  props: ['state'],
  setup(props, context) {
    const route = useRoute()
    const user = useUserStore()
    const general = useGeneralStore()
    const windowSize = useWindowSize()

    const initialNavItems = ref([])

    if(user.user.schoolAdmin){
      let array = [
        { header: 'New Lesson', to: { name: 'LessonCreate' }, showSubItems: false, icon: 'fa-solid fa-person-chalkboard'},
        // { header: 'New Event', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-calendar-day'},
        // { header: 'New Hire', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-drum'},
        // { header: 'New Room Booking', to: { name: 'home' }, showSubItems: false, icon: 'fa-solid fa-circle-plus'},
      ]
      array.forEach(element => {
        initialNavItems.value.push(element)
      });
    }

    const additionalActionItems = ref([])

    watch(
      () => props.state, (newValue, oldValue) => {
        if(newValue === 'menu') actionVisible.value = false;
      }
    );

    watch(()=> general.getActionItems, (newValue, oldValue) => {
      additionalActionItems.value = newValue
    })

    watch(() => route.path, (newValue, oldValue) => {
      general.setActionItems([])
    })

    const navItems = computed(() => {
      return [...additionalActionItems.value, ...initialNavItems.value] 
    })

    const actionVisible = ref(false)

    const toggleAction = () => {
      actionVisible.value = !actionVisible.value
      context.emit('setState', 'action ' + actionVisible.value)
    }

    function getActionIcon(){
      if(actionVisible.value === true) return 'fa-xmark'
      return 'fa-ellipsis'
    }

    function hideAction(){
      actionVisible.value = false
    }

    return {
      user: user.user,
      windowSize,
      navItems,
      actionVisible,
      toggleAction,
      getActionIcon,
      hideAction,
    }
  },
}
</script>

<style lang="scss" scoped>
/* action container styles */
#sideBar {
  display: flex;
  flex-direction: column;
  height: 100vh;
  width: 250px;
  background-color: $ah-secondary-dark;

  #header {
    background-color: white;
    color: $ah-secondary;
    h1 {
      padding-left: 20px;
    }
  }

  #action-nav {
    flex-grow: 1;
    flex-shrink: 0;
    flex-basis: 100px;
    .link {
      display: block;
      color: lighten($ah-secondary, 55%);
      width: 100%;
      text-decoration: none;
      padding: 10px 0px;
      font-size: 1rem;

      &:hover {
        background-color: $ah-secondary;
        color: lighten($ah-secondary, 55%);
      }

      .linkText {
        padding-left: 20px;
        .icon {
          width: 20px;
        }
      }
    }
    .additional {
      background: $ah-secondary;
    }
    .subLink {
      display: block;
      background-color: lighten($ah-secondary, 60%);
      text-decoration: none;
      padding: 10px 20px;
      color: $ah-secondary;

      &:hover {
        background-color: $ah-secondary;
        color: lighten($ah-secondary, 55%);
      }
    }
    .router-link-exact-active, .active {
      background-color: $ah-secondary;
      border-left: 8px solid $ah-secondary-light;
      color: lighten($ah-secondary, 55%);
      font-weight: bold;
      .linkText {
        font-weight: bold;
        padding: 12px;
      }
    }
  }

  #settings {
  height: 150px;
  background-color: $ah-secondary;
  padding-top: 10px;
    p {
      color: white;
      padding-left: 10px;
      margin: 0;
      &:hover {
        color: $ah-primary-light;
        cursor: pointer;
      }
    }
  }
}
.action-container {
  position: relative;
}

/* action button styles */ 
.action-toggle {
  position: absolute;
  // top: 20px;
  z-index: 1;
  span.btn {
    width: 38px;
    height: 38px;
    i {
      transition: transform 0.3s ease-out;
    }
  }
}
#action-button {
  width: 130px;
}

/* action styles */
.action {
  position: fixed;
  top: 0;
  left: -260px; /* start position */
  width: 250px;
  height: 100%;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  transition: transform 0.3s ease-out;
}

/* action visible state */
.action--visible {
  transform: translateX(260px); /* end position */
}

/* action toggle rotate */
.rotate {
  transform: rotate(-180deg);
}

/* action item styles */
.action ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.action li {
  margin-bottom: 20px;
}

.action a {
  display: block;
  padding: 10px 20px;
  color: #000;
  text-decoration: none;
  transition: color 0.3s ease-out;
}

.action a:hover {
  color: #333;
}

/* Overlay styles */
.action-overlay {
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
.action--visible .action-overlay {
  opacity: 1;
  pointer-events: auto;
}
@media (min-width: 769px) {
  .action-toggle {
    // left: 300px;
    left: 250px;
    #action-button {
      border-radius: 0px 0px 6px 0px;
    }
  }
}


/* Styles for mobile */
@media (max-width: 768px) {
  .action-toggle {
    position: absolute;
    top: 20px;
    right: 80px;
    z-index: 1;
    span.btn {
      width: 38px;
      height: 38px;
      i {
        transition: transform 0.3s ease-out;
      }
    }
  }

  #action-button {
    width: 38px;
    height: 38px;
  }
}
</style>
