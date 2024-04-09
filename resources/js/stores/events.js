import { defineStore } from "pinia";
import useApi from '/resources/js/composables/useApi';
import { useStaffStore } from "./staff";
import useSorter from "../composables/useSorter";

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
    setEvent(event_id){
      this.singleEvent = event_id
    },
    setEvents(eventsArray){
      this.events = eventsArray
    },
    setArchivedEvents(eventsArray){
      this.archivedEvents = eventsArray
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
    addEventJob(record){
      this.getEvent.jobs = [...this.getEvent.jobs, record]
    },
    updateEventRecord(record){
      let event = this.events.find(e => e.id == record.id)
      if(event){
        event.attributes = record.attributes
        event.jobs = record.jobs
        event.school = record.school
        event.timestamps = record.timestamps
        event.users = record.users
      }
    },
    updateEventJobRecord(record){
      const jobToUpdate = this.events
        .find(event => event.id === record.event_id)
        ?.jobs
        .find(job => job.id === record.id);
      if (jobToUpdate) {
        jobToUpdate.description = record.description;
        jobToUpdate.due_date = record.due_date;
        jobToUpdate.status = record.status;
        jobToUpdate.users = record.users;
        jobToUpdate.timestamps = record.timestamps;
      }
    },
    removeEventJob(record){
      this.getEvent.jobs = this.eventJobs.filter(j => j.id != record.id)
    },
    removeEventJobUser(record){
      let job = this.eventJobs.find(j => j.users.some(ju => ju.id == record.id))
      this.singleJob.users = job.users.filter(u => u.id != record.id)
    },
    // Template Jobs
    addTemplateJob(record){
      this.eventData.jobs = [...this.eventData.jobs, record]
    },
    updateTemplateJob(record){
      let job = this.getEventData.jobs.find(j => j.id == record.id)
      job.description = record.description
      job.priority = record.priority
    },
    removeTemplateJob(record){
      this.eventData.jobs = this.eventData.jobs.filter(j => j.id != record.id)
      this.singleJob = {}
    },
    addEvent(eventObject){
      this.events = [...this.events, eventObject]
    },
    removeEvent(eventId){
      this.events = this.events.filter(e => e.id != eventId)
    },
    reset(){
      this.events = []
    },
  },
  getters: {
    getEvent(){
      return this.events.find(e => e.id == this.singleEvent) ? this.events.find(e => e.id == this.singleEvent) : {}
    },
    getEvents(){
      return this.events.filter(e => e.attributes.archived == 0)
    },
    getArchivedEvents(){
      return this.events.filter(e => e.attributes.archived != 0)
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
    },
    getLinkedStaff(){
      let linkedStaff = []
      const staffStore = useStaffStore()
      let staffList = staffStore.getStaffList
      staffList.forEach(staff => {
        let schoolPermissions = staff.permissions.filter(p => p.school_id == this.getEvent.school.id)
        if(schoolPermissions.some(p => (p.type == 'EVENTS_V' || p.type == 'Administrator'))) {
          linkedStaff.push({attributes: {id: staff.id, first_name: staff.first_name, last_name: staff.last_name, image: staff.image}})
        }
      });
      this.getEvent.users.forEach(staff => {
        linkedStaff.push({attributes: staff})
      })
      return linkedStaff
    }
  }
})
