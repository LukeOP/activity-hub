import { defineStore } from "pinia";
import axiosClient from "../axios";
import { useMainStore } from './_main'
import { useStaffStore } from "./staff";
import { useSchoolStore } from "./schools";


function getState(){
    return {
      attributes: {
        id: 0,
        first_name: "",
        last_name: "",
        image: "",
        email: '',
        phone: '',
        schools: [],
      },
      permissions: [],
      token: sessionStorage.getItem('AHT') || '',
      timezone: ''
    }
}

export const useUserStore = defineStore('user', {
  state: () => (getState()),
  actions: {
    async register(userObject){
      const res = await axiosClient.post('/register', userObject)
      return res.data
    },
    async login(userObject){
      const res = await axiosClient.post('/login', userObject)
      // console.log('login: ', res.data.data)
      this.setUser(res.data.data.user)
      this.setToken(res.data.data.token)
      this.setPermissions(res.data.data.user.permissions)
      this.timezone = res.data.data.user.timezone
    },
    setUser(user){
      this.attributes.id = user.id
      this.attributes.first_name = user.first_name
      this.attributes.last_name = user.last_name
      this.attributes.image = user.image
      this.attributes.email = user.email
      this.attributes.phone = user.phone
      this.attributes.schools = user.schools
      this.setStores()
    },
    setStores(){
      const schoolStore = useSchoolStore()
      schoolStore.setSchools(this.attributes.schools)
      schoolStore.setSchool(this.attributes.schools[0])
    },
    setPermissions(permissions){
      this.permissions = permissions
    },
    setToken(token){
      this.token = token
      sessionStorage.setItem('AHT', token)
    },
    async resetUserWithToken(){
      if(sessionStorage.getItem('AHT')) {
        const res = await axiosClient.get('token-user/' + sessionStorage.getItem('AHT'))
        // console.log('reset: ', res.data.permissions)
        this.setUser(res.data.user)
        this.setPermissions(res.data.permissions)
        this.setToken(sessionStorage.getItem('AHT'))
        this.timezone = res.data.user.timezone
      }
    },
    async logout(){
      const res = await axiosClient.post('/logout')
      sessionStorage.removeItem('AHT')
      this.attributes = {}
      this.permissions = [],
      this.token = ''
      this.timezone = ''
      this.resetStores()
    },
    hasPermission(permission, school){
      if(this.permissions.find(p => ((p.type === permission || p.type === 'Administrator') && p.school_id === school))){
        return true
      }
      else return false
    },
    hasPermissionAny(permission){
      if(this.permissions.find(p => (p.type === permission || p.type === 'Administrator'))){
        return true
      }
      else return false
    },
    addFundingData(data){
      let school = this.attributes.schools.find(s => s.id === data.school_id)
      school.data.funding.push(data)
    },
    removeFundingData(data){
      const school = this.attributes.schools.find(s => s.id === data.school_id)
      const dataIndex = school.data.funding.findIndex(f => f.id === data.id )
      if (dataIndex !== -1){
        school.data.funding.splice(dataIndex, 1)
      }
    },
    resetStores(){
      const mainStore = useMainStore()
      mainStore.resetStores()
    }
  },
  getters: {
    getToken(){
      return this.token
    },
    getName(){
      let name = ''
      if(this.attributes.first_name != undefined && this.attributes.last_name != undefined){
        name = this.attributes.first_name + ' ' + this.attributes.last_name
      }
      return name
    },
    getPermissions(){
      return this.permissions
    },
    getSchools(){
      return this.attributes.schools || []
    },
    getAttributes(){
      return this.attributes
    },
    getAdminSchools(){
      var AdminSchoolsSet = new Set();
    
      this.permissions.forEach(function(permission) {
        if(permission.type == 'Administrator') AdminSchoolsSet.add(permission.school_id)
        })
    
      let schoolIds = Array.from(AdminSchoolsSet)

      const AdminSchools = this.attributes.schools.filter(school => schoolIds.includes(school.id))

      return AdminSchools
    }
  }
})
