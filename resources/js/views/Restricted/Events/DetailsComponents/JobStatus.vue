<template>
  <EventJobStatusIconsSVG :status="job.status" class="icon" @click="toggleStatus()" />
</template>

<script setup>
import EventJobStatusIconsSVG from '../../../../components/Layouts/MainLayout/Elements/SVG/EventJobStatusIconsSVG.vue';
import { useEventStore } from '../../../../stores/events';
import { useUserStore } from '../../../../stores/user';
import useApi from '../../../../composables/useApi';
import { useToastStore } from '../../../../stores/toast';

const props = defineProps({job: Object})
const eventStore = useEventStore()
const user = useUserStore()
const toast = useToastStore()

// Handle job click to change status
function toggleStatus(){
  let original_status = props.job.status
  props.job.status = 2
  if(eventStore.getEvent.attributes.archived == 0){
    if(user.hasPermission('EVENTS_E', eventStore.getEvent.school.id) || props.job.users.some(u => u.attributes.id == user.attributes.id)){
        let status = original_status == 0 ? 1 : 0
        const { data, fetchData } = useApi(`event-jobs/${props.job.id}`, {status: status}, 'PATCH')
        fetchData().then(()=>{
            eventStore.updateEventJobRecord(data.value.data)
        })
    } else {
      props.job.status = original_status
      toast.open('info', 'Unable To Edit Job Status.', 'You do not have required permissions to edit this job status.')
    }
  } else {
    props.job.status = original_status
    toast.open('info', 'Unable To Edit Job Status.', 'Edits are not available for archived events.')
  }
}

</script>

<style lang="scss" scoped>
.icon {
  max-width: 45px;
}
</style>