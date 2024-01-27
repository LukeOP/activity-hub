<template>
  <div>
    <a :href="downloadUrl" class="btn btn-primary mt-2 ms-2" :download="downloadFileName">Download File</a>
  </div>
</template>

<script>
import axiosClient from '/resources/js/axios';

export default {
  props: {
    id: {
      type: String,
      // required: true,
    },
  },
  data() {
    return {
      downloadUrl: '',
      downloadFileName: '', // Add a property to store the download file name
    };
  },
  mounted() {
    this.fetchDownloadUrl();
  },
  methods: {
    async fetchDownloadUrl() {
      try {
        const response = await axiosClient.get(`document/download/1f500249-0cd5-44b2-9a23-fd0bb5f8340f`, {
          responseType: 'arraybuffer',
        });

        // Get the content-disposition header from the response
        const contentDisposition = response.headers['content-disposition'];
        
        // Extract the file name from the content-disposition header
        const match = contentDisposition.match(/filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/);
        console.log(match[1]);
        let serverFileName = match ? match[1] : 'downloaded_file.pdf';
        console.log(serverFileName);
        serverFileName = serverFileName.replace(/^[\d_]+/, '')
        
        const blob = new Blob([response.data], { type: 'application/pdf' });
        const downloadUrl = window.URL.createObjectURL(blob);

        // Set both downloadUrl and downloadFileName
        this.downloadUrl = downloadUrl;
        this.downloadFileName = serverFileName;
      } catch (error) {
        console.error('Error fetching download URL', error);
      }
    },
  },
};
</script>
