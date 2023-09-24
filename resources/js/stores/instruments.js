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
