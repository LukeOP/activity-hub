import { ref } from 'vue';
import axiosClient from '../axios'
import { useToastStore } from '../stores/toast';
import { useAppStore } from '../stores/appStore';

export default function useApi(url, requestData = null, method = 'GET', toastResponse = false ) {
  const data = ref(null);
  const error = ref(null);
  const loading = ref(false);
  const toast = useToastStore()
  const appStore = useAppStore()

  const fetchData = async () => {
    loading.value = true;
    appStore.setLoading(true)
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
      if(toastResponse) sendToast(response, 200)
    } catch (e) {
      error.value = e;
      // console.error(e.response ? e.response.data.message : e.message); // Log error message
      if (e.response) {
        const statusCode = e.response.status;
        // Pass status code to toast function if needed
        if (toastResponse) sendToast(e.response, statusCode);
      }
    } finally {
      loading.value = false;
      appStore.setLoading(false)
    }
  };

  function sendToast(response, statusCode){
    if(statusCode == 200){
      toast.open('success', response.data.status, response.data.message)
    } else {
      toast.open('error', response.data.status, response.data.message)
    }
  }
  
  return { data, error, loading, fetchData };
}
