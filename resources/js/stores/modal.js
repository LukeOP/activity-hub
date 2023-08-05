import { defineStore } from "pinia";

function getState(){
    return {
      type: null
    }
}

export const useModalStore = defineStore('modal', {
  state: () => (getState()),
  actions: {
    openModal(state){
      this.active = state
    },
    closeModal(){
      this.type = null
    }
    },
  getters: {
    getType(){
      return this.type
    }
  }
})
