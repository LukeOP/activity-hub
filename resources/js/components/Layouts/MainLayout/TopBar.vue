<template>
  <div id="top-bar">
    <div id="logo-img" @click="router.push({name: 'Dashboard'})">
      <ActivityHubIconSVG />
    </div>

    <!-- Dynamic menu section -->
    <div id="item-group">
      <!-- Individual Menu Item -->
      <div v-for="item in menuItems" :key="item" class="item" :style="item.styles">
        <span class="menu-btn" @click="showSideBar(item)">
        <!-- Text and Icon -->
          <span v-if="windowSize.width > 768" style="flex: 1; text-align: center;">{{ menu[item.state] ? 'Cancel' : item.text }}</span>
          <i v-html="menu[item.state] ? icons.xmark : item.icon" class="fill-white icon"></i>
        </span>
      </div>
    </div>

    <div id="profile-section">
      <div v-if="backgroundSet" class="background-screen" @click="setBackgroundState(false)"></div>
      <Notifications :backgroundStatus="backgroundSet" @setBackground="setBackgroundState" />
      <ProfileMenu :backgroundStatus="backgroundSet" @setBackground="setBackgroundState"/>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useWindowSize } from "../../../composables/useWindowSize";
import { useFilterStore } from "../../../stores/filter";
import { useMenuStore } from "../../../stores/menu";
import { useActionsStore } from "../../../stores/actions";
import { icons } from '@/images/icons/icons'
import ActivityHubIconSVG from "./Elements/SVG/ActivityHubIconSVG.vue";
import ProfileMenu from "./TopBarElements/ProfileMenu.vue";
import Notifications from "./TopBarElements/Notifications.vue";

const menu = useMenuStore()
const filter = useFilterStore()
const actions = useActionsStore()
const route = useRoute()
const router = useRouter()
const { windowSize } = useWindowSize()

const menuItems = ref([]);
const backgroundSet = ref(false)

const itemMap = {
  nav: { text: 'Navigation', styles: 'background-color: #3B6580; color: white', icon: icons.bars, state: 'navActive' },
  actions: { text: 'Actions', styles: 'background-color: #FFAE33; color: white', icon: icons.gears, state: 'actionsActive' },
  filter: { text: 'Filter', styles: 'background-color: rgb(189,189,189); color: white', icon: icons.filter, state: 'filterActive' },
  // nav: { text: 'Navigation', styles: 'color: white', icon: icons.bars, state: 'navActive' },
  // actions: { text: 'Actions', styles: 'color: white', icon: icons.gears, state: 'actionsActive' },
  // filter: { text: 'Filter', styles: 'color: white', icon: icons.filter, state: 'filterActive' },
};

function addItem(type) {
  if (menu[type]) {
    const newItem = { type, ...itemMap[type] };
    menuItems.value.push(newItem);
  } else {
    const itemToRemove = menuItems.value.find(item => item.type === type);
    if (itemToRemove) {
      menuItems.value.splice(menuItems.value.indexOf(itemToRemove), 1);
    }
  }
}

function setBackgroundState(state){
  backgroundSet.value = state
}

watch(() => menu, () => {
  menuItems.value = []
  for (const type in itemMap) {
    addItem(type);
  }
}, { deep: true });

watch(() => actions.getItems, (newValue) => {
  menu.actions = newValue.length > 0
})

watch(() => filter.type, (newValue) => {
  menu.filter = newValue != ''
})

watch(() => windowSize.value, (newValue) => {
  menu.nav = newValue.width <= 768
})
if(windowSize.value.width <= 768) menu.nav = true

watch(() => route.path, () => {
  actions.setItems([])
  filter.setType('')
})

function showSideBar(item){
  menu[item['state']] = !menu[item['state']]
}
</script>


<style lang="scss" scoped>
#top-bar {
  // background-color: purple;
  position: absolute;
  left: 250px;
  height: 50px;
  width: calc(100vw - 250px);
  display: flex;
  #logo-img {
    display: none;
  }
  #item-group {
    // background-color: green;
    .item {
      position: static;
      display: inline-block;
      height: 38px;
      margin-right: 5px;
      cursor: pointer;
      .menu-btn{
        display: flex; 
        align-items: center; 
        padding: 6px;
        width: 120px;
        .icon {
          height: 25px;
          width: 25px;
        }
      }
      &:last-of-type {
        border-radius: 0px 0px 15px;
      }
    }
  }
  #profile-section {
    flex-grow: 1;
    padding-right: 40px;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 2rem;
    .background-screen {
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
  }
}
/* action toggle rotate */
.rotate {
  transform: rotate(-180deg);
}


/* Styles for mobile */
@media (max-width: 768px) {
  #top-bar {
    display: flex;
    left: 0;
    width: 100%;
    justify-content: space-between;
    padding: 10px;
    background-color: #FCFCFC;
    background-color: transparent;
    #logo-img {
      display: block;
      position: relative;
      height: 45px;
      top: 0px;
      left: 3px;
      width: 45px;
      padding: 5px;
      background-color: white;
      border: 1px solid $ah-grey-light;
      border: 1px solid white;
      border-radius: 50%;
      box-shadow: 0px 0px 10px $ah-grey-light;
    }
  }
  .menu-btn {
    padding: 0;
  }
  #item-group {
    // background-color: green;
    height: 38px;
    padding-right: 12px;
  }
  .item, .item:last-of-type {
    width: 38px;
    margin-left: 0.5rem;
    margin-right: 0;
    border-radius: 6px;
    float: right;
  }
  .icon {
  display: inline-flex;
  height: 38px;
  width: 38px;
  position: relative;
  padding: 7px;
}
}
</style>
