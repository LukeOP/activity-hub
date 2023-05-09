import { defineStore } from "pinia";

function getState(){
    return {
      routeData: {},
      actionItems: ['hello'],
    }
}

export const useGeneralStore = defineStore('general', {
  state: () => (getState()),
  actions: {
    setRouteData(data){
      this.routeData = data
    },
    setActionItems(items){
      this.actionItems = items
    },
    resetActionItems(){
      this.actionItems = []
    }
  },
  getters: {
    getRouteData(){
      return this.routeData
    },
    getActionItems(){
      return this.actionItems
    }
  }
})
