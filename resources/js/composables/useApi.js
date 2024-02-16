import { ref } from 'vue';
import axiosClient from '../axios'

export default function useApi(url) {
  const data = ref(null);
  const error = ref(null);
  const loading = ref(false);
  
  const fetchData = async () => {
    loading.value = true;
    try {
      const response = await axiosClient.get(url);
      data.value = response.data;
    } catch (e) {
      error.value = e;
    } finally {
      // setTimeout(()=>{
        loading.value = false;
      // },3000)
    }
  };
  
  return { data, error, loading, fetchData };
}
