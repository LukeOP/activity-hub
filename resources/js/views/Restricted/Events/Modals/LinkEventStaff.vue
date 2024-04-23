<template>
    <div>
      <HeaderLine heading="Event Staff Access" />
        <div class="row">
          <p>Linked staff are able to view specific event details. Use this functionality to link staff who would otherwise not be involved in event management. E.g., an instrument tutor who needs to know about Prize Giving.</p>
          <div class="mb-3">
            <h3>Users With Access Based on User Permission Level:</h3>
            <div style="display: flex; flex-wrap: wrap;">
              <div v-for="(staff, index) in permittedStaff" :key="index">
                <AvatarName :user="staff" :hover="false" style="margin-right: 1rem; margin-bottom: 0.5rem;" />
              </div>
            </div>
          </div>
          <div class="mb-3">
            <h3>Staff Linked To This Event:</h3>
            <div style="display: flex; flex-wrap: wrap;" v-if="linkedStaff.length > 0">
              <div v-for="(staff, index) in linkedStaff" :key="index" class="linkedStaff" @click="unlinkStaff(staff)">
                <AvatarName :user="staff" :hover="false" style="margin-right: 1rem; margin-bottom: 0.5rem;" />
              </div>
            </div>
            <div v-else>No additional linked staff.</div>
          </div>
          <div v-if="hasEditingPermissions">
            <h3>Available Staff Not Linked:</h3>
            <div style="display: flex; justify-content: space-between; align-items: flex-end;">
              <label aria-label="Available Staff">
                <select class="form-control" v-model="formData.user_id" v-if="filteredStaffList.length > 0">
                  <option v-for="(staff, index) in filteredStaffList" :key="index" :value="staff.id">{{ staff.full_name }}</option>
                </select>
                <p v-else>There are no other available staff.</p>
              </label>
              <button class="btn btn-primary" @click="linkStaff" style="max-height: 40px;" :disabled="formData.user_id == ''">Link Staff Member</button>
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
  
  // Initiate Stores
  const eventStore = useEventStore()
  const staffStore = useStaffStore()
  const user = useUserStore()

  // Initiate Composables
  const sorter = useSorter()
  
  // Initiate Variables
  const filteredStaffList = computed(() => {
    let staffList = staffStore.getStaffList
    staffList = staffList.filter(staff => !linkedStaff.value.some(linkedStaff => linkedStaff.attributes.id === staff.id))
    staffList = staffList.filter(staff => !permittedStaff.value.some(permittedStaff => permittedStaff.attributes.id === staff.id))
    sorter.sort(staffList, 'last_name');
    return staffList
  })

  const permittedStaff = computed(() => {
    let linkedStaffList = []
    staffStore.getStaffList.forEach(staff => {
      let schoolPermissions = staff.permissions.filter(p => p.school_id == eventStore.getEvent.school.id)
      if(schoolPermissions.some(p => (p.type == 'EVENTS_V' || p.type == 'Administrator'))) {
        linkedStaffList.push({attributes: {id: staff.id, first_name: staff.first_name, last_name: staff.last_name, image: staff.image}})
      }
    });
    sorter.sort(linkedStaffList, 'attributes.last_name')
    return linkedStaffList
  })

const linkedStaff = computed(() => {
  let linkedStaffList = []

  eventStore.getLinkedStaff.forEach(staff => {
    if(eventStore.getEvent.users.some(u => u.id == staff.attributes.id)){
      linkedStaffList.push({attributes: {id: staff.attributes.id, first_name: staff.attributes.first_name, last_name: staff.attributes.last_name, image: staff.attributes.image, 
        linked_id: eventStore.getEvent.users.find(u => u.id == staff.attributes.id).event_user_id}})
    }
  })
  sorter.sort(linkedStaffList, 'attributes.last_name')
  return linkedStaffList
})

const hasEditingPermissions = computed(() => {
  return user.hasPermission('EVENTS_E', eventStore.getEvent.school.id)
})

  const formData = ref({
    event_id: eventStore.getEvent.id,
    user_id: ''
  })

  function linkStaff(){
    const {data, fetchData} = useApi('event-users', formData.value, 'POST', true)
    fetchData().then(()=>{
      eventStore.updateEventRecord(data.value.data)
    })
  }
  function unlinkStaff(staff){
    const {data, fetchData} = useApi('event-users/' + staff.attributes.linked_id, null, 'DELETE', true)
    fetchData().then(() => {
      eventStore.updateEventRecord(data.value.data)
    })
  }


  onMounted(() => {
    staffStore.fetchStaff(eventStore.getEvent.school.id)
  })
  
  </script>
  
  <style lang="scss" scoped>
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