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
    addStudent(studentObject){
      this.students = [...this.students, studentObject]
    },
    updateStudent(studentObject){
      const index = this.students.findIndex(s => s.id === studentObject.id)
      if (index !== -1){
        this.students.splice(index, 1, studentObject)
        this.currentStudent = studentObject
      }
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
