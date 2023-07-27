import axios from 'axios'
import { useUserStore } from './stores/user'


let url = ''
// if(process.env.MIX_APP_ENV === 'production') url = 'https://activityhub.co.nz'
// else url = 'http://localhost:8000'
url = 'http://localhost:8000'


const axiosClient = axios.create({
  baseURL: url + '/api',
  headers: {
    'Accept': 'application/vnd.api+json',
    'Content-Type': "application/vnd.api+json",
  }
})

axiosClient.interceptors.request.use(config => {
  const userStore = useUserStore()
  config.headers.Authorization = `Bearer ${userStore.getToken}`
  return config;
})

export default axiosClient