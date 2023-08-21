import { defineStore } from "pinia";

function getState(){
    return {
      singleStaff: {},
      staffList: [],
      subject: {}
    }
}

export const useStaffStore = defineStore('staff', {
  state: () => (getState()),
  actions: {
    setStaff(staffObject){
      this.singleStaff = staffObject
    },
    setStaffList(staffArray){
      this.staffList = staffArray
    },
    setSubject(subject){
      this.subject = subject
    },
  },
  getters: {
    getStaff(){
      return this.singleStaff
    },
    getStaffList(){
      return this.staffList
    },
    getSubject(){
      return this.subject
    }
  }
})
