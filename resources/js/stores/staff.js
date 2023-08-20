import { defineStore } from "pinia";

function getState(){
    return {
      singleStaff: {},
      staffList: []
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
  },
  getters: {
    getStaff(){
      return this.singleStaff
    },
    getStaffList(){
      return this.staffList
    }
  }
})
