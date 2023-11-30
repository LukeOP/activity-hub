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
                <button v-if="user.hasPermission('EVENTS_TEMP_C', formData.school)" class="btn btn-outline-secondary float-end" @click="createTemplate()">Create New Template</button>
              </h2>
              <div id="template-container">
                <div v-for="template in formData.templates" :key="template">
                  <div class="template" @click="viewTemplateDetails(template)">
                    <span>{{ template.heading }}</span>
                  </div>
                </div>
                <div v-if="formData.templates.length < 1" id="no-template">No event templates have been created</div>
              </div>
            <p v-if="windowSize.width < 1030">Templates cannot be created or edited on a mobile device.</p>
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
              <button class="btn btn-primary" style="position: absolute; bottom: 25px;" @click="routeChange('TemplateDetails')">Manage Template</button>
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

// Initiate Stores
const user = useUserStore()
const eventStore = useEventStore()
const modal = useModalStore()
const schoolStore = useSchoolStore()

// Initiate Composables
const router = useRouter()
const { windowSize } = useWindowSize()

// Initiate Data Variables
const formData = ref({
  schools: [],
  school: '',
  templates: [],
  selected_Template: ''
})

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
  formData.value.school =formData.value.schools[0].id
}

// Fetch school templates when school is selected
watch(() => formData.value.school, (newValue) => {
  if(formData.value.school != ''){
    const {data, fetchData} = useApi('event-school-jobs/templates/' + newValue)
    fetchData().then(()=>{
      formData.value.templates = data.value
      formData.value.selected_Template = ''
    })
  }else formData.value.templates = []
})


function viewTemplateDetails(template){
  formData.value.selected_Template = template
  eventStore.setEventData(template)
}

function createTemplate(){
  schoolStore.setSchool(formData.value.school)
  modal.open('CreateTemplate')
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
  padding: 1px 10px;
  background-color: $ah-primary-light;
  border-radius: 0.375rem;
  padding: 5px 10px;
  color: white;
  margin-bottom: 0.5rem;
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

</style>