import { forEach } from "lodash";
import { defineStore } from "pinia";
import axiosClient from "../axios";

function getState(){
    return {
      user: {
        id: 0,
        first_name: "",
        last_name: "",
        image: "",
        email: '',
        // admin: false,
      },
      permissions: [],
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
      this.setUser(res)
    },
    setUser(res){
      let user = res.data.data.user
      this.user.id = user.id
      this.user.first_name = user.first_name
      this.user.last_name = user.last_name
      this.user.image = user.image
      this.user.email = user.email
      this.user.schools = user.schools
      // this.user.schoolAdmin = user.is_admin
      this.permissions = user.permissions
      this.token = res.data.data.token
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
