import { defineStore } from "pinia";

function getState(){
    return {
      currentHire: {},
      hires: [],
      filteredHires: []
    }
}

export const useHireStore = defineStore('hires', {
  state: () => (getState()),
  actions: {
    setHire(hireObject){
      this.currentHire = hireObject
    },
    setHires(hireArray){
      this.hires = hireArray
    },
    setFilteredHires(hireArray){
      this.filteredHires = hireArray
    },
    reset(){
      this.currentHire = {}
      this.hires = []
      this.filteredHires = []
    }
  },
  getters: {
    getHire(){
      return this.currentHire
    },
    getHires(){
      return this.hires
    },
    getFilteredHires(){
      return this.filteredHires
    }
  }
})
