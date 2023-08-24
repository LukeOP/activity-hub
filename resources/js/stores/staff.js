import { defineStore } from "pinia";
import axiosClient from "../axios";

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
    setPermission(user_id, school_id, permission){
      axiosClient.post('user-permissions', {user_id: user_id, school_id: school_id, permission_type: permission}).then(res => {
        this.singleStaff.permissions.push(res.data.data)
      })
    },
    removePermission(id){
      axiosClient.delete('user-permissions/' + id).then(res => {
        if(res.data.message === 'successfully deleted'){
          const permissionIndex = this.getStaff.permissions.findIndex(permission => ( permission.id === id ));
          this.singleStaff.permissions.splice(permissionIndex, 1)
        }
      })
    }
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
