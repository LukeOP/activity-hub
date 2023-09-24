import { defineStore } from "pinia";

function getState(){
    return {
      currentSchool: {},
      schools: []
    }
}

export const useSchoolStore = defineStore('schools', {
  state: () => (getState()),
  actions: {
    setSchool(schoolObject){
      this.currentSchool = schoolObject
    },
    setSchools(schoolsArray){
      this.schools = schoolsArray
    },
    reset(){
      this.currentSchool = {}
      this.schools = []
    }
  },
  getters: {
    getSchool(){
      return this.currentSchool
    },
    getSchools(){
      return this.schools
    }
  }
})
