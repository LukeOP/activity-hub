import { defineStore } from "pinia";

function getState() {
  return {
    active: false,
    data: {}
  };
}

export const useToastStore = defineStore('toast', {
  state: () => (getState()),
  actions: {
    open(type, header, message) {
      this.data = {type: type, header: header, message: message}
      this.active = true;
      setTimeout(()=>{
        this.close()
      }, 5000)
    },
    close() {
      this.active = false;
      this.data = {}
      setTimeout(()=>{
        this.type = ''
      }, 200)
      ;
    },
  },
  getters: {
    getActiveState() {
      return this.active;
    },
    getData(){
      return this.data;
    }
  }
});
