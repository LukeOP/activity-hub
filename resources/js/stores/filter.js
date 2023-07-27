import { defineStore } from "pinia";

function getState(){
    return {
      data: {},
      returned: {},
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
    reset(){
      this.data = {}, 
      this.returned = {}, 
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
