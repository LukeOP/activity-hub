import { defineStore } from "pinia";

function getState(){
    return {
      currentStudent: {},
      students: [],
      filteredStudents: []
    }
}

export const useStudentStore = defineStore('students', {
  state: () => (getState()),
  actions: {
    setStudent(studentObject){
      this.currentStudent = studentObject
    },
    setStudents(studentArray){
      this.students = studentArray
    },
    setFilteredStudents(studentArray){
      this.filteredStudents = studentArray
    },
    reset(){
      this.currentStudent = {}
      this.students = []
    }
  },
  getters: {
    getStudent(){
      return this.currentStudent
    },
    getStudents(){
      return this.students
    },
    getFilteredStudents(){
      return this.filteredStudents
    }
  }
})
