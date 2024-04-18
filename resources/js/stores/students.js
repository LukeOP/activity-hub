import { defineStore } from "pinia";

function getState(){
    return {
      currentStudent: '',
      students: [],
      filteredStudents: []
    }
}

export const useStudentStore = defineStore('students', {
  state: () => (getState()),
  actions: {
    setStudent(student_id){
      this.currentStudent = student_id
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
      }
    },
    reset(){
      this.currentStudent = ''
      this.students = []
    }
  },
  getters: {
    getStudent(){
      return this.students.find(s => s.id == this.currentStudent)
    },
    getStudents(){
      return this.students
    },
    getFilteredStudents(){
      return this.filteredStudents
    }
  }
})
