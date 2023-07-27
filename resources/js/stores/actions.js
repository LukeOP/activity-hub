import { defineStore } from "pinia";

function getState(){
    return {
      items: []
    }
}

export const useActionsStore = defineStore('actions', {
  state: () => (getState()),
  actions: {
    setItems(items){
      this.items = items
    },
    resetItems(){
      this.items = []
    },
    },
  getters: {
    getItems(){
      return this.items
    },
  }
})
