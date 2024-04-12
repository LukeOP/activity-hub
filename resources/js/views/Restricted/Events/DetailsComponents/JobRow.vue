<template>
    <tr style="position: relative;" :class="{overdue: isOverdue}">
      <td>{{ job.description }} {{ isOverdue ? '[OVERDUE]' : '' }}</td>
      <td style="width: 150px;">
        <AvatarStack :users="job.users" style="color: black;" />
      </td>
      <td style="width: 150px;">{{ moment(job.due_date).format('DD-MM-YYYY') }}</td>
      <td style="width: 60px;">
        <JobStatus :job="job" />
      </td>
      <td style="width: 40px; cursor: pointer;" @mouseover="dropdownOptions = true" @mouseleave="dropdownOptions = false" >
        <i v-if="user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) && eventStore.getEvent.attributes.archived == 0" class="fa-solid fa-ellipsis-vertical"></i>
        <div v-if="dropdownOptions && user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) && eventStore.getEvent.attributes.archived == 0" class="dropdown-options">
            <span @click="openModal('EventJobAssign')">Assign</span>
            <span @click="openModal('EventJobEdit')">Edit</span>
            <span @click="openModal('EventJobDelete')">Delete</span>
        </div>
    </td>
    </tr>
</template>

<script setup>
import moment from 'moment';
import AvatarStack from '../../../../components/Layouts/MainLayout/Elements/Avatars/AvatarStack.vue';
import { computed, ref } from 'vue';
import { useModalStore } from '../../../../stores/modal';
import { useEventStore } from '../../../../stores/events';
import { useUserStore } from '../../../../stores/user';
import JobStatus from './JobStatus.vue';

const props = defineProps({job:Object})
const dropdownOptions = ref(false)
const modal = useModalStore()
const eventStore = useEventStore()
const user = useUserStore()


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