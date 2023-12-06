<template>
    <div>
      <HeaderLine heading="Bulk Update Student Data" />
      <div class="warning">WARNING: Updating student data in bulk is a destructive action that cannot be undone.<br>
          Ensure that your files are correct before proceeding.
      </div>
      <div class="row mt-3">
          <div class="col-col-12 col-md-6">
              <div class="mt-3">
                  <h2>File Format:</h2>
              </div>
          </div>
          <div class="col col-12 col-md-6">
              <label>School
                  <select class="form-control" v-model="selectedSchool">
                    <option v-for="school in user.getSchools" :key="school" :value="school">{{ school.name }}</option>
                </select>
            </label>
            <div class="mt-3" v-if="selectedSchool.id">
                <h2>Upload Student List</h2>

                <input type="checkbox" v-model="unenrollStudents">

                <span class="mx-2">Un-enroll Students not in csv file</span>

                <br>
                <input type="file" ref="fileInput" @change="handleFileChange"  id="fileInput"/>
                <button class="btn btn-primary" @click="uploadCsv" :disabled="uploading">Upload Student CSV</button>
            </div>
        </div>
    </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import axiosClient from '/resources/js/axios';
import { useUserStore } from '/resources/js/stores/user';
import { useToastStore } from '/resources/js/stores/toast';
import { useStudentStore } from '/resources/js/stores/students';
  
  const user = useUserStore()
  const toast = useToastStore()
  const studentStore = useStudentStore()
  const selectedSchool = ref({})
  const unenrollStudents = ref(false)
  const uploading = ref(false)
  const file = ref(null);
  
  const handleFileChange = (event) => {
    file.value = event.target.files[0];
  };
  
  const uploadCsv = () => {
    uploading.value = true;
    const formData = new FormData();
    formData.append('csv_file', file.value);
    formData.append('unenroll', unenrollStudents.value);

    axiosClient
        .post('update-students-bulk/' + selectedSchool.value.id, formData)
        .then((response) => {
        studentStore.setStudents(response.data.students);
        uploading.value = false;
        toast.open('success', 'Upload Successful', 'Student Data has been updated.');

        // Reset the file input and related state after successful submission
        resetFileInput();
        })
        .catch((error) => {
        console.error('Error uploading CSV:', error);
        uploading.value = false;
        toast.open('error', 'Error During Upload', error.message);

        // Reset the file input and related state after an error
        resetFileInput();
        });
    };

    const resetFileInput = () => {
        // Reset the file input by clearing its value
        const fileInput = document.getElementById('fileInput');
        if (fileInput) {
            fileInput.value = '';
        }

        // Reset other related state
        file.value = null;
        unenrollStudents.value = false;
    };


  </script>
  
  <style lang="scss" scoped>
  .warning {
    color: $ah-warning;
    font-size: 1rem;
    border: 1px dashed $ah-warning;
    // width: fit-content;
    padding: 10px;
    text-align: center;
  }
  label {
    width: 100%;
  }
  </style>
  