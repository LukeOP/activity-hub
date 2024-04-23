import { defineStore } from "pinia";

function getState(){
    return {
      items: [],
      loading: false
    }
}

export const useAppStore = defineStore('appStore', {
  state: () => (getState()),
  actions: {
    setItems(items){
      this.items = items
    },
    resetItems(){
      this.items = []
      this.loading = false
    },
    setLoading(value){
      this.loading = value
    }
  },
  getters: {
    getItems(){
      return this.items
    },
    getLoading(){
      return this.loading
    }
  }
})
