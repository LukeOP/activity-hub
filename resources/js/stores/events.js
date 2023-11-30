import { defineStore } from "pinia";

function getState(){
    return {
      singleEvent: {},
      events: [],
      filteredEvents: [],
      eventJobs: [],
      singleJob: {},
      eventData: {}
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
    setEventJobs(eventJobsArray){
      this.eventJobs = eventJobsArray
    },
    setSingleJob(eventJobObject){
      this.singleJob = eventJobObject
    },
    setEventData(eventData){
      this.eventData = eventData
    },
    addEvent(eventObject){
      this.events = [...this.events, eventObject]
    },
    removeEvent(eventId){
      this.events = this.events.filter(e => e.id != eventId)
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
    },
    getEventJobs(){
      return this.eventJobs
    },
    getSingleJob(){
      return this.singleJob
    },
    getEventData(){
      return this.eventData
    }
  }
})
