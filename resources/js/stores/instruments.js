import { defineStore } from "pinia";

function getState(){
    return {
      currentInstrument: {},
      instruments: [],
      filteredInstruments: []
    }
}

export const useInstrumentStore = defineStore('instruments', {
  state: () => (getState()),
  actions: {
    setInstrument(instrumentObject){
      this.currentInstrument = instrumentObject
    },
    setInstruments(instrumentArray){
      this.instruments = instrumentArray
    },
    setFilteredInstruments(instrumentArray){
      this.filteredInstruments = instrumentArray
    },
    addInstrument(instrumentObject){
      this.instruments = [...this.instruments, instrumentObject]
    },
    updateInstrument(instrumentObject){
      const index = this.instruments.findIndex(h => h.id === instrumentObject.id)
      if (index !== -1){
        this.instruments.splice(index, 1, instrumentObject)
        this.currentInstrument = instrumentObject
      }
    },
    reset(){
      this.currentInstrument = {}
      this.instruments = []
      this.filteredInstruments = []
    }
  },
  getters: {
    getInstrument(){
      return this.currentInstrument
    },
    getInstruments(){
      return this.instruments
    },
    getFilteredInstruments(){
      return this.filteredInstruments
    }
  }
})
