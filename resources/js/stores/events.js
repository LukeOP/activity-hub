import { defineStore } from "pinia";

function getState(){
    return {
      singleEvent: {},
      events: [],
      filteredEvents: []
    }
}

export const useEventStore = defineStore('events', {
  state: () => (getState()),
  actions: {
    setEvent(eventObject){
      this.singleEvent = eventObject
    },
    setEvents(eventsArray){
      this.events = eventsArray
    },
    setFilteredEvents(eventsArray){
      this.filteredEvents = eventsArray
    },
    reset(){
      this.singleEvent = {}
      this.events = []
    },
  },
  getters: {
    getEvent(){
      return this.singleEvent
    },
    getEvents(){
      return this.events
    },
    getFilteredEvents(){
      return this.filteredEvents
    }
  }
})
