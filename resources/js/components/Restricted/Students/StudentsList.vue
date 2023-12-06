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

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import StudentsTable from './ListComponents/StudentsTable.vue'
import StudentsTableMobile from './ListComponents/StudentsTableMobile.vue'
import { useStudentStore } from '/resources/js/stores/students';
import { computed, ref } from 'vue';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import HeaderLine from '../../Layouts/MainLayout/Elements/HeaderLine.vue';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '/resources/js/stores/actions';

// Initiate Stores
const studentStore = useStudentStore()
const user = useUserStore()
const actions = useActionsStore()

// Initiate Composables
const { windowSize } = useWindowSize()

// Get appropriate component based on window size
const currentComponent = computed(() => {
  return windowSize.value.width > 1030 ? StudentsTable : StudentsTableMobile
})

// Fetch Student data and add to store
const { data: allStudents, fetchData: fetchStudents } = useApi('students')
if(studentStore.getStudents.length < 1){
  fetchStudents().then(()=>{
    studentStore.setStudents(allStudents.value)
  })
}

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

</script>

<style lang="scss" scoped>

</style>