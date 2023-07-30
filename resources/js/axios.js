import axios from 'axios'
import { useUserStore } from './stores/user'


let url = ''
if(import.meta.env.VITE_ENV === 'production') url = 'http://activityhub.co.nz'
else url = 'http://localhost:8000'


const axiosClient = axios.create({
  baseURL: url + '/api',
  headers: {
    'Accept': 'application/vnd.api+json',
    'Content-Type': "application/vnd.api+json",
    'Access-Control-Allow-Origin': url
  }
})

axiosClient.interceptors.request.use(config => {
  const userStore = useUserStore()
  config.headers.Authorization = `Bearer ${userStore.getToken}`
  return config;
})

export default axiosClient