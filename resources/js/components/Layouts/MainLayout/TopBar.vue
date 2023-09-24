<template>
  <div id="top-bar">
    <span id="item-group">
      <div v-for="item in menuItems" :key="item" class="item" :style="item.styles">
        <span class="menu-btn" @click="showSideBar(item)">
          <span v-if="windowSize.width > 768" style="flex: 1; text-align: center;">{{ menu[item.state] ? 'Cancel' : item.text }}</span>
          <i v-html="menu[item.state] ? icons.xmark : item.icon" class="fill-white icon"></i>
        </span>
      </div>
    </span>
  </div>
</template>

<script setup>
import { computed, ref, watch, watchEffect } from "vue";
import { useRoute } from "vue-router";
import { useWindowSize } from "../../../composables/useWindowSize";
import { useFilterStore } from "../../../stores/filter";
import { useMenuStore } from "../../../stores/menu";
import { useActionsStore } from "../../../stores/actions";
import { icons } from '@/images/icons/icons'

const menu = useMenuStore()
const filter = useFilterStore()
const actions = useActionsStore()
const route = useRoute()
const { windowSize } = useWindowSize()

const menuItems = ref([]);

const itemMap = {
  nav: { text: 'Navigation', styles: 'background-color: #3B6580; color: white', icon: icons.bars, state: 'navActive' },
  actions: { text: 'Actions', styles: 'background-color: #FFAE33; color: white', icon: icons.gears, state: 'actionsActive' },
  filter: { text: 'Filter', styles: 'background-color: rgb(189,189,189); color: white', icon: icons.filter, state: 'filterActive' },
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
  position: absolute;
  left: 250px;
  height: 38px;
  width: calc(100vw - 250px);
  // background-color: pink;
}
.menu-btn{
  display: flex; 
  align-items: center; 
  padding: 6px;
  width: 120px;
}
.item {
  position: static;
  display: inline-block;
  height: 38px;
  margin-right: 5px;
  cursor: pointer;
  &:last-of-type {
    border-radius: 0px 0px 15px;
  }
}
.icon {
  height: 25px;
  width: 25px;
}


/* action toggle rotate */
.rotate {
  transform: rotate(-180deg);
}
/* Styles for mobile */
@media (max-width: 768px) {
  #top-bar {
    display: flex;
    left: auto;
    right: 0;
    width: fit-content;
    height: 38px;
    top: 10px;
    flex-direction: row-reverse;
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
