<template>
    <div>
        <a v-if="downloadUrl != '' && !loading" :href="downloadUrl" class="btn btn-primary" :download="downloadFileName">{{ downloadFileName }}</a>
        <LoadingSpinner :isLoading="loading" class="btn btn-primary" :loadingText="true" style="width: fit-content;" />
    </div>
  </template>
  
  <script>
  import LoadingSpinner from './LoadingSpinner.vue';
  import axiosClient from '/resources/js/axios';
  
  export default {
    props: {
        id: {
            type: String,
            required: true,
        },
        label: {
            type: String,
            default: 'Download File'
        }
    },
    data() {
        return {
            downloadUrl: '',
            downloadFileName: '', // Add a property to store the download file name
            loading: false
        };
    },
    mounted() {
        this.fetchDownloadUrl();
    },
    methods: {
        async fetchDownloadUrl() {
            try {
                this.loading = true
                const response = await axiosClient.get(`document/download/${this.id}`, {
                    responseType: 'arraybuffer',
                });
                // Get the content-disposition header from the response
                const contentDisposition = response.headers['content-disposition'];
                // Extract the file name from the content-disposition header
                // const match = contentDisposition.match(/filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/);
                const match = contentDisposition.match(/filename[^;=\n]*=([^;\n]*)/);
                let serverFileName = match ? match[1] : 'downloaded_file';
                //   serverFileName = serverFileName.replace(/^[\d_]+/, '')
                const blob = new Blob([response.data], { type: 'application/pdf' });
                const downloadUrl = window.URL.createObjectURL(blob);
                // Set both downloadUrl and downloadFileName
                this.downloadFileName = serverFileName;
                this.downloadUrl = downloadUrl;
                this.loading = false
            }
            catch (error) {
                console.error('Error fetching download URL', error);
                this.loading = false
            }
        },
    },
    components: { LoadingSpinner }
};
  </script>
  