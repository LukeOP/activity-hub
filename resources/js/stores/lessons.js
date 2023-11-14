import { defineStore } from "pinia";

function getState(){
    return {
      singleLesson: {},
      lessons: [],
      singleAttendance: {},
      singleRequest: {},
      lessonRequests: [],
      lessonRequestForm: {},
      formPreview: {}
    }
}

export const useLessonsStore = defineStore('lessons', {
  state: () => (getState()),
  actions: {
    setLesson(lessonObject){
      this.singleLesson = lessonObject
    },
    setLessons(lessonsArray){
      this.lessons = lessonsArray
    },
    updateLessonRecord(record){
      console.log(record)
      this.lessons = this.lessons.filter(l => l.id != record.id)
      this.lessons = [record, ...this.lessons]
    },
    setAttendance(attendanceObject){
      this.singleAttendance = attendanceObject
    },
    setRequest(requestObject){
      this.singleRequest = requestObject
    },
    setRequests(requestArray){
      this.lessonRequests = requestArray
    },
    setRequestForm(requestObject){
      this.lessonRequestForm = requestObject
    },
    setFormPreview(formData){
      this.formPreview = formData
    },
    addAttendanceRecord(record){
      this.singleLesson.attendance = [record, ...this.singleLesson.attendance]
    },
    addAttendanceRecordByIndex(record, index){
      // console.log(record, index)
      this.singleLesson.attendance = this.singleLesson.attendance.splice(index, 0, record)
    },
    updateAttendanceRecord(record){
      // console.log('store: ', record)
      // let index = this.singleAttendance.attendance.findIndex(a => (a.id === record.id))
      this.singleLesson.attendance = this.singleLesson.attendance.filter(a => a.id != record.id)
      this.addAttendanceRecord(record)
    },
    addNote(note){
      this.singleLesson.notes = [note, ...this.singleLesson.notes]
    },
    updateNotes(notes){
      this.singleLesson.notes = notes
    },
    deleteNote(note){
      let notes = this.singleLesson.notes.filter(n => n.id != note.id)
      this.updateNotes(notes)
    },
  },
  getters: {
    getLessonData(){
      return this.singleLesson
    },
    getLessonsData(){
      return this.lessons
    },
    getAttendance(){
      return this.singleAttendance
    },
    getRequest(){
      return this.singleRequest
    },
    getRequests(){
      return this.lessonRequests
    },
    getRequestForm(){
      return this.lessonRequestForm
    },
    getFormPreview(){
      return this.formPreview
    }
  }
})
