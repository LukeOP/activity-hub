<template>
    <tr style="position: relative;" :class="{overdue: isOverdue}">
      <td>{{ job.description }} {{ isOverdue ? '[OVERDUE]' : '' }}</td>
      <td style="width: 150px;">
        <AvatarStack :users="job.users" style="color: black;" />
      </td>
      <td style="width: 150px;">{{ moment(job.due_date).format('DD-MM-YYYY') }}</td>
      <td style="width: 60px;">
        <div style="width: 40px; cursor: pointer;" @click="toggleStatus(job)">
          <StatusIconSVG :status="getStatus(job)" />
        </div>
      </td>
      <td style="width: 40px; cursor: pointer;" @mouseover="dropdownOptions = true" @mouseleave="dropdownOptions = false" >
        <i v-if="user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) && !eventStore.getEvent.attributes.archived" class="fa-solid fa-ellipsis-vertical"></i>
        <div v-if="dropdownOptions && user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) && !eventStore.getEvent.attributes.archived" class="dropdown-options">
            <span @click="openModal('EventJobAssign')">Assign</span>
            <span @click="openModal('EventJobEdit')">Edit</span>
            <span @click="openModal('EventJobDelete')">Delete</span>
        </div>
    </td>
    </tr>
</template>

<script setup>
import moment from 'moment';
import StatusIconSVG from '../../../../components/Layouts/MainLayout/Elements/SVG/StatusIconSVG.vue';
import AvatarStack from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarStack.vue';
import useApi from '../../../../composables/useApi';
import { computed, ref } from 'vue';
import { useModalStore } from '../../../../stores/modal';
import { useEventStore } from '../../../../stores/events';
import { useUserStore } from '../../../../stores/user';
import { useToastStore } from '../../../../stores/toast';

const props = defineProps({job:Object})
const dropdownOptions = ref(false)
const modal = useModalStore()
const eventStore = useEventStore()
const user = useUserStore()
const toast = useToastStore()

function getStatus(job){
  let status = 'pending'
  let today = moment().format('YYYY-MM-DD')
  job.due_date <= today ? status = 'incomplete' : status = 'pending'
  return job.status == '0' ? status : 'complete'
}

// Handle job click to change status
function toggleStatus(job){
  if(!eventStore.getEvent.attributes.archived){
    if(user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) || props.job.users.some(u => u.attributes.id == user.attributes.id)){
        let status = job.status == 0 ? 1 : 0
        const { data, fetchData } = useApi(`event-jobs/${job.id}`, {status: status}, 'PATCH')
        fetchData().then(()=>{
            eventStore.updateEventJobRecord(data.value.data)
        })
    } else {
        toast.open('info', 'Unable To Edit Job Status.', 'You do not have permission to edit this status.')
    }
  } else {
      toast.open('info', 'Unable To Edit Job Status.', 'Edits are not available for archived events.')
  }
}

function openModal(type){
    eventStore.setSingleJob(props.job)
    modal.open(type)
}

const isOverdue = computed(() => {
    let today = moment().format('YYYY-MM-DD')
    return (props.job.due_date < today && props.job.status == 0)
})

</script>

<style lang="scss" scoped>
.dropdown-options {
  position: absolute;
  transform: translateX(-50%);
  background-color: #f2f2f2;
  box-shadow: 0px 0px 5px $ah-grey-light;
  display: flex;
  flex-direction: column;
  border-radius: 0.25rem;
  z-index: 9999;
  color: black;
  span {
    padding: 3px 10px;
    min-width: 100px;
    width: fit-content;
    &:hover {
        background-color: #eaeaea;
    }
  }
}
.overdue {
  background-color: #fdefef;
  color: #C50023;
  &:hover {
  background-color: #fde0e0;
  }
}
</style>