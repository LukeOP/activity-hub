import { defineStore } from "pinia";
import { useCalendarEventFormatter } from '../composables/useCalendarEventFormatter'
import axiosClient from '../axios'

function getState(){
    return {
      data: [],
      eventData: []
    }
}

export const useCalendarStore = defineStore('calendar', {
  state: () => (getState()),
  actions: {
    setData(data){
      this.data = data
    },
    async loadData(){
      const formatEvent = useCalendarEventFormatter()
      const res = await axiosClient.get('/calendar-events')
      this.data = formatEvent(res.data.data)
    },
    setEventData(data){
      this.eventData = data
    },
    addAttendanceRecord(newAttendance){
      const lessonToUpdate = this.getData.find(lesson => lesson.reference_type_id === newAttendance.lesson_id)
      if(lessonToUpdate){
        lessonToUpdate.attendance.push(newAttendance)
      }
    },
    updateAttendanceRecord(updatedAttendance){
      const lessonToUpdate = this.getData.find(lesson => lesson.reference_type_id === updatedAttendance.lesson_id)
      if(lessonToUpdate){
        const attendanceToUpdate = lessonToUpdate.attendance.find(attendance => attendance.id === updatedAttendance.id)

        if(attendanceToUpdate){
          Object.assign(attendanceToUpdate, updatedAttendance)
        }
      }
    }
  },
  getters: {
    getData(){
      return this.data
    },
    getEventData(){
      return this.eventData
    },
  }
})
