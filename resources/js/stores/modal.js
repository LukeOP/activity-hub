import { defineStore } from "pinia";

function getState() {
  return {
    type: '',
    active: false,
    data: {}
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
      this.data = {}
      setTimeout(()=>{
        this.type = ''
      }, 200)
      ;
    },
    setActive(value) {
      // console.log('reached');
      this.active = value;
    },
    setData(data){
      this.data = data;
    }
  },
  getters: {
    getType() {
      return this.type;
    },
    getActiveState() {
      return this.active;
    },
    getData(){
      return this.data;
    }
  }
});
