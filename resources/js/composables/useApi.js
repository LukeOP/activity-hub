import { ref } from 'vue';
import axiosClient from '../axios'

export default function useApi(url, requestData = null, method = 'GET' ) {
  const data = ref(null);
  const error = ref(null);
  const loading = ref(false);

  const fetchData = async () => {
    loading.value = true;
    try {
      let response
      if (method === 'GET'){
        response = await axiosClient.get(url)
      } else if (method === 'POST') {
        response = await axiosClient.post(url, requestData)
      } else if (method === 'PATCH') {
        response = await axiosClient.patch(url, requestData)
      } else if (method === 'DELETE') {
        response = await axiosClient.delete(url)
      }
      data.value = response.data;
    } catch (e) {
      error.value = e;
      console.error(e.response.data.message);
    } finally {
      loading.value = false;
    }
  };
  
  return { data, error, loading, fetchData };
}
