import axios from 'axios'
import { useUserStore } from './stores/user'

let url = ''
if(import.meta.env.VITE_ENV === 'production') url = 'https://activityhub.co.nz'
else if(import.meta.env.VITE_ENV === 'demo') url = 'https://demo.activityhub.co.nz'
else if(import.meta.env.VITE_ENV === 'development') url = 'http://dev.activityhub.co.nz'
else if(import.meta.env.VITE_ENV === 'local') url = 'http://localhost:8000'
else url = 'http://localhost:8000'

console.log('BASE URL: ', url, 'ENV: ', import.meta.env;

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
