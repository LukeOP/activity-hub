<template>
    <div>
      <HeaderLine heading="Assign Event Job" />
      <div class="job-description">
          <p>{{ eventStore.getSingleJob.description }}</p>
          <p>{{ eventStore.getSingleJob.due_date }}</p>
      </div>
        <div class="row">
          <p>Event jobs can be assigned to linked staff, enabling them to mark when it is completed.</p>
          <div class="mb-3">
            <h3>Staff Assigned To This Job:</h3>
            <div style="display: flex; flex-wrap: wrap;" v-if="eventStore.getSingleJob.users.length > 0">
              <div v-for="(staff, index) in eventStore.getSingleJob.users" :key="index" class="linkedStaff" @click="unassignStaff(staff)">
                <AvatarName :user="staff" :hover="false" style="margin-right: 1rem; margin-bottom: 0.5rem;" />
              </div>
            </div>
            <div v-else>No staff assigned to this job.</div>
          </div>
          <div v-if="hasEditingPermissions">
            <h3>Available Staff To Assign:</h3>
            <div style="display: flex; justify-content: space-between; align-items: flex-end;">
              <label aria-label="Available Staff">
                <select class="form-control" v-model="formData.user_id" v-if="availableStaff.length > 0">
                  <option v-for="(staff, index) in availableStaff" :key="index" :value="staff.attributes.id">{{ staff.attributes.first_name }} {{ staff.attributes.last_name }}</option>
                </select>
                <p v-else>There are no other available staff.</p>
              </label>
              <button class="btn btn-primary" @click="assignStaff" :disabled="formData.user_id == ''" style="max-height: 40px;">Assign Job</button>
            </div>
          </div>
  
        </div>
    </div>
  </template>
  
  <script setup>
  import { useEventStore } from '/resources/js/stores/events';
  import { onMounted, computed, ref } from 'vue';
  import HeaderLine from '../../../../components/Layouts/MainLayout/Elements/HeaderLine.vue';
  import { useStaffStore } from '../../../../stores/staff';
import { useUserStore } from '../../../../stores/user';
import AvatarName from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarName.vue';
import useSorter from '../../../../composables/useSorter';
import useApi from '../../../../composables/useApi';
import { useModalStore } from '../../../../stores/modal';
  
  // Initiate Stores
  const eventStore = useEventStore()
  const staffStore = useStaffStore()
  const user = useUserStore()
  const modal = useModalStore()

  // Initiate Composables
  const sorter = useSorter()
  
  // Initiate Variables
  const availableStaff = computed(() => {
    let staffList = eventStore.getLinkedStaff
    let linkedStaff = eventStore.getSingleJob.users
    staffList = staffList.filter(staff => 
        !linkedStaff.some(linked => linked.attributes.id === staff.attributes.id)
    );
    sorter.sort(staffList, 'attributes.last_name');
    return staffList;
  });


const hasEditingPermissions = computed(() => {
  return user.hasPermission('EVENTS_E', eventStore.getEvent.school.id)
})

  const formData = ref({
    event_id: eventStore.getEvent.id,
    event_job_id: eventStore.getSingleJob.id,
    user_id: ''
  })

  function assignStaff(){
    const {data, fetchData} = useApi('event-job-users', formData.value, 'POST', true)
    fetchData().then(()=>{
      eventStore.updateEventJobRecord(data.value.data)
    })
  }
  function unassignStaff(staff){
    const {fetchData} = useApi('event-job-users/' + staff.id, null, 'DELETE', true)
    fetchData().then(() => {
      eventStore.removeEventJobUser(staff)
    })
  }


  onMounted(() => {
    staffStore.fetchStaff(eventStore.getEvent.school.id)
  })
  
  </script>
  
  <style lang="scss" scoped>
  .job-description {
    display: flex;
    justify-content: space-between;
    background-color: $ah-primary-light;
    color: white;
    padding: 5px 10px;
    margin-bottom: 1rem;
    p {
        margin: 0;
    }
  }
  label {
    width: 50%;
  }
  .linkedStaff {
    &:hover {
      text-decoration: line-through;
      cursor: default;
    }
  }
  </style>