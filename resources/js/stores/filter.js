import { defineStore } from "pinia";
import { useMenuStore } from "./menu";

function getState(){
    return {
      data: {},
      returned: [],
      type: ''
    }
}

export const useFilterStore = defineStore('filter', {
  state: () => (getState()),
  actions: {
    setData(data){
      this.data = data
    },
    setType(type){
      this.type = type
    },
    setReturned(data){
      this.returned = data
    },
    close(){
      const menuStore = useMenuStore()
      menuStore.setFilterActive(false)
      this.reset()
    },
    reset(){
      this.data = {}, 
      this.returned = [], 
      this.type= ''}
    },
  getters: {
    getData(){
      return this.data
    },
    getReturned(){
      return this.returned
    },
    getType(){
      return this.type
    }
  }
})
