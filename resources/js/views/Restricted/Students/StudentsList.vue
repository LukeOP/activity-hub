<template>
  <div class="row">
    <HeaderLine heading="Students" />
    <div class="col col-12 col-md-6">
      <!-- Search input -->
      <input type="text" class="form-control mb-2" placeholder="Student search..." v-model="search">
    </div>

    <!-- Table component -->
    <section v-if="filteredStudents">
      <component :is="currentComponent" />
    </section>
    <LoadingSpinner :isLoading="filteredStudents.length < 1 && loading" :loadingText="true" color="primary" />

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import StudentsTable from './ListComponents/StudentsTable.vue'
import StudentsTableMobile from './ListComponents/StudentsTableMobile.vue'
import { useStudentStore } from '/resources/js/stores/students';
import { computed, onMounted, ref } from 'vue';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import HeaderLine from '../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';
import LoadingSpinner from '/resources/js/components/Layouts/MainLayout/Elements/LoadingSpinner.vue'

// Initiate Stores
const studentStore = useStudentStore()
const user = useUserStore()
const actions = useActionsStore()

// Initiate Composables
const { windowSize } = useWindowSize()

const loading = ref(false)

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? StudentsTable : StudentsTableMobile
})

// Fetch Student data and add to store
const { data: allStudents, fetchData: fetchStudents } = useApi('students')


// Set side actions available on this page
const actionArray = []
if(user.hasPermissionAny('STUDENTS_C')){
  actionArray.push({ header: 'Add New Student', to: { name: 'StudentsList' }, modal: 'AddSingleStudent', icon: 'fa-solid fa-user-plus'})
  actionArray.push({ header: 'Bulk Update Students', to: { name: 'StudentsBulkUpdate' }, icon: 'fa-solid fa-user-plus'})
}
actions.setItems(actionArray)

// Initiate search variable
const search = ref('')

// Returns array of students based on search term, stores array in student Store
const filteredStudents = computed(() => {
  const searchTerm = search.value.toLowerCase();
  const filterFunction = s => (
    s.first_name.toLowerCase().includes(searchTerm) ||
    s.last_name.toLowerCase().includes(searchTerm)
  );

  const filtered = searchTerm.length > 0
    ? studentStore.getStudents.filter(filterFunction)
    : studentStore.getStudents;

  studentStore.setFilteredStudents(filtered);
  return filtered;
});

onMounted(() => {  
  loading.value = true
  setTimeout(() => {
    
    fetchStudents().then(()=>{
      if(allStudents.value != studentStore.getStudents){
        studentStore.setStudents(allStudents.value)
      }
      loading.value = false
    })
  }, 3000);
})

</script>

<style lang="scss" scoped>

</style>