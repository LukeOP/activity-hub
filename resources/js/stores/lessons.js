import { defineStore } from "pinia";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      singleLesson: {},
      lessons: [],
      filteredLessons: [],
      selectedLessons: [],
      singleAttendance: {},
      attendanceArray: [],
      singleRequest: {},
      lessonRequests: [],
      lessonRequestForm: {},
      formPreview: {},
      loading: false
    }
}

export const useLessonsStore = defineStore('lessons', {
  state: () => (getState()),
  actions: {
    async fetchLessons() {
      this.loading = true;
      const { data: Lessons, error, fetchData } = useApi('lessons');
      try {
        await fetchData();
        if (error.value) {
          throw new Error(error.value)
        }
        // Update store state with fetched data
        this.setLessons(Lessons.value)
      } catch (error) {
        console.error('Error fetching data: ', error);
      } finally {
        this.loading = false;
      }
    },
    checkLessonData(){
      if(this.lessons.length < 1){
        this.fetchLessons()
      }
    },
    setLesson(lessonObject){
      this.singleLesson = lessonObject
    },
    setLessons(lessonsArray){
      this.lessons = lessonsArray
    },
    setFilteredLessons(lessonsArray){
      this.filteredLessons = lessonsArray
    },
    setSelectedLessons(lessonsArray){
      this.selectedLessons = lessonsArray
    },
    updateLessonRecord(record){
      this.lessons = this.lessons.filter(l => l.id != record.id)
      this.lessons = [record, ...this.lessons]
      this.singleLesson = record
    },
    setAttendanceArray(attendanceArray){
      this.attendanceArray = attendanceArray
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
    updateLessonRecord(record){
      const index = this.lessons.findIndex(l => l.id === record.id)
      if( index != -1){
        this.lessons.splice(index, 1, record)
        this.singleLesson = record
      }
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
    getSelectedLessons(){
      return this.selectedLessons
    },
    getAttendanceArray(){
      return this.attendanceArray
    },
    getAttendance(){
      return this.singleAttendance
    },
    getLessonAttendance(){
      return this.singleLesson.attendance
    },
    getLessonNotes(){
      return this.singleLesson.notes
    },
    getLessonNotesAndAttendance(){
      const lessonNotes = this.getLessonNotes.filter(n => n.attendance_id != null)
      const combinedArray = lessonNotes.map(note => {
        const matchingAttendance = this.getLessonAttendance.find(attendance => attendance.id === note.attendance_id);
        return {
          ...note,
          attendance: matchingAttendance
        }
      })
      return combinedArray
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
