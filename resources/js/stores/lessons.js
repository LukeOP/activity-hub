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
