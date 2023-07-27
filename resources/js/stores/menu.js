import { defineStore } from "pinia";

function getState(){
    return {
      actions: false,
      actionsActive: false,
      filter: false,
      filterActive: false,
      nav: false,
      navActive: false,
    }
}

export const useMenuStore = defineStore('menu', {
  state: () => (getState()),
  actions: {
    setActionState(state){
      this.actions = state
    },
    setActionActive(state){
      this.actionsActive = state
    },
    setFilterState(state){
      this.filter = state
    },
    setFilterActive(state){
      this.filterActive = state
    },
    setNavState(state){
      this.nav = state
    },
    setNavActive(state){
      this.navActive = state
    }
    },
  getters: {
    getActionState(){
      return this.actions
    },
    getActionActive(){
      return this.actionsActive
    },
    getFilterState(){
      return this.filter
    },
    getFilterActive(){
      return this.filterActive
    },
    getNavState(){
      return this.nav
    },
    getNavActive(){
      return this.navActive
    },
  }
})
