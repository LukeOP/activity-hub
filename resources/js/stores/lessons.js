import { defineStore } from "pinia";

function getState(){
    return {
      singleLesson: {},
      lessons: []
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
    addAttendanceRecord(record){
      this.singleLesson.attendance = [record, ...this.singleLesson.attendance]
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
    }
  },
  getters: {
    getLessonData(){
      return this.singleLesson
    },
    getLessonsData(){
      return this.lessons
    }
  }
})
