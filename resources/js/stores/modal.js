import { defineStore } from "pinia";

function getState() {
  return {
    type: '',
    active: false
  };
}

export const useModalStore = defineStore('modal', {
  state: () => (getState()),
  actions: {
    open(type) {
      this.type = type
      this.active = true;
    },
    close() {
      this.active = false;
      setTimeout(()=>{
        this.type = ''
      }, 200)
      ;
    },
    setActive(value) {
      console.log('reached');
      this.active = value;
    }
  },
  getters: {
    getType() {
      return this.type;
    },
    getActiveState() {
      return this.active;
    }
  }
});
