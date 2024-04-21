import axios from 'axios'
import { useUserStore } from './stores/user'

// let url = 'https://activityhub.co.nz'
// if(import.meta.env.VITE_TITLE === '') url = 'https://activityhub.co.nz'
// else if(import.meta.env.VITE_TITLE === '[demo]') url = 'https://demo.activityhub.co.nz'
// else if(import.meta.env.VITE_ENV === '[development]') url = 'http://dev.activityhub.co.nz'
// else if(import.meta.env.VITE_ENV === 'local') url = 'http://localhost:8000'
// else url = 'http://localhost:8000'

console.log('VITE URL: ', import.meta.env.VITE_URL);

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
