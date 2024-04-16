<template>
  <div>
    <HeaderLine heading="Event Templates" link1="Events List" @link1="routeChange('EventsList')" />

    <section class="row">
      <div class="col col-12 col-md-6">
        <p>You can create a custom set of tasks that can be assigned to your events on creation.<br> This can considerably speed up common tasks that need to be completed for events.</p>
      </div>
      <div class="col col-12 col-md-6">
      </div>
    </section>

    <div class="row">
      <div class="col col-12 col-md-6">
        <section>
          <div v-if="formData.schools.length > 1">
            <h2>School to Manage:</h2>
              <select name="school" id="school" class="form-control" v-model="formData.school">
                <option v-for="school in formData.schools" :key="school.id" :value="school.id">{{ school.name }}</option>
              </select>
          </div>

          <div class="mt-3" v-if="formData.templates">
              <h2 class="mb-3 mt-4">Existing Templates:
                <!-- <button v-if="user.hasPermission('EVENTS_TEMP_C', formData.school)" class="btn btn-outline-secondary float-end hiddenOnMobile" @click="createTemplate()">Create New Template</button> -->
              </h2>
              <LoadingSpinner :isLoading="loading" color="primary" />
              <div id="template-container">
                <div v-for="template in formData.templates" :key="template" class="template">
                  <div @click="viewEventTemplateDetails(template)">
                    <span>{{ template.heading }}</span>
                  </div>
                </div>
                <div v-if="formData.templates.length < 1" id="no-template">No event templates have been created</div>
              </div>
            <p v-if="mobileFormat" class="warning">Templates cannot be created or edited on a mobile device.</p>
          </div>
          
        </section>
      </div>

      <div class="col col-12 col-md-6">
        <section>
          <div id="info-container">
            <div v-if="formData.selected_Template != ''">
              <div>
                <h2>{{ formData.selected_Template.heading }}</h2>
                <p>{{ formData.selected_Template.description }}</p>
                <p>{{ formData.selected_Template.notes }}</p>
                <!-- <pre>{{ formData.selected_Template }}</pre> -->
              </div>
              <button class="btn btn-primary hiddenOnMobile" @click="routeChange('EventTemplateDetails')">Manage Template</button>
            </div>
            <div v-else class="text-center text-grey w-100" style="text-align: center; transform: translateY(45%);">
              <p>No Template Selected</p>
            </div>
          </div>
        </section>
      </div>

    </div>

  </div>
</template>

<script setup>
import useApi from '/resources/js/composables/useApi';
import HeaderLine from '/resources/js/components/Layouts/MainLayout/Elements/HeaderLine.vue';
import { ref, watch } from 'vue';
import { useUserStore } from '/resources/js/stores/user';
import { useWindowSize } from '/resources/js/composables/useWindowSize';
import { useRouter } from 'vue-router';
import { useEventStore } from '/resources/js/stores/events';
import { useModalStore } from '/resources/js/stores/modal';
import { useSchoolStore } from '/resources/js/stores/schools';
import { useActionsStore } from '/resources/js/stores/actions';
import LoadingSpinner from '../../../../components/Layouts/MainLayout/Elements/LoadingSpinner.vue';

// Initiate Stores
const user = useUserStore()
const eventStore = useEventStore()
const modal = useModalStore()
const schoolStore = useSchoolStore()
const actions = useActionsStore()

// Initiate Composables
const router = useRouter()
const { mobileFormat } = useWindowSize()

// Initiate Data Variables
const formData = ref({
  schools: [],
  school: '',
  templates: [],
  selected_Template: ''
})
const loading = ref(false)

function setActions(){
  let actionsArray = []
  // console.log(mobileFormat.value);
  if(user.hasPermissionAny('EVENT_TEMP_C') && !mobileFormat.value){
    actionsArray.push({ header: 'Create New Template', to: { name: 'TemplateList' }, modal: 'CreateTemplate', icon: 'fa-solid fa-add'})
  }
  actions.setItems(actionsArray)
}
setActions()

// Fetch user schools or set default school if only one exists for user
const {data: schools, fetchData: fetchSchools} = useApi('schools')
fetchSchools().then(()=>{
  setSchools()
})

function setSchools(){
  schools.value.forEach(school => {
    if(user.hasPermission('EVENT_TEMP_C', school.id)){
      formData.value.schools = [...formData.value.schools, school]
    }
  });
  formData.value.school = formData.value.schools[0].id
}

// Fetch school templates when school is selected
watch(() => formData.value.school, (newValue) => {
  schoolStore.setSchool(...schools.value.filter(s => s.id == newValue).id)
  if(formData.value.school != ''){
    loading.value = true
    const {data, fetchData} = useApi('event-school-jobs/templates/' + newValue)
    fetchData()
    .then(()=>{
      loading.value = false
      formData.value.templates = data.value
      formData.value.selected_Template = ''
    })
    .catch(e => {
      loading.value = false
    })
  }else formData.value.templates = []
})


function viewEventTemplateDetails(template){
  formData.value.selected_Template = template
  eventStore.setEventData(template)
}

// Handle Route Change
function routeChange(route){
  router.push({
    name: route
  })
}


</script>

<style lang="scss" scoped>
h2 {
  font-size: 1.5rem;
}
h3 {
  font-size: 1.25rem;
}
.template {
  border-radius: 0.375rem;
  padding: 10px 10px;

  &:nth-child(odd) {
    background-color: $ah-primary-background;
  }
  &:hover {
    background-color: $ah-primary;
    color: white;
    cursor: pointer;
  }
}
#no-template {
  padding: 10px;
}
.create {
  width: 100%;
}
#info-container {
  display: flex;
  border: 1px solid $ah-grey;
  padding: 10px;
  border-radius: 0.375rem;
  min-height: 250px;
}
.hiddenOnMobile {
  visibility: visible;
}
.warning {
  color: $ah-red;
  background-color: lighten($ah-red-background, 5%);
  border: 1px dashed $ah-red;
  padding: 10px;
  border-radius: 0.375rem;
}

@media (max-width: 768px){
  .hiddenOnMobile {
    visibility: hidden;
  }
}

</style>