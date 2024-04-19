import { defineStore } from "pinia";
import axiosClient from "../axios";
import useApi from '/resources/js/composables/useApi';

function getState(){
    return {
      singleStaff: {},
      staffList: [],
      subject: {},
      schoolInvites: [],
      permissionsArray: [
        { access: "Lessons", actions: ["LESSONS_R", "LESSONS_V", "LESSONS_E", "LESSONS_C", "LESSONS_D"], toolTip: "Can access lessons where they are the tutor assigned." },
        { access: "Lesson Requests", actions: ["", "LESSON_REQ_V", "LESSON_REQ_E", "LESSON_REQ_C", "LESSON_REQ_D"] },
        { access: "Lesson Forms", actions: ["", "", "LESSON_FRM_E", "LESSON_FRM_C", "LESSON_FRM_D"] },
        { access: "Attendance", actions: ["ATTENDANCE_R", "ATTENDANCE_V", "ATTENDANCE_E", "ATTENDANCE_C", "ATTENDANCE_D"], toolTip: "Can access attendance for the lessons where they are the tutor assigned." },
        { access: "Students", actions: ["STUDENTS_R", "STUDENTS_V", "STUDENTS_E", "STUDENTS_C", "STUDENTS_D"], toolTip: "Can access students they are assigned lessons with." },
        { access: "Events", actions: ["EVENTS_R", "EVENTS_V", "EVENTS_E", "EVENTS_C", "EVENTS_D"], toolTip: "Can access events they have been linked to." },
        { access: "Event Templates", actions: ["", "EVENTS_TEMP_V", "EVENTS_TEMP_E", "EVENTS_TEMP_C", "EVENTS_TEMP_D"] },
        { access: "Instruments", actions: ["", "INSTRUMENTS_V", "INSTRUMENTS_E", "INSTRUMENTS_C", "INSTRUMENTS_D"] },
        { access: "Hires", actions: ["", "HIRES_V", "HIRES_E", "HIRES_C", "HIRES_D"] },
        { access: "Hire Agreement Templates", actions: ["", "HIRES_TEMP_V", "HIRES_TEMP_E", "HIRES_TEMP_C", "HIRES_TEMP_D"] },
        // { access: "Rooms", actions: ["ROOMS_R", "ROOMS_V", "ROOMS_E", "ROOMS_C", "ROOMS_D"] },
        // { access: "Bookings", actions: ["BOOKINGS_R", "BOOKINGS_V", "BOOKINGS_E", "BOOKINGS_C", "BOOKINGS_D"] },
        { access: "Staff", actions: ["", "STAFF_V", "STAFF_E", "STAFF_C", "STAFF_D"] },
      ],
      loading: false
    }
}

export const useStaffStore = defineStore('staff', {
  state: () => (getState()),
  actions: {
    async fetchStaff(school_id) {
      this.loading = true;
      const { data: staff, fetchData } = useApi('school-users/' + school_id);
      try {
        await fetchData();
        // Update store state with fetched data
        this.setStaffList(staff.value.data)
      } catch (error) {
        console.error('Error fetching data: ', error);
      } finally {
        this.loading = false;
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
    async setPermission(user_id, school_id, permission) {
      try {
        const { data: newPermission, fetchData } = useApi('user-permissions', {user_id: user_id, school_id: school_id, permission_type: permission}, 'POST')
        await fetchData()
        this.singleStaff.permissions.push(newPermission.value)
      } catch (error) {
        console.error(error);
      }
    },
    async removePermission(id){
      try {
        const { fetchData } = useApi('user-permissions/' + id, '', 'DELETE')
        await fetchData('DELETE')
        const permissionIndex = this.singleStaff.permissions.findIndex(permission => permission.id === id )
        if (permissionIndex !== -1){
          this.singleStaff.permissions.splice(permissionIndex, 1)
        }
      } catch (error) {
        console.log(error);
      }
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
      var subjectTitlesSet = new Set();
    
      this.staffList.forEach(function(person) {
        person.subjects.forEach(function(subject){
          subjectTitlesSet.add(subject.title)
        })
      })
    
      return Array.from(subjectTitlesSet)
    }
  }
})
