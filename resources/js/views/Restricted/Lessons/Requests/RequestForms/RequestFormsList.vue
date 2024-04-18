<template>
  <div v-if="formData.schools">
    <HeaderLine heading="Manage Lesson Request Forms" link1="Lesson Requests" @link1="routeChange('RequestsList')"/>
    <p>Create and manage online forms and get lesson signups digitally.</p>
    
    <div class="row" v-if="formData.schools.length > 1">
      <h2>School to Manage:</h2>
      <div class="col col-12 col-md-6">
        <select name="school" id="school" class="form-control" v-model="formData.school">
          <option v-for="school in formData.schools" :key="school.id" :value="school.id">{{ school.name }}</option>
        </select>
      </div>
    </div>

    <div class="row mt-3" v-if="formData.forms">
      <div class="col col-12 col-md-6">
        <h2>Existing Forms:</h2>
        <LoadingSpinner :isLoading="schoolStore.loading" color="primary" />
        <div id="form-container" v-if="!schoolStore.loading">
          <div v-for="form in formData.forms" :key="form" class="form">
            <div @click="viewFormDetails(form)">
              <span>{{ form.attributes.description }}</span>
              <span class="float-end">{{ moment(form.timestamp.created).format('DD-MM-YYYY') }}</span>
            </div>
          </div>
          <div v-if="formData.forms.length < 1" id="no-form">No Lesson Request Forms To Display...</div>
        </div>
        <!-- <div class="btn btn-primary create">Create New Form</div> -->
      </div>
      <p v-if="windowSize.width < 1030">Forms cannot be created or edited on a mobile device.</p>
    </div>


  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue'
import { onMounted, ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import { useLessonsStore } from '/resources/js/stores/lessons';
import moment from 'moment';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useUserStore } from '/resources/js/stores/user';
import { useActionsStore } from '../../../../../stores/actions';
import LoadingSpinner from '../../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';
import { useSchoolStore } from '../../../../../stores/schools';
import { useStaffStore } from '../../../../../stores/staff';

// Initiate Stores
const lessonStore = useLessonsStore()
const schoolStore = useSchoolStore()
const staffStore = useStaffStore()
const user = useUserStore()
const actions = useActionsStore()

// Initiate Composables
const router = useRouter()
const { windowSize } = useWindowSize()

// Initiate Data Variables
const formData = ref({
  schools: [],
  school: '',
  forms: []
})

// Set Actions for User
function setActions() {
  let actionsArray = []
  if(user.hasPermissionAny('LESSON_REQ_C')) {
    actionsArray.push({ header: 'Create Request Form', to: { name: 'RequestFormsList' }, modal: 'CreateLessonRequestform', icon: 'fa-solid fa-add'})
  }
  actions.setItems(actionsArray)
}
setActions()


function setSchools(){
  schoolStore.getSchools.forEach(school => {
    if(user.hasPermission('LESSON_FRM_C', school.id)){
      formData.value.schools = [...formData.value.schools, school]
    }
  });
  formData.value.school =formData.value.schools[0].id
}


// Fetch school forms when school is selected
watch(() => formData.value.school, (newValue) => {
  schoolStore.setSchool(newValue)
  staffStore.fetchStaff(newValue)
  const {data: forms, fetchData: fetchSchoolForms} = useApi('school-lesson-request-forms/' + newValue)
  fetchSchoolForms().then(()=>{
    formData.value.forms = forms.value
  })
})

function viewFormDetails(form){
  if(windowSize.value.width > 1030) {
    lessonStore.setRequestForm(form)
    router.push({
      name: 'RequestFormDetails'
    })
  }
}

// Handle Route Change
function routeChange(route){
  lessonStore.setRequestForm()
  router.push({
    name: route
  })
}

onMounted(async ()=>{
  await schoolStore.fetchSchools()
  setSchools()
})

</script>

<style lang="scss" scoped>
h2 {
  font-size: 1.5rem;
}
#form-container {
  border: 1px solid $ah-grey-lightest;
  .form {
    padding: 5px 10px;
    &:nth-of-type(odd){
      background-color: $ah-primary-background;
      //border-radius: 0.375rem;
    }
    &:hover {
      background-color: $ah-primary-light;
      color: white;
      cursor: pointer;
    }
  }
  #no-form {
    padding: 10px;
  }
}
.create {
  width: 100%;
  border-radius: 0.375rem;
  border-top-right-radius: 0;
  border-top-left-radius: 0;
}

</style>