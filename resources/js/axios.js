import axios from 'axios'
import { useUserStore } from './stores/user'

const axiosClient = axios.create({
  baseURL: import.meta.env.VITE_URL + '/api',
  headers: {
    'Accept': 'application/vnd.api+json',
    'Content-Type': "application/vnd.api+json",
    'Access-Control-Allow-Origin': import.meta.env.VITE_URL
  }
})

axiosClient.interceptors.request.use(config => {
  const userStore = useUserStore()
  config.headers.Authorization = `Bearer ${userStore.getToken}`
  return config;
})

export default axiosClient
