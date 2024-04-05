import { defineStore } from "pinia";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      singleEvent: {},
      events: [],
      filteredEvents: [],
      eventJobs: [],
      singleJob: {},
      eventData: {},
      loading: false
    }
}

export const useEventStore = defineStore('events', {
  state: () => (getState()),
  actions: {
    async fetchEvents(){
      this.loading = true;
      const { data: events, error, fetchData } = useApi('events');
      try {
        await fetchData();
        if (error.value) {
          throw new Error(error.value)
        }
        // Update store state with fetched data
        this.setEvents(events.value)
      } catch (error) {
        console.error('Error fetching data: ', error);
      } finally {
        this.loading = false;
      }

    },
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
    updateEventRecord(record){
      this.events = this.events.filter(e => e.id != record.id)
      this.events = [record, ...this.events]
      this.singleEvent = record
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
