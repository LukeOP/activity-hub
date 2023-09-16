<template>
  <div class="action-container" v-if="actionItems.length > 0">
    <nav class="action" :class="{ 'action-visible': actionVisible }">
      
      <div id="sideBar">

        <div id="header" class="pt-5 pb-2">
          <i id="close-icon" class="fill-secondary" v-html="icons.xmark" @click="menu.actionsActive = false"></i>
          <h1>Actions</h1>
        </div>

        <div id="action-nav">
          <router-link v-for="item in actionItems" :key="item" :to="item.to" class="link" 
            @click="[menu.actionsActive = false, modalCheck(item)]" 
            :class="{additional: item.additional, red: item.red, green: item.green}" 
            @mouseover="item.showSubItems = true" @mouseleave="item.showSubItems = false">
            <span class="linkText"><i class="me-3 icon" :class="item.icon"></i>{{item.header}}</span>
          </router-link>
        </div>

      </div>

    </nav>
    <div class="action-overlay" v-if="actionVisible" @click="menu.actionsActive = false"></div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useUserStore } from '../../../stores/user'
import { useRoute } from 'vue-router'
import { useMenuStore } from '../../../stores/menu'
import { useActionsStore } from '../../../stores/actions'
import { icons } from '@/images/icons/icons'
import { useModalStore } from '@/stores/modal'

const props = defineProps({state: String})
const emit = defineEmits(['setState'])

const route = useRoute()
const user = useUserStore()
const actions = useActionsStore()
const menu = useMenuStore()
const filterActive = ref(false)
const actionVisible = ref(false)
const actionItems = ref([])
const modal = useModalStore()

watch(() => props.state, (newValue) => {
    if(newValue === 'nav' || newValue === 'filter') menu.actionsActive = false;
  })

watch(()=> actions.getItems, (newValue) => {
  actionItems.value = newValue
})

watch(()=> menu.filterActive, (newValue) => {
  filterActive.value = newValue
})

watch(() => menu.actionsActive, (newValue) => {
  actionVisible.value = newValue
  emit('setState', 'action ' + actionVisible.value)
})

function modalCheck(item){
  if(item.modal){
    modal.open(item.modal)
  }
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
}

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
    &:hover {
      background-color: $ah-secondary-dark;
    }
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
    .linkText {
      padding: 12px;
    }
  }
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
.action-visible {
  transform: translateX(260px); /* end position */
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

.red:hover {
  background-color: rgb(176, 0, 0) !important;
}
.green {
  background-color: rgb(60, 166, 60) !important;
  &:hover {
    background-color: green !important;
  }
}

.filterActive {
  border-radius: 0px;
}

.filterInactive {
  border-radius: 0px 0px 6px 0px;
}

#close-icon {
    position: absolute;
    top: 10px;
    right: 10px;
    opacity: 0;
    width: 1.5rem;
  }

/* Styles for mobile */
@media (max-width: 768px) {
  .action-toggle {
    top: 20px;
    left: auto;
    right: 67px;
  }

  #action-button {
    width: 38px;
    height: 38px;
    border-radius: 6px;
  }

  #close-icon {
    opacity: 1;
  }
}
</style>
