import { defineStore } from "pinia";
import axiosClient from "../axios";
import { useMainStore } from './_main'


function getState(){
    return {
      attributes: {
        id: 0,
        first_name: "",
        last_name: "",
        image: "",
        email: '',
        phone: '',
        // admin: false,
        schools: [],
      },
      permissions: [],
      token: sessionStorage.getItem('AHT') || '',
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
    },
    setUser(user){
      this.attributes.id = user.id
      this.attributes.first_name = user.first_name
      this.attributes.last_name = user.last_name
      this.attributes.image = user.image
      this.attributes.email = user.email
      this.attributes.phone = user.phone
      this.attributes.schools = user.schools
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
      }
    },
    async logout(){
      const res = await axiosClient.post('/logout')
      this.attributes = {}
      this.token = ''
      sessionStorage.removeItem('AHT')
      this.resetStores()
    },
    hasPermission(permission, school){
      if(this.permissions.find(p => ((p.type === permission || p.type === 'administrator') && p.school_id === school))){
        return true
      }
      else return false
    },
    hasPermissionAny(permission){
      if(this.permissions.find(p => (p.type === permission || p.type === 'administrator'))){
        return true
      }
      else return false
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
      return this.attributes.first_name + ' ' + this.attributes.last_name
    },
    getPermissions(){
      return this.permissions
    },
    getSchools(){
      return this.attributes.schools
    }
  }
})
