import { defineStore } from "pinia";
import axiosClient from "../axios";

function getState(){
    return {
      currentHire: {},
      hires: [],
      filteredHires: [],
      hireData: {},
      loading: false
    }
}

export const useHireStore = defineStore('hires', {
  state: () => (getState()),
  actions: {
    async fetchHires(){
      this.loading = true
      const hires = await axiosClient.get('hires')
      this.setHires(hires.data)
      this.loading = false
    },
    setHire(hireObject){
      this.currentHire = hireObject
    },
    setHires(hireArray){
      this.hires = hireArray
    },
    setFilteredHires(hireArray){
      this.filteredHires = hireArray
    },
    addHire(hireObject){
      this.hires = [...this.hires, hireObject]
    },
    setHireData(hireData){
      this.hireData = hireData
    },
    updateHire(hireObject){
      const index = this.hires.findIndex(h => h.id === hireObject.id)
      if (index !== -1){
        this.hires.splice(index, 1, hireObject)
        this.currentHire = hireObject
      }
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
    },
    getHireData(){
      return this.hireData
    },
    isLoading(){
      return this.loading
    }
  }
})
