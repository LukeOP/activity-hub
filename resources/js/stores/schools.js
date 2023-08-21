import { defineStore } from "pinia";

function getState(){
    return {
      currentSchool: {},
    }
}

export const useSchoolStore = defineStore('school', {
  state: () => (getState()),
  actions: {
    setSchool(schoolObject){
      this.currentSchool = schoolObject
    },
  },
  getters: {
    getSchool(){
      return this.currentSchool
    },
  }
})
