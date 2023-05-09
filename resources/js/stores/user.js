import { forEach } from "lodash";
import { defineStore } from "pinia";
import axiosClient from "../axios";

function getState(){
    return {
      user: {
        id: 0,
        first_name: "",
        last_name: "",
        email: '',
        // admin: false,
      },
      token: '',
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
      if(res.data.data.user.is_admin.length < 1) this.setUser(res)
      else this.setAdmin(res)
    },
    setUser(res){
      console.log('Logging In Tutor User')
      let user = res.data.data.user
      this.user.id = user.id
      this.user.first_name = user.first_name
      this.user.last_name = user.last_name
      this.user.email = user.email
      this.user.schools = user.schools
      // this.user.admin = false
      this.token = res.data.data.token
    },
    setAdmin(res){
      console.log('Logging In Admin User')
      let user = res.data.data.user
      this.user.id = user.id
      this.user.first_name = user.first_name
      this.user.last_name = user.last_name
      this.user.email = user.email
      this.user.schools = user.schools
      this.user.schoolAdmin = user.is_admin[0]
      this.token = res.data.data.token
      // this.user.admin = true
    },
    async logout(){
      const res = await axiosClient.post('/logout')
      this.user = {}
      this.token = ''
    }
  },
  getters: {
    getToken(){
      return this.token
    },
  }
})
