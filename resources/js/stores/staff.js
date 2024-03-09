import { defineStore } from "pinia";
import axiosClient from "../axios";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      singleStaff: {},
      staffList: [],
      subject: {},
      schoolInvites: []
    }
}

export const useStaffStore = defineStore('staff', {
  state: () => (getState()),
  actions: {
    async fetchStaff() {
      this.isLoading = true;
    
      const { data: staff, error, fetchData } = useApi('school-users/5f6a486f-ae48-4755-be6c-0d86ef491f68');
      
      try {
        await fetchData();
        
        if (error.value) {
          throw new Error(error.value); // Throw an error if API request fails
        }
    
        // Update store state with fetched data
        this.setStaffList(staff.value);
      } catch (error) {
        console.error('Error fetching data: ', error);
      } finally {
        this.isLoading = false;
      }
    },
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
        this.singleStaff.permissions.push(res.data)
      })
    },
    removePermission(id){
      axiosClient.delete('user-permissions/' + id).then(res => {
        if(res.data.message === 'successfully deleted'){
          const permissionIndex = this.getStaff.permissions.findIndex(permission => ( permission.id === id ));
          this.singleStaff.permissions.splice(permissionIndex, 1)
        }
      })
    },
    setSchoolInvites(value){
      this.schoolInvites = value
    },
    updateSchoolInvites(school_id){
      axiosClient.get('school-invitations/' + school_id).then((res)=>{
        this.schoolInvites = res.data
      })
    },
    reset(){
      this.singleStaff = {},
      this.staffList = [],
      this.subject = {}
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
    },
    getSchoolInvites(){
      return this.schoolInvites
    },
    getSubjects(){
      if (!this.staffList.length) {
        this.fetchStaff();
        return;
      }
    
      var subjectTitlesSet = new Set();
    
      this.staffList.forEach(function(person) {
        person.subjects.forEach(function(subject){
          subjectTitlesSet.add(subject.title)
        })
      })
    
      var subjectTitles = Array.from(subjectTitlesSet);
      return subjectTitles;
    }
  }
})
