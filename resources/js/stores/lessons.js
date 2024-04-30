import { defineStore } from "pinia";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      singleLesson: '',
      lessons: [],
      filteredLessons: [],
      singleAttendance: '',
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
    setLesson(lesson_id){
      this.singleLesson = lesson_id
    },
    setLessons(lessonsArray){
      this.lessons = lessonsArray
    },
    setFilteredLessons(lessonsArray){
      this.filteredLessons = lessonsArray
    },
    updateLessonRecord(record){
      this.lessons = this.lessons.filter(l => l.id != record.id)
      this.lessons = [record, ...this.lessons]
    },
    setAttendance(attendance_id){
      this.singleAttendance = attendance_id
    },
    setRequest(request_id){
      this.singleRequest = request_id
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
      this.getLessonData.attendance = [record, ...this.getLessonData.attendance]
    },
    addAttendanceRecordByIndex(record, index){
      // console.log(record, index)
      this.getLessonData.attendance = this.getLessonData.attendance.splice(index, 0, record)
    },
    updateAttendanceRecord(record){
      this.getLessonData.attendance = this.getLessonData.attendance.filter(a => a.id != record.id)
      this.addAttendanceRecord(record)
    },
    updateLessonRecord(record){
      const index = this.lessons.findIndex(l => l.id === record.id)
      if( index != -1){
        this.lessons.splice(index, 1, record)
      }
    },
    addNote(note){
      this.getLessonData.notes = [note, ...this.getLessonData.notes]
    },
    updateNotes(notes){
      this.getLessonData.notes = notes
    },
    deleteNote(note){
      let notes = this.getLessonData.notes.filter(n => n.id != note.id)
      this.updateNotes(notes)
    },
  },
  getters: {
    getLessonData(){
      return this.lessons.find(l => l.id == this.singleLesson) ? this.lessons.find(l => l.id == this.singleLesson) : ''
    },
    getLessonsData(){
      return this.lessons
    },

    // ATTENDANCE
    getAttendanceArray(){
      let array = []
      this.lessons.forEach(lesson => {
        lesson.attendance.forEach(a => {
          array.push(
            {
            id: a.id,
            lesson_id: lesson.id,
            date: a.date,
            time: a.time,
            instrument: lesson.attributes.instrument,
            attendance: a.attendance,
            funding_type: lesson.attributes.funding_type,
            recorded_by: a.user_id,
            student: {
              id: lesson.student.id,
              first_name: lesson.student.first_name,
              last_name: lesson.student.last_name,
              full_name: lesson.student.first_name + ' ' + lesson.student.last_name,
            },
            tutor: {
              id: lesson.tutor.id,
              first_name: lesson.tutor.first_name,
              last_name: lesson.tutor.last_name,
              full_name: lesson.tutor.first_name + ' ' + lesson.tutor.last_name,
            },
            school: {
              id: lesson.school.id,
              name: lesson.school.name
            }
          }
        )
        })
      });
      return array
    },
    getAttendance(){
      return this.getAttendanceArray.find(a => a.id == this.singleAttendance)
    },

    // NOTES
    getLessonNotes(){
      return this.getLessonData.notes
    },
    getLessonNotesAndAttendance(){
      const lessonNotes = this.getLessonNotes.filter(n => n.attendance_id != null)
      const combinedArray = lessonNotes.map(note => {
        const matchingAttendance = this.getAttendanceArray.find(attendance => attendance.id === note.attendance_id);
        return {
          ...note,
          attendance: matchingAttendance
        }
      })
      return combinedArray
    },

    // REQUESTS
    getRequest(){
      return this.lessonRequests.find(r => r.id == this.singleRequest)
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
